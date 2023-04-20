package com.spring.collabee.biz.mycouponbox.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxService;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxVO;

@Service("myCouponBoxService")
public class MyCouponBoxServiceImpl implements MyCouponBoxService {
	@Autowired
	private MyCouponBoxDAO myCouponBoxDAO;
	
	@Override
	public int getCouponCnt(MemberVO mvo) {
		return myCouponBoxDAO.getCouponCnt(mvo);
	}

	@Override
	public List<MyCouponBoxVO> getCouponBoxList(MemberVO mvo) {
		return myCouponBoxDAO.getCouponBoxList(mvo);
	}



}
