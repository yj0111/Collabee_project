package com.spring.collabee.biz.coupons;

import java.util.List;
import java.util.Map;

public interface CouponsService{

	void couponsInsert(CouponsVO vo);
	void couponsModify(CouponsVO vo);
	void couponsDelete(CouponsVO vo);
	CouponsVO couponsSelect(CouponsVO vo);
	List<CouponsVO> couponsList(CouponsVO vo);
	List<CouponsVO> couponsListAvail();
	void insertCouponIntoCustom(Map<String, Object> map);
	List<CouponsVO> couponsDoubleCheck(Map<String, Object> map);

}
