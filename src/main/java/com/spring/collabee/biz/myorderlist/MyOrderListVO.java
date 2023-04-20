package com.spring.collabee.biz.myorderlist;

public class MyOrderListVO { 
	/* mypage 주문내역 조회를 위한 VO
	● 주문 번호 별 리스트
	주문번호 / 주문상품 전체리스트 (갯수) +  제품이미지(첫번째)
	주문 날짜(시간)/ 상품명 / 결제방법 / 결제금액 /배송상태
	● 주문상세
	주문번호
	주문상품 전체리스트
		- 제품명 , 제품이미지, 가격, 구매수량, 배송상태
	상품금액(총금액), 배송비 결제금액, ,적립금(알아서계산),	결제방법, 구매자, 결제시간
	배송 주소 + 상세, 받는 장소, 포장방법
	 */
	int productNum, price, count, saleprice, deliveryFee, goodsprice,
		amount, totPrice, totGoodsprice;
	
	
	String	orderNum, productName, thumSysFilename, description, deliveryStatus,
			ptDetailname, orderName, orderPhone, orderDate, orderAddr,
			orderAddrDetail, orderPlace, orderRequest, condition, reviewStatus;


	public int getProductNum() {
		return productNum;
	}


	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
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


	public int getDeliveryFee() {
		return deliveryFee;
	}


	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}


	public int getGoodsprice() {
		return goodsprice;
	}


	public void setGoodsprice(int goodsprice) {
		this.goodsprice = goodsprice;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getTotPrice() {
		return totPrice;
	}


	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}


	public int getTotGoodsprice() {
		return totGoodsprice;
	}


	public void setTotGoodsprice(int totGoodsprice) {
		this.totGoodsprice = totGoodsprice;
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


	public String getThumSysFilename() {
		return thumSysFilename;
	}


	public void setThumSysFilename(String thumSysFilename) {
		this.thumSysFilename = thumSysFilename;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getDeliveryStatus() {
		return deliveryStatus;
	}


	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}


	public String getPtDetailname() {
		return ptDetailname;
	}


	public void setPtDetailname(String ptDetailname) {
		this.ptDetailname = ptDetailname;
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


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public String getOrderAddr() {
		return orderAddr;
	}


	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}


	public String getOrderAddrDetail() {
		return orderAddrDetail;
	}


	public void setOrderAddrDetail(String orderAddrDetail) {
		this.orderAddrDetail = orderAddrDetail;
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


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}


	public String getReviewStatus() {
		return reviewStatus;
	}


	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}


	@Override
	public String toString() {
		return "MyOrderListVO [productNum=" + productNum + ", price=" + price + ", count=" + count + ", saleprice="
				+ saleprice + ", deliveryFee=" + deliveryFee + ", goodsprice=" + goodsprice + ", amount=" + amount
				+ ", totPrice=" + totPrice + ", totGoodsprice=" + totGoodsprice + ", orderNum=" + orderNum
				+ ", productName=" + productName + ", thumSysFilename=" + thumSysFilename + ", description="
				+ description + ", deliveryStatus=" + deliveryStatus + ", ptDetailname=" + ptDetailname + ", orderName="
				+ orderName + ", orderPhone=" + orderPhone + ", orderDate=" + orderDate + ", orderAddr=" + orderAddr
				+ ", orderAddrDetail=" + orderAddrDetail + ", orderPlace=" + orderPlace + ", orderRequest="
				+ orderRequest + ", condition=" + condition + ", reviewStatus=" + reviewStatus + "]";
	}

	

	
}
