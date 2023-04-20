package com.spring.collabee.biz.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderCouponVO;
import com.spring.collabee.biz.order.OrderService;
import com.spring.collabee.biz.order.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDao;
	
	public OrderServiceImpl() {
	}
	
	@Override
	public OrderVO getNMember(OrderVO vo) {
		return orderDao.getNMember(vo);
	}
	@Override
	public List<CartVO> getNMemberOrderList(OrderVO vo) {
		return orderDao.getNMemberOrderList(vo);
	}

	@Override
	public int getCouponCntN(OrderVO vo) {
		return orderDao.getCouponCntN(vo);
	}
	@Override
	public List<OrderCouponVO> getCouponListN(OrderVO vo) {
		return orderDao.getCouponListN(vo);
	}
	@Override
	public int getCouponCnt(OrderVO vo) {
		return orderDao.getCouponCnt(vo);
	}
	@Override
	public List<OrderCouponVO> getCouponList(OrderVO vo) {
		return orderDao.getCouponList(vo);
	}

	@Override
	public void insertOrders(OrderVO vo) {
		orderDao.insertOrders(vo);
	}

	@Override
	public void insertOrderProduct(CartVO vo) {
		orderDao.insertOrderProduct(vo);
	}

	@Override
	public void insertSaveEmoney(EmoneyUsageVO vo) {
		orderDao.insertSaveEmoney(vo);
	}

	@Override
	public void insertUseEmoney(EmoneyUsageVO vo) {
		orderDao.insertUseEmoney(vo);
	}

	@Override
	public void useCoupon(OrderVO vo) {
		orderDao.useCoupon(vo);
	}

	@Override
	public void updateStock(CartVO vo) {
		orderDao.updateStock(vo);
	}


}
