package com.spring.collabee.biz.myorderlist.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.myorderlist.MyOrderListVO;

@Repository
public class MyOrderListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	Map <String, Object> map = new HashMap<String, Object>();
	
	public MyOrderListDAO() {
		System.out.println("OrderListDAO() 객체 생성");
	}
	//주문번호별 
	public List<MyOrderListVO> getOrderList(Map<String, Integer> orderInfo) {
		int memberNum = orderInfo.get("memberNum");
		int period = orderInfo.get("period");
		System.out.println(">>>> 주문목록 받아온 멤버 : " + memberNum );
		System.out.println(">>>> 주문목록 받아온 기간 : " + period );
		return mybatis.selectList("mypageDAO.getOrderList", orderInfo);
	}	

	//주문상세
	public List<MyOrderListVO> getOrderDetailAjax(Map<String, Integer> orderInfo){
		return mybatis.selectList("mypageDAO.getOrderDetail", orderInfo);
	}
	public List<MyOrderListVO> getOrderDetail(Map<String, Object> orderInfo) {
		return mybatis.selectList("mypageDAO.getOrderDetail", orderInfo);
	}
}
