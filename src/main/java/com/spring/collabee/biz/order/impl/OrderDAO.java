package com.spring.collabee.biz.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderCouponVO;
import com.spring.collabee.biz.order.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OrderDAO() {
	}
	public OrderVO getNMember(OrderVO vo) {
		return mybatis.selectOne("orderDAO.getNMember", vo);
	}
	public List<CartVO> getNMemberOrderList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getNMemberOrderList", vo);
	}
	public int getCouponCntN(OrderVO vo) {
		return mybatis.selectOne("orderDAO.getCouponCntN", vo);
	}
	public List<OrderCouponVO> getCouponListN(OrderVO vo) {
		return mybatis.selectList("orderDAO.getCouponListN", vo);
	}
	public int getCouponCnt(OrderVO vo) {
		return mybatis.selectOne("orderDAO.getCouponCnt", vo);
	}
	public List<OrderCouponVO> getCouponList(OrderVO vo) {
		return mybatis.selectList("orderDAO.getCouponList", vo);
	}
	public void insertOrders(OrderVO vo) {
		mybatis.insert("orderDAO.insertOrders", vo);
	}
	public void insertOrderProduct(CartVO vo) {
		mybatis.insert("orderDAO.insertOrderProduct", vo);
	}
	public void insertSaveEmoney(EmoneyUsageVO vo) {
		mybatis.insert("orderDAO.saveEmoney", vo);
	}
	public void insertUseEmoney(EmoneyUsageVO vo) {
		mybatis.insert("orderDAO.useEmoney", vo);
	}
	public void useCoupon(OrderVO vo) {
		mybatis.update("orderDAO.useCoupon", vo);
	}
	public void updateStock(CartVO vo) {
		mybatis.update("orderDAO.updateStock", vo);
	}
}
