package com.spring.collabee.biz.collections;

public class CategoriesVO {

	private int categoryNum;
	private String category;
	
	
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "CategoriesVO [categoryNum=" + categoryNum + ", category=" + category + "]";
	}
	public CategoriesVO(int categoryNum, String category) {
		super();
		this.categoryNum = categoryNum;
		this.category = category;
	}
	
	public CategoriesVO() {
		super();
	}
	
	
}
