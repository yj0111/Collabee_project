package com.spring.collabee.biz.myreview;

//조회용
public class MyReviewWrtVO {

	int  memberNum, productNum, count, saleprice,  price, reviewNum, rec, point;
	String orderNum, productName, deliveryPick, deliveryStatus, 
			reviewStatus, thumOriFilename, thumSysFilename,  rContent,
			rOriFilename, rSysFilename, rDate;
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
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDeliveryPick() {
		return deliveryPick;
	}
	public void setDeliveryPick(String deliveryPick) {
		this.deliveryPick = deliveryPick;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public String getThumOriFilename() {
		return thumOriFilename;
	}
	public void setThumOriFilename(String thumOriFilename) {
		this.thumOriFilename = thumOriFilename;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrOriFilename() {
		return rOriFilename;
	}
	public void setrOriFilename(String rOriFilename) {
		this.rOriFilename = rOriFilename;
	}
	public String getrSysFilename() {
		return rSysFilename;
	}
	public void setrSysFilename(String rSysFilename) {
		this.rSysFilename = rSysFilename;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	
	@Override
	public String toString() {
		return "MyReviewWrtVO [memberNum=" + memberNum + ", productNum=" + productNum + ", count=" + count
				+ ", saleprice=" + saleprice + ", price=" + price + ", reviewNum=" + reviewNum + ", rec=" + rec
				+ ", point=" + point + ", orderNum=" + orderNum + ", productName=" + productName + ", deliveryPick="
				+ deliveryPick + ", deliveryStatus=" + deliveryStatus + ", reviewStatus=" + reviewStatus
				+ ", thumOriFilename=" + thumOriFilename + ", rContent=" + rContent + ", rOriFilename=" + rOriFilename
				+ ", rSysFilename=" + rSysFilename + ", rDate=" + rDate + "]";
	}
	
	
	
	
	
}
