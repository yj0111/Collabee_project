package com.spring.collabee.biz.order;

public class OrderVO {
	private String orderNum, orderName, orderPhone, orderAddr, orderPlace, orderRequest;
	private String deliveryPick;
	private int deliveryFee, totGoodsprice, totDiscount, totPrice, couponNum, usageAmount, ptNum, memberNum;
	private String orderAddrDetail, nmemberNum, gradeName;
	private int saverate;
	
	public OrderVO() {
	}

	

	public String getOrderNum() {
		return orderNum;
	}



	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}



	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public String getOrderPlace() {
		return orderPlace;
	}

	public void setOrderPlace(String orderPlace) {
		this.orderPlace = orderPlace;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	

	public String getDeliveryPick() {
		return deliveryPick;
	}

	public void setDeliveryPick(String deliveryPick) {
		this.deliveryPick = deliveryPick;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public int getTotGoodsprice() {
		return totGoodsprice;
	}

	public void setTotGoodsprice(int totGoodsprice) {
		this.totGoodsprice = totGoodsprice;
	}

	public int getTotDiscount() {
		return totDiscount;
	}

	public void setTotDiscount(int totDiscount) {
		this.totDiscount = totDiscount;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public int getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}

	public int getUsageAmount() {
		return usageAmount;
	}

	public void setUsageAmount(int usageAmount) {
		this.usageAmount = usageAmount;
	}

	public int getPtNum() {
		return ptNum;
	}

	public void setPtNum(int ptNum) {
		this.ptNum = ptNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	

	public String getOrderAddrDetail() {
		return orderAddrDetail;
	}

	public void setOrderAddrDetail(String orderAddrDetail) {
		this.orderAddrDetail = orderAddrDetail;
	}

	public String getNmemberNum() {
		return nmemberNum;
	}

	public void setNmemberNum(String nmemberNum) {
		this.nmemberNum = nmemberNum;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getSaverate() {
		return saverate;
	}

	public void setSaverate(int saverate) {
		this.saverate = saverate;
	}



	@Override
	public String toString() {
		return "OrderVO [orderNum=" + orderNum + ", orderName=" + orderName + ", orderPhone=" + orderPhone
				+ ", orderAddr=" + orderAddr + ", orderPlace=" + orderPlace + ", orderRequest=" + orderRequest
				+ ", deliveryPick=" + deliveryPick + ", deliveryFee=" + deliveryFee + ", totGoodsprice=" + totGoodsprice
				+ ", totDiscount=" + totDiscount + ", totPrice=" + totPrice + ", couponNum=" + couponNum
				+ ", usageAmount=" + usageAmount + ", ptNum=" + ptNum + ", memberNum=" + memberNum
				+ ", orderAddrDetail=" + orderAddrDetail + ", nmemberNum=" + nmemberNum + ", gradeName=" + gradeName
				+ ", saverate=" + saverate + "]";
	}

	

	
	
}
