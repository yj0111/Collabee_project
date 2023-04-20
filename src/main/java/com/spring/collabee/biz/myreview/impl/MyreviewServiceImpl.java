package com.spring.collabee.biz.myreview.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.myreview.MyReviewService;
import com.spring.collabee.biz.myreview.MyReviewWrtVO;
import com.spring.collabee.biz.myreview.ProReviewVO;

@Service("myReviewService")
public class MyreviewServiceImpl implements MyReviewService{
	@Autowired
	MyReviewDAO myReviewDAO;
	
	@Override
	public List<MyReviewWrtVO> getMyReview(Map<String, String> reviewInfo) {
		System.out.println("MyreviewServiceImpl() getMyReview 실행");

		return myReviewDAO.getMyReview(reviewInfo);
	}
	


	@Override
	public int wrietReview(ProReviewVO prvo) {
		int wrtResult = myReviewDAO.wrietReview(prvo);
		int upResult= myReviewDAO.updateState(prvo);
		return upResult;
	}

	@Override
	public int modifyReview(ProReviewVO prvo) {
		return myReviewDAO.modifyReview(prvo);
	}



}
