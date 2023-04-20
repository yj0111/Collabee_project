package com.spring.collabee.biz.emoneyusage;

public class EmoneyUsageVO {
	int memberNum, amount;
	String orderNum, saveDate, emoneyHistory, category, validity;
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}
	public String getEmoneyHistory() {
		return emoneyHistory;
	}
	public void setEmoneyHistory(String emoneyHistory) {
		this.emoneyHistory = emoneyHistory;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "EmoneyUsageVO [memberNum=" + memberNum + ", orderNum=" + orderNum + ", amount=" + amount + ", saveDate="
				+ saveDate + ", emoneyHistory=" + emoneyHistory + ", category=" + category + ", validity=" + validity
				+ "]";
	}
	
	
	
	
	
}
