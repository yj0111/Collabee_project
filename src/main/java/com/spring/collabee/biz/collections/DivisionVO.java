package com.spring.collabee.biz.collections;

public class DivisionVO {

	private int divisionNum, categoryNum;
	private String division, category;
	
	
	@Override
	public String toString() {
		return "DivisionVO [divisionNum=" + divisionNum + ", categoryNum=" + categoryNum + ", division=" + division
				+ ", category=" + category + "]";
	}
	public int getDivisionNum() {
		return divisionNum;
	}
	public void setDivisionNum(int divisionNum) {
		this.divisionNum = divisionNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public DivisionVO(int divisionNum, int categoryNum, String division, String category) {
		super();
		this.divisionNum = divisionNum;
		this.categoryNum = categoryNum;
		this.division = division;
		this.category = category;
	}
	public DivisionVO() {
		super();
	}
}
