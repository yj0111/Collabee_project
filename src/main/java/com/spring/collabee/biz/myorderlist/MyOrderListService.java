package com.spring.collabee.biz.myorderlist;

import java.util.List;
import java.util.Map;

public interface MyOrderListService {
	public List<MyOrderListVO> getOrderList(Map<String, Integer> orderInfo);	//주문번호, 기간별조회
	public List<MyOrderListVO> getOrderDetailAjax(Map<String, Integer> orderInfo);	//주문상세
	public List<MyOrderListVO> getOrderDetail(Map<String, Object> orderInfo);	//주문상세
}
