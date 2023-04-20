package com.spring.collabee.biz.myreview;

import java.util.List;
import java.util.Map;

public interface MyReviewService {
	List<MyReviewWrtVO> getMyReview(Map<String, String> reviewInfo);//memberNum, 리뷰작성상태

	
	int wrietReview(ProReviewVO prvo); // 리뷰작성
	int modifyReview(ProReviewVO prvo); // 리뷰수정
}
