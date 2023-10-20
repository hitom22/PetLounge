package com.lounge.pet.board.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.service.BoardService;
import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.service.UserService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private UserService uService;
	
	
	/**
	 * 자유게시판 리스트 조회
	 */
	@RequestMapping(value = "/freeList.pet"
			, method = RequestMethod.GET)
	public ModelAndView showFreeBoardList1(ModelAndView mv ) {
		mv.setViewName("board/freeList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/freeList1.pet"
			, produces = "application/json; charset=utf-8"
			, method = RequestMethod.GET)
	public String showFreeBoardList(@RequestParam(defaultValue = "1") Integer currentPage
				, @RequestParam(defaultValue = "10") Integer recordCountPerPage
				, Model model) {
		try {
			// currentPage와 recordCountPerPage를 이용하여 페이징 처리
			// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
			int start = (currentPage - 1) * recordCountPerPage;
			int end = start + recordCountPerPage;
			
			int totalCount = bService.getSearchCount();
			model.addAttribute("totalCount", totalCount);
			
			Map<String, String> fMap = new HashMap();

			// 게시글 리스트 불러옴 
			List<Board> freeBoardList = bService.selectFreeBoardList();
			
	        // 각 게시글의 닉네임을 가져와 설정
	        for (Board board : freeBoardList) {
	            String uId = board.getuId(); // 게시글의 작성자 ID
	            User user = uService.selectOneById(uId);
	            if (user != null) {
	            	board.setfWriter(user.getuNickName()); // 게시글의 작성자 닉네임 설정
	            } else {
	            	board.setfWriter("UnKnown User"); // 게시글의 작성자 닉네임 설정	            	
	            }
	        }
			
			int totalSearchRecords = freeBoardList.size(); // 게시글의 총 갯수 
			// 범위 체크를 통해 부분 리스트 추출
			if (start < freeBoardList.size()) {
				end = Math.min(end, freeBoardList.size());
				// 범위에 해당하는 부분 리스트를 추출하여 sList에 대입
				freeBoardList  = freeBoardList.subList(start, end);  // 'subList' 메서드를 사용하여 'start'부터 'end'까지의 범위만큼 잘라냄
			} else {
				freeBoardList  = Collections.emptyList();	// Collections.emptyList() 는 빈(무엇도 포함하지 않는) 컬렉션 객체를 반환하는 역할을 하는 정적 메서드
			}

			// 전체 페이지 수 계산 (후원글의 총 갯수를 페이지당 글 갯수로 나눠서 계산) 
			int totalSearchPages = (int) Math.ceil((double) totalSearchRecords / recordCountPerPage); // 전체 페이지 수 
			
//			System.out.println("currentPage: " + currentPage + ", recordCountPerPage: " + recordCountPerPage);
//			System.out.println("searchList size: " + freeBoardList.size() + ", totalSearchRecords: " + totalSearchRecords + ", totalSearchPages: " + totalSearchPages);
			
					
			// 게시글 리스트와 전체 페이지 수를 Map에 담아서 보냄 
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("freeBoardList", freeBoardList);
			resultMap.put("totalSearchPages", totalSearchPages);
			
			Gson gson = new Gson();
			return gson.toJson(resultMap);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		
	}
	
	
	
	/**
	 * 자유게시글 상세 페이지로 이동
	 * @param mv
	 * @param board
	 * @param fNo
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/freeDetail.pet", method = RequestMethod.GET)
	public ModelAndView freeBoardDetailPage(ModelAndView mv
			, @ModelAttribute Board board
			, @RequestParam("fNo") int fNo
			, HttpSession session) {
		try { 
			Board bOne = bService.selectFreeBoardByNo(fNo);
			int result = bService.updateViewCount(bOne); 
			if(bOne != null) {
				mv.addObject("board", bOne);
				
				// 게시글 작성자의 U_ID를 세션에서 가져옴
				String uId = bOne.getuId();
				if (uId != null) {
					User user = uService.selectOneById(uId);
					 if (user != null) {
		                    String writerNickname = user.getuNickName();
		                    mv.addObject("uNickname", writerNickname); // 작성자의 닉네임을 추가
		                } else {
		                    // 사용자를 찾을 수 없을 때 처리
		                    mv.addObject("uNickname", "UnKnown User");
		                }
		            } else {
		                // U_ID가 없을 때 처리
		                mv.addObject("uNickname", "비회원");
		            }					
			
				
				mv.setViewName("board/freeDetail");
			} else {
				mv.addObject("msg", "데이터 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/board/freeList.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/board/freeList.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 자유게시글 작성 페이지로 이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/freeDetailSubmit.pet", method=RequestMethod.GET)
	public ModelAndView showfSubmitForm(ModelAndView mv) {
		mv.setViewName("board/freeDetailSubmit");
		return mv;
	}

	/**
	 * 새 자유게시글 등록
	 * @param mv
	 * @param board
	 * @param uploadFile
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/freeDetailSubmit.pet", method = RequestMethod.POST)
	public ModelAndView fSubmitForm(ModelAndView mv
			, @ModelAttribute Board board
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpSession session) {
	    String sanitizedContent = board.getfContent().replaceAll("<p>", "").replaceAll("</p>", "");
	    board.setfContent(sanitizedContent);
		try {
//			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
//				String sImageUrl = "image";
//				notice.setsImageUrl(sImageUrl);
//				System.out.println(notice.toString());
//			}
			// 현재 로그인한 사용자의 아이디 가져오기
	        String uId = (String) session.getAttribute("uId"); 
	        if (uId == null) {
				mv.addObject("msg", "글작성을 위해 로그인을 먼저 해주세요.");
				mv.addObject("url", "/board/freeList.pet");
				mv.setViewName("common/message");	        	
	        }
	        // 아이디 설정
	        board.setuId(uId);
	        
			int result = bService.submitFreeBoardForm(board);
			if(result > 0) {
				// 게시글이 성공적으로 등록되었을 때
				// 작성자의 닉네임을 설정
				User user = uService.selectOneById(uId);
				if(user != null) {
					board.setfWriter(user.getuNickName());
				} else {
					board.setfWriter("-");
				}
				mv.addObject("msg", "게시글이 등록되었습니다.");
				mv.addObject("url", "/board/freeList.pet");
				mv.setViewName("common/message");
			} else {
				mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
				mv.addObject("url", "/board/freeDetailSubmit.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/board/freeDetailSubmit.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}	
	
	/**
	 * 게시글 수정 페이지 이동
	 * @param mv
	 * @param fNo
	 * @return
	 */
	@RequestMapping(value="/freeDetailEdit.pet", method = RequestMethod.GET)
	public ModelAndView editFreeBoardPage(ModelAndView mv
			, @RequestParam int fNo) {
		try {
			Board bOne = bService.selectOneFreeBoardNo(fNo);
			mv.addObject("board", bOne);
			mv.setViewName("board/freeDetailEdit");			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/board/freeList.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}	
	
	/**
	 * 자유게시글 수정
	 * @param mv
	 * @param board
	 * @param uploadFile
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/freeDetailEdit.pet", method = RequestMethod.POST)
	public ModelAndView updateFreeBoardPage(ModelAndView mv
			,@ModelAttribute Board board
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request
			, @RequestParam int fNo) {
		try {			
	        // 게시글 번호를 Board 객체에 설정
	        board.setfNo(fNo);
	        
			int result = bService.updateFreeBoardPage(board);
			if(result > 0) {
				mv.addObject("msg", "공지글이 수정되었습니다.");
				mv.setViewName("redirect:/board/freeDetail.pet?fNo="+board.getfNo());
			} else {
				mv.addObject("msg", "공지글 수정이 완료되지 않았습니다.");
				mv.addObject("url", "/board/freeDetailEdit.pet?fNo="+board.getfNo());
				mv.setViewName("common/errorPage");
			} 
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/board/freeDetailEdit.pet?fNo="+board.getfNo());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}	
	
	/**
	 * 자유게시판 글 삭제
	 * @param mv
	 * @param fNo
	 * @return
	 */
	@RequestMapping(value="/fdelete.pet", method = RequestMethod.GET)
	public ModelAndView freeBoardDelete(ModelAndView mv
			, @RequestParam("fNo") int fNo) {
		try {
				int result = bService.freeBoardDelete(fNo);
				if(result > 0) {
					mv.addObject("msg", "게시글이 삭제되었습니다.");
					mv.addObject("url", "/board/freeList.pet");
					mv.setViewName("common/message");
				} else {
					mv.addObject("msg", "게시글 삭제가 완료되지 않았습니다.");
					mv.addObject("url", "/board/freeList.pet");
					mv.setViewName("common/message");
				}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/board/freeDetail.pet?fNo="+fNo);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}	
	
	
   
}
