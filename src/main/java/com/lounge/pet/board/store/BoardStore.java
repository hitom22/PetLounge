package com.lounge.pet.board.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.board.domain.Board;

public interface BoardStore {

	/**
	 * 게시글 조회
	 * @param session
	 * @return
	 */
	List<Board> selectFreeBoardList(SqlSession session);

	/**
	 * 게시글 전체 개수 조회
	 * @param session
	 * @param fMap
	 * @return
	 */
	int getSearchCount(SqlSession session, Map<String, String> fMap);



}
