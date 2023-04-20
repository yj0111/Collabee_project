package com.spring.collabee.biz.mypicklist;

public class MyPickListVO {
	int memberNum, productNum, price, disRate, saleprice, stock;
	String productName, description, thumOriFilename, thumSysFilename;
	
	public MyPickListVO() {
		System.out.println("MyPickListVO() 객체 생성");
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDisRate() {
		return disRate;
	}

	public void setDisRate(int disRate) {
		this.disRate = disRate;
	}

	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getThumOriFilename() {
		return thumOriFilename;
	}

	public void setThumOriFilename(String thumOriFilename) {
		this.thumOriFilename = thumOriFilename;
	}

	public String getThumSysFilename() {
		return thumSysFilename;
	}

	public void setThumSysFilename(String thumSysFilename) {
		this.thumSysFilename = thumSysFilename;
	}

	@Override
	public String toString() {
		return "MyPickListVO [memberNum=" + memberNum + ", productNum=" + productNum + ", price=" + price + ", disRate="
				+ disRate + ", saleprice=" + saleprice + ", stock=" + stock + ", productName=" + productName
				+ ", description=" + description + ", thumOriFilename=" + thumOriFilename + ", thumSysFilename="
				+ thumSysFilename + "]";
	}


	
}
