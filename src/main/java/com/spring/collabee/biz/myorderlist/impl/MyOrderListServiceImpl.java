package com.spring.collabee.biz.myorderlist.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.myorderlist.MyOrderListService;
import com.spring.collabee.biz.myorderlist.MyOrderListVO;

@Service("myOrderListService")
public class MyOrderListServiceImpl implements MyOrderListService {
	@Autowired
	MyOrderListDAO myOrderListDAO;
	
	@Override
	public List<MyOrderListVO> getOrderList(Map<String, Integer> orderInfo) {
		return myOrderListDAO.getOrderList(orderInfo);
	}

	@Override
	public List<MyOrderListVO> getOrderDetailAjax(Map<String, Integer> orderInfo) {
		//return myOrderListDAO.getOrderDetail(orderInfo);
		return null;
	}
	@Override
	public List<MyOrderListVO> getOrderDetail(Map<String, Object> orderInfo) {
		return myOrderListDAO.getOrderDetail(orderInfo);
	}

	
}
