package com.spring.collabee.biz.myreview;

import org.springframework.web.multipart.MultipartFile;

public class ProReviewVO {

	int reviewNum, productNum, memberNum, point, rec;
	String orderNum, rContent, rOriFilename, rSysFilename, rDate;
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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
		return "ProReviewVO [reviewNum=" + reviewNum + ", productNum=" + productNum + ", memberNum=" + memberNum
				+ ", point=" + point + ", rec=" + rec + ", orderNum=" + orderNum + ", rContent=" + rContent
				+ ", rOriFilename=" + rOriFilename + ", rSysFilename=" + rSysFilename + ", rDate=" + rDate + "]";
	}
	
	
	

	
	
	
	
}
