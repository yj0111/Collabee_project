package com.spring.collabee.biz.collections;

public class SpecialCatVO {
	
	private int specialNum;
	private String title, sDescription;
	
	
	@Override
	public String toString() {
		return "SpecialCatVO [special_num=" + specialNum + ", title=" + title + ", sDescription=" + sDescription + "]";
	}

	
	
	public SpecialCatVO() {
		super();
	}



	public SpecialCatVO(int specialNum, String title, String sDescription) {
		super();
		this.specialNum = specialNum;
		this.title = title;
		this.sDescription = sDescription;
	}



	public int getSpecialNum() {
		return specialNum;
	}


	public void setSpecialNum(int specialNum) {
		this.specialNum = specialNum;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getsDescription() {
		return sDescription;
	}


	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}
	
	
}
