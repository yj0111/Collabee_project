package com.spring.collabee.biz.order;

import java.sql.Date;

public class OrderCouponVO {
	private int couponNum;
	private String couponName;
	private int disPrice;
	private Date couponDate, usageDate;
	private int leastCost;
	private String usageState;
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
	public Date getCouponDate() {
		return couponDate;
	}
	public void setCouponDate(Date couponDate) {
		this.couponDate = couponDate;
	}
	public Date getUsageDate() {
		return usageDate;
	}
	public void setUsageDate(Date usageDate) {
		this.usageDate = usageDate;
	}
	public int getLeastCost() {
		return leastCost;
	}
	public void setLeastCost(int leastCost) {
		this.leastCost = leastCost;
	}
	public String getUsageState() {
		return usageState;
	}
	public void setUsageState(String usageState) {
		this.usageState = usageState;
	}
	@Override
	public String toString() {
		return "OrderCouponVO [couponNum=" + couponNum + ", couponName=" + couponName + ", disPrice=" + disPrice
				+ ", couponDate=" + couponDate + ", usageDate=" + usageDate + ", leastCost=" + leastCost
				+ ", usageState=" + usageState + "]";
	}
	

	
}
