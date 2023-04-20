package com.spring.collabee.biz.myreview.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.myreview.MyReviewWrtVO;
import com.spring.collabee.biz.myreview.ProReviewVO;

@Repository
public class MyReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MyReviewWrtVO> getMyReview(Map<String, String> reviewInfo) {
		System.out.println("MyReviewDAO 실행 >>>>>>>>>>>");
		System.out.println(">>>> 리뷰조회 회원번호 : " + reviewInfo.get("memberNum"));
		System.out.println(">>>> 리뷰조회 리뷰구분 : " + reviewInfo.get("reviewStatus"));
		
		Map<String, Object> reviewStatus = new HashMap<String, Object>();
		reviewStatus.put("memberNum", Integer.parseInt(reviewInfo.get("memberNum")));
		reviewStatus.put("reviewStatus", reviewInfo.get("reviewStatus"));
		return mybatis.selectList("mypageDAO.getMemberReview", reviewStatus);
	}

	public MyReviewWrtVO seeMyReview(Map<String, String> reviewInfo) {
		return mybatis.selectOne("mypageDAO.seeMyReview", reviewInfo);
	}
	
	//리뷰작성
	public int wrietReview(ProReviewVO prvo) {
		return mybatis.insert("mypageDAO.wrietReview", prvo);
	}

	//리뷰작성 - 작성상태변경
	public int updateState(ProReviewVO prvo) { 
		return mybatis.insert("mypageDAO.updateState", prvo);	
	}

	//리뷰수정
	public int modifyReview(ProReviewVO prvo) {
		return mybatis.update("mypageDAO.modifyReview", prvo);	
	}
	
	

}
