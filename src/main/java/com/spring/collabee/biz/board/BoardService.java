package com.spring.collabee.biz.board;

import java.util.List;

public interface BoardService {
	//공지사항
	void insertNotice(BoardVO vo);
	void updateNotice(BoardVO vo);
	void deletNotice(BoardVO vo);
	BoardVO getNotice(BoardVO vo);
	List<BoardVO> getNoticeList(BoardVO vo);
}
