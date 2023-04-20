package com.spring.collabee.biz.mycouponbox;

public class MyCouponBoxVO {
	int memberNum; 
	int couponNum;
	String couponName;
	int disPrice;
	String couponDate, usageState;
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getDisPrice() {
		return disPrice;
	}
	public void setDisPrice(int disPrice) {
		this.disPrice = disPrice;
	}
	public String getCouponDate() {
		return couponDate;
	}
	public void setCouponDate(String couponDate) {
		this.couponDate = couponDate;
	}
	public String getUsageState() {
		return usageState;
	}
	public void setUsageState(String usageState) {
		this.usageState = usageState;
	}
	@Override
	public String toString() {
		return "CouponBoxVO [memberNum=" + memberNum + ", couponNum=" + couponNum + ", couponName=" + couponName
				+ ", disPrice=" + disPrice + ", couponDate=" + couponDate + ", usageState=" + usageState + "]";
	}
	
	
	
}
