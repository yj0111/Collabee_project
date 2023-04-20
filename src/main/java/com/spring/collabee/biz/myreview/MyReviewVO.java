package com.spring.collabee.biz.myreview;

public class MyReviewVO {
	int orderNum, memberNumm, productNum, count, saleprice,price;	
	String review_status, thumSysFilename;
	//nmemberNum 비회원 번호
	
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getMemberNumm() {
		return memberNumm;
	}
	public void setMemberNumm(int memberNumm) {
		this.memberNumm = memberNumm;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReview_status() {
		return review_status;
	}
	public void setReview_status(String review_status) {
		this.review_status = review_status;
	}
	public String getThumSysFilename() {
		return thumSysFilename;
	}
	public void setThumSysFilename(String thumSysFilename) {
		this.thumSysFilename = thumSysFilename;
	}
	@Override
	public String toString() {
		return "MyReview [orderNum=" + orderNum + ", memberNumm=" + memberNumm + ", productNum=" + productNum
				+ ", count=" + count + ", saleprice=" + saleprice + ", price=" + price + ", review_status="
				+ review_status + ", thumSysFilename=" + thumSysFilename + "]";
	}
	
	
	
}
