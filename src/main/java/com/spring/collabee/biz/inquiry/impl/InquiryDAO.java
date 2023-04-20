package com.spring.collabee.biz.inquiry.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.faq.FaqVO;
import com.spring.collabee.biz.inquiry.InquiryVO;


@Repository
public class InquiryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public InquiryDAO() {
		System.out.println(">> InquiryDAO() 객체 생성");
	}
	
	//1:1문의 전체 리스트
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		System.out.println("===> MyBatis 사용  getInquiryList(vo) 실행");
		return mybatis.selectList("inquiryDAO.getInquiryList", vo);
	}
	
	//1:1문의 하나 조회
	public InquiryVO getInquiry(InquiryVO vo) {
		System.out.println("getFaq() 실행");
		return mybatis.selectOne("inquiryDAO.getInquiry", vo);
	}	

	//FAQ 입력
	public void insertInquiry(InquiryVO vo) {
		System.out.println("insertFaq() 실행");
		mybatis.insert("inquiryDAO.insertInquiry", vo);
	}
	
	//1:1문의 답변
	public void answerInquiry(InquiryVO vo) {
		System.out.println("answerInquiry() 실행");
		mybatis.update("inquiryDAO.answerInquiry", vo);
	}
	


}
