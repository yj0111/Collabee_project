package com.spring.collabee.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.board.BoardVO;


@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardDAO() {
		System.out.println(">> BoardDAO() 객체 생성");
	}
	
	//공지사항 전체리스트 보기 
	public List<BoardVO> getNoticeList(BoardVO vo) {
		System.out.println("===> MyBatis 사용  getNoticeList(vo) 실행");
		return mybatis.selectList("boardDAO.getNoticeList", vo);
	}
	
	//공지사항 상세보기
	public BoardVO getNotice(BoardVO vo) {
		System.out.println("getNotice() 실행");
		return mybatis.selectOne("boardDAO.getNotice", vo);
	}	

	//공지사항 입력
	public void insertNotice(BoardVO vo) {
		System.out.println("insertNotice() 실행");
		mybatis.insert("boardDAO.insertNotice", vo);
	}
	
	//공지사항 수정
	public void updateNotice(BoardVO vo) {
		System.out.println("updateNotice() 실행");
		mybatis.update("boardDAO.updateNotice", vo);
	}
	
	//공지사항 삭제
	public void deleteNotice(BoardVO vo) {
		System.out.println(" deleteNotice() 실행");
		mybatis.delete("boardDAO.deleteNotice", vo);
	}
	
}
