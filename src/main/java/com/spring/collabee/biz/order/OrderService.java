package com.spring.collabee.biz.order;

import java.util.List;

import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;

public interface OrderService {
	List<CartVO> getNMemberOrderList(OrderVO vo);
	OrderVO getNMember(OrderVO vo);
	
	int getCouponCntN(OrderVO vo);
	List<OrderCouponVO> getCouponListN(OrderVO vo);
	
	int getCouponCnt(OrderVO vo);
	List<OrderCouponVO> getCouponList(OrderVO vo);
	
	void insertOrders(OrderVO vo);
	void insertOrderProduct(CartVO vo);
	
	void insertSaveEmoney(EmoneyUsageVO vo);
	void insertUseEmoney(EmoneyUsageVO vo);
	
	void useCoupon(OrderVO vo);
	void updateStock(CartVO vo);
}
