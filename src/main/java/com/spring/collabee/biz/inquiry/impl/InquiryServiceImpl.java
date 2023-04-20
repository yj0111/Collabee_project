package com.spring.collabee.biz.inquiry.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.inquiry.InquiryService;
import com.spring.collabee.biz.inquiry.InquiryVO;



@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {
	@Autowired 
	private InquiryDAO inquiryDao;
	
	public InquiryServiceImpl() {
	System.out.println(">> InquiryServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertInquiry(InquiryVO vo) {
		inquiryDao.insertInquiry(vo);
	}
	
	@Override
	public InquiryVO getInquiry(InquiryVO vo) {
		return inquiryDao.getInquiry(vo);
	}
	
	@Override
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return inquiryDao.getInquiryList(vo);
	}

	@Override
	public void answerInquiry(InquiryVO vo) {
		inquiryDao.answerInquiry(vo);
		
	}

	
}
