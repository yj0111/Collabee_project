package com.spring.collabee.biz.mycouponbox;

import java.util.List;

import com.spring.collabee.biz.member.MemberVO;

public interface MyCouponBoxService {
	 List<MyCouponBoxVO> getCouponBoxList(MemberVO mvo);
	 int getCouponCnt(MemberVO mvo);
}
