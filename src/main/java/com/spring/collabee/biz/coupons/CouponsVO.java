package com.spring.collabee.biz.coupons;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class CouponsVO {

	private int couponNum, count, leastCost, disPrice;
	private String couponName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date couponDate, regdate;
	
	
	public CouponsVO() {
		super();
	}


	public CouponsVO(int couponNum, int count, int leastCost, int disPrice, 
			String couponName, Date couponDate, Date regdate) {
		this.couponNum = couponNum;
		this.count = count;
		this.leastCost = leastCost;
		this.disPrice = disPrice;
		this.couponName = couponName;
		this.couponDate = couponDate;
		this.regdate = regdate;
	}


	public int getCouponNum() {
		return couponNum;
	}


	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getLeastCost() {
		return leastCost;
	}


	public void setLeastCost(int leastCost) {
		this.leastCost = leastCost;
	}


	public int getDisPrice() {
		return disPrice;
	}


	public void setDisPrice(int disPrice) {
		this.disPrice = disPrice;
	}


	public String getCouponName() {
		return couponName;
	}


	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}


	public Date getCouponDate() {
		return couponDate;
	}


	public void setCouponDate(Date couponDate) {
		this.couponDate = couponDate;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "CouponsVO [couponNum=" + couponNum + ", count=" + count + ", leastCost=" + leastCost + ", disPrice="
				+ disPrice + ", couponName=" + couponName + ", couponDate=" + couponDate + ", regdate=" + regdate + "]";
	}
	
}