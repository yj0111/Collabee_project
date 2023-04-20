package com.spring.collabee.biz.inquiry;

import java.util.List;

public interface InquiryService {
	//1:1 게시판 
	void insertInquiry(InquiryVO vo);
	InquiryVO getInquiry(InquiryVO vo);
	List<InquiryVO> getInquiryList(InquiryVO vo);
	
	//1:1 답변
	void answerInquiry(InquiryVO vo);
}
