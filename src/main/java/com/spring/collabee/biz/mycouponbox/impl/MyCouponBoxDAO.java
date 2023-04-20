package com.spring.collabee.biz.mycouponbox.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxVO;

@Repository
public class MyCouponBoxDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MyCouponBoxDAO() {
		System.out.println("CouponBoxDAO() 실행>>");
	}
	
	public int getCouponCnt(MemberVO mvo) {
		return Integer.parseInt(mybatis.selectOne("mypageDAO.getCouponCnt", mvo));
	}
	

	public List<MyCouponBoxVO> getCouponBoxList(MemberVO mvo) {
		return mybatis.selectList("mypageDAO.getCouponBoxList", mvo);
	}
}
