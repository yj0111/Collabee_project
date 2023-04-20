package com.spring.collabee.biz.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.faq.FaqService;
import com.spring.collabee.biz.faq.FaqVO;



@Service("faqService")
public class FaqServiceImpl implements FaqService {
	@Autowired 
	private FaqDAO faqDao;
	
	public FaqServiceImpl() {
	System.out.println(">> FaqServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertFaq(FaqVO vo) {
		faqDao.insertFaq(vo);
	}
	
	@Override
	public void updateFaq(FaqVO vo) {
		faqDao.updateFaq(vo);
	}
	
	@Override
	public void deletFaq(FaqVO vo) {
		faqDao.deleteFaq(vo);
	}
	
	@Override
	public FaqVO getFaq(FaqVO vo) {
		return faqDao.getFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(String faqType) {
		return faqDao.getFaqList(faqType);
	}
	
	}
