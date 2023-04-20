package com.spring.collabee.biz.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.faq.FaqVO;



@Repository
public class FaqDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FaqDAO() {
		System.out.println(">> FaqDAO() 객체 생성");
	}

	//FAQ 카테고리별 전체리스트 보기 
	public List<FaqVO> getFaqList(String faqType) {
		System.out.println("===> MyBatis 사용  getFaqList(vo) 실행");
		return mybatis.selectList("faqDAO.getFaqList", faqType);
	}
	
	//FAQ 상세보기
	public FaqVO getFaq(FaqVO vo) {
		System.out.println("getFaq() 실행");
		return mybatis.selectOne("faqDAO.getFaq", vo);
	}	

	//FAQ 입력
	public void insertFaq(FaqVO vo) {
		System.out.println("insertFaq() 실행");
		mybatis.insert("faqDAO.insertFaq", vo);
	}
	
	//FAQ 수정
	public void updateFaq(FaqVO vo) {
		System.out.println("updateFaq() 실행");
		mybatis.update("faqDAO.updateFaq", vo);
	}
	
	//FAQ 삭제
	public void deleteFaq(FaqVO vo) {
		System.out.println(" deleteFaq() 실행");
		mybatis.delete("faqDAO.deleteFaq", vo);
	}
	


}
