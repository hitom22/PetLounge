package com.lounge.pet.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;

	// 비밀번호 재확인 페이지 user/checkPw.do
	@RequestMapping(value = "/user/checkPw.do", method = RequestMethod.GET)
	public ModelAndView checkPwPage(ModelAndView mv) {
		mv.setViewName("/user/userCheckPw");
		return mv;
	}

	// 회원탈퇴 페이지 user/delete.do
	@RequestMapping(value = "/user/delete.do", method = RequestMethod.GET)
	public ModelAndView userDeletePage(ModelAndView mv) {
		mv.setViewName("/user/userDelete");
		return mv;
	}

	// 아이디,비밀번호 찾기 페이지 user/idpwFind.do
	@RequestMapping(value = "/user/idpwFind.do", method = RequestMethod.GET)
	public ModelAndView userIdPwPage(ModelAndView mv) {
		mv.setViewName("/user/userFind");
		return mv;
	}

	// 회원정보조회 페이지 user/userInfo.do
	@RequestMapping(value = "/user/userInfo.do", method = RequestMethod.GET)
	public ModelAndView userInfoPage(ModelAndView mv) {
		mv.setViewName("/user/userInfo");
		return mv;
	}

	// 로그인 페이지 user/login.do
	@RequestMapping(value = "/user/login.do", method = RequestMethod.GET)
	public ModelAndView userLoginPage(ModelAndView mv) {
		mv.setViewName("/user/userLogin");
		return mv;
	}

	// 회원정보수정 페이지 user/update.do
	@RequestMapping(value = "/user/update.do", method = RequestMethod.GET)
	public ModelAndView userUpdatePage(ModelAndView mv) {
		mv.setViewName("/user/userUpdate");
		return mv;
	}

	// 회원가입 페이지 user/register.do
	@RequestMapping(value = "/user/register.do", method = RequestMethod.GET)
	public ModelAndView userRegisterPage(ModelAndView mv) {
		mv.setViewName("/user/userRegister");
		return mv;
	}


	
	//회원가입 user/register.do
	@RequestMapping(value = "/user/register.do", method = RequestMethod.POST)
	@ResponseBody // JSON 응답 반환
	public Map<String, Object> userRegister(@ModelAttribute User user, 
	    @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, 
	    HttpServletRequest request, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();

	    try {
	        if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
	            // 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
	            // 여러가지 데이터를 받아서 리턴하기 위해 Map 사용
	            Map<String, Object> bMap = this.saveFile(request, uploadFile);

	            user.setuFileName((String) bMap.get("fileName"));
	            user.setuFileReName((String) bMap.get("fileRename"));
	            user.setuFilePath((String) bMap.get("filePath"));
	            user.setuFileLength((long) bMap.get("fileLength"));
	        }

	        int result = uService.userRegister(user);
	        if (result > 0) {
	            response.put("success", true);
	        } else {
	            response.put("fail", false);
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	        response.put("fail", false);
	        response.put("error", e.getMessage());
	    }

	    return response;
	}
	
	
	
	
	// 나의 게시글 페이지 user/searchBoard.do
	@RequestMapping(value = "/user/searchBoard.do", method = RequestMethod.GET)
	public ModelAndView userBoardPage(ModelAndView mv) {
		mv.setViewName("/user/uBoardList");
		return mv;
	}

	// 나의 북마크 페이지 user/searchBoardMark.do
	@RequestMapping(value = "/user/searchBoardMark.do", method = RequestMethod.GET)
	public ModelAndView userBookMarkPage(ModelAndView mv) {
		mv.setViewName("/user/uBoardMarkList");
		return mv;
	}

	// 나의 자유게시판 댓글 페이지 user/searchBoardReply.do
	@RequestMapping(value = "/user/searchBoardReply.do", method = RequestMethod.GET)
	public ModelAndView userBoardReplyPage(ModelAndView mv) {
		mv.setViewName("/user/uBoardReplyList");
		return mv;
	}

	// 나의 즐겨찾는 병원 페이지 user/searchHospital.do
	@RequestMapping(value = "/user/searchHospital.do", method = RequestMethod.GET)
	public ModelAndView userHospitalPage(ModelAndView mv) {
		mv.setViewName("/user/uHospitalList");
		return mv;
	}

	// 나의 병원 리뷰 페이지 user/searchHospitalReview.do
	@RequestMapping(value = "/user/searchHospitalReview.do", method = RequestMethod.GET)
	public ModelAndView userHospitalReviewPage(ModelAndView mv) {
		mv.setViewName("/user/uHospitalReviewList");
		return mv;
	}

	// 나의 후원목록 페이지 user/searchSponsor.do
	@RequestMapping(value = "/user/searchSponsor.do", method = RequestMethod.GET)
	public ModelAndView userSponsorPage(ModelAndView mv) {
		mv.setViewName("/user/uSponsorList");
		return mv;
	}

	// 나의 후원댓글 페이지 user/searchSponsorReply.do
	@RequestMapping(value = "/user/searchSponsorReply.do", method = RequestMethod.GET)
	public ModelAndView userSponsorReplyPage(ModelAndView mv) {
		mv.setViewName("/user/uSponsorReplyList");
		return mv;
	}
	
	
	
private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		//resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//파일 저장 경로 구하기
		String savePath = root + "\\userUploadFiles";
		
		//파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		
		//파일 확장자 구하기
		String extension 
		= fileName.substring(fileName.lastIndexOf(".")+1);
		
		//시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()));
		
		//파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		
		//파일저장
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		
		//파일정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/userUploadFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}	
	

}
