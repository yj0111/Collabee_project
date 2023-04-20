package com.spring.collabee.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.board.BoardService;
import com.spring.collabee.biz.board.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired 
	private BoardDAO boardDao;
	
	public BoardServiceImpl() {
	System.out.println(">> BoardServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertNotice(BoardVO vo) {
		boardDao.insertNotice(vo);
	}
	
	@Override
	public void updateNotice(BoardVO vo) {
		boardDao.updateNotice(vo);
	}
	
	@Override
	public void deletNotice(BoardVO vo) {
		boardDao.deleteNotice(vo);
	}
	
	@Override
	public BoardVO getNotice(BoardVO vo) {
		return boardDao.getNotice(vo);
	}
	
	@Override
	public List<BoardVO> getNoticeList(BoardVO vo) {
		return boardDao.getNoticeList(vo);
	}
	
	}
