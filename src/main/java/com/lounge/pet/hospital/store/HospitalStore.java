package com.lounge.pet.hospital.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;

public interface HospitalStore {

	/**
	 * 동물병원 리뷰 등록 Store
	 * @param session
	 * @param hReview
	 * @return
	 */
	int insertHosReview(SqlSession session, HReview hReview);

	/**
	 * 즐겨찾기 등록 Store
	 * @param session
	 * @param userBook
	 * @return
	 */
	int insertHBook(SqlSession session, HBookmark userBook);

	/**
	 * EPSG:2097 좌표를 위경도 좌표로 변환 Store
	 * @param session
	 * @param hosLocation
	 * @return
	 */
	int updateXYtoLatLng(SqlSession session, Hospital hosLocation);

	/**
	 * 즐겨찾기 제거 Store
	 * @param session
	 * @param userBook
	 * @return
	 */
	int deleteHBook(SqlSession session, HBookmark userBook);

	/**
	 * 번호로 동물병원 조회 Store
	 * @param session
	 * @param hNo
	 * @return
	 */
	Hospital selectOneByhNo(SqlSession session, int hNo);

	/**
	 * 회원 아이디, 동물병원 번호로 즐겨찾기 목록 조회 Store
	 * @param session
	 * @param userBook
	 * @return
	 */
	HBookmark selectHBook(SqlSession session, HBookmark userBook);

	/**
	 * 기본 주소 기준으로 동물병원 5개 불러오기 Store
	 * @param session
	 * @param userLocation
	 * @return
	 */
	List<Hospital> selectFiveHos(SqlSession session, Hospital userLocation);

	/**
	 * 검색어로 동물병원 5개 불러오기 Store
	 * @param session
	 * @param userSearchLocation
	 * @return
	 */
	List<Hospital> selectFiveByKeyword(SqlSession session, Hospital userSearchLocation);

	/**
	 * 동물병원 전체 리스트 Store
	 * @param session
	 * @return
	 */
	List<Hospital> selectAllList(SqlSession session);

}
