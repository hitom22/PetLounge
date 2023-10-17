package com.lounge.pet.support.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.support.domain.SupportReply;

public interface SupportService {

	/**
	 * 후원글 등록 Service
	 * @param support
	 * @return int 
	 */
	int insertSupport(Support support);

	/**
	 * 후원글 상세 조회 Service
	 * @param sNo
	 * @return Support
	 */
	Support selectSupportByNo(int sNo);

	/**
	 * 후원글 수정 Service
	 * @param support
	 * @return int 
	 */
	int updateSupport(Support support);

	/**
	 * 후원 내역 갯수 조회 Service
	 * @param sNo
	 * @return int
	 */
	int getHistoryCount(int sNo);

	/**
	 * 후원글 삭제 Service
	 * @param sNo
	 * @return int
	 */
	int deleteSupport(int sNo);

	/**
	 * 후원댓글 등록 Service
	 * @param sReply
	 * @return int
	 */
	int insertReply(SupportReply sReply);

	/**
	 * 후원댓글 조회 Service
	 * @param sNo
	 * @return List
	 */
	List<SupportReply> selectSReplyList(int sNo);

	/**
	 * 후원댓글 갯수 조회 Service
	 * @return int 
	 */
	int getReplyListCount(int sNo);

	/**
	 * 후원댓글 삭제 Service
	 * @param sRNo
	 * @return int 
	 */
	int deleteReply(int sRNo);

	/**
	 * 후원댓글 수정 Service
	 * @param sReply
	 * @return int
	 */
	int updateReply(SupportReply sReply);

	/**
	 * 후원글 카테고리별 조회 Service
	 * @param keyword
	 * @return List 
	 */
	List<Support> selectSupportList(Map<String, String> sMap);

	/**
	 * 후원글 검색 갯수 조회 Service
	 * @param keyword
	 * @return
	 */
	int getSearchCount(Map<String, String> sMap);

	/**
	 * 후원 내역 등록 Service
	 * @param sHistory
	 * @return int
	 */
	int insertHistory(SupportHistory sHistory);

	/**
	 * 후원 금액, 인원 추가 Service 
	 * @param sOne
	 * @return int 
	 */
	int updateSupportFund(Support sOne);

	/** 
	 * 후원 여부 확인 Service
	 * @param sHistory
	 * @return int
	 */
	int getCountSHistory(SupportHistory sHistory);

	/**
	 * 후원 내역 조회 Service
	 * @param sNo
	 * @return List
	 */
	List<SupportHistory> selectSHistoryList(int sNo);


	/**
	 * 오늘 후원 내역 조회 Service
	 * @return SupportHistory
	 */
	SupportHistory selectTodaySupport();


	

}
