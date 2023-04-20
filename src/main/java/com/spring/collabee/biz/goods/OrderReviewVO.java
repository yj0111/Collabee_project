package com.spring.collabee.biz.goods;

import java.util.Date;

public class OrderReviewVO {
	
	private Date orderDate;
	private int count, orderNum, memberNum, productNum;
	private String reviewStatus;
	
	
	
	
	
	public OrderReviewVO() {
		System.out.println("OrderReviewVO() 생성자 실행~");
	}
	@Override
	public String toString() {
		return "OrderReviewVO [orderDate=" + orderDate + ", count=" + count + ", orderNum=" + orderNum + ", memberNum="
				+ memberNum + ", productNum=" + productNum + ", reviewStatus=" + reviewStatus + "]";
	}
	public OrderReviewVO(Date orderDate, int count, int orderNum, int memberNum, int productNum, String reviewStatus) {
		super();
		this.orderDate = orderDate;
		this.count = count;
		this.orderNum = orderNum;
		this.memberNum = memberNum;
		this.productNum = productNum;
		this.reviewStatus = reviewStatus;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	
	
	

}
