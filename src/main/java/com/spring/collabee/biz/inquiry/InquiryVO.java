package com.spring.collabee.biz.inquiry;

import java.sql.Date;

public class InquiryVO {
	
	private int inquiryNum;
	private int memberNum;
	private String inquiryType;
	private String inquirySubType;
	private String inquiryTitle;
	private String inquiryContent;
	private String oriFilename;
	private String sysFilename;
	private Date inquiryDate;
	private String inquiryState;
	private String inquiryAnswer;
	
	//FAQ
	public InquiryVO() {
		System.out.println(">> InquiryVO() 객체 생성");
	}

	public int getInquiryNum() {
		return inquiryNum;
	}

	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getInquirySubType() {
		return inquirySubType;
	}

	public void setInquirySubType(String inquirySubType) {
		this.inquirySubType = inquirySubType;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getOriFilename() {
		return oriFilename;
	}

	public void setOriFilename(String oriFilename) {
		this.oriFilename = oriFilename;
	}

	public String getSysFilename() {
		return sysFilename;
	}

	public void setSysFilename(String sysFilename) {
		this.sysFilename = sysFilename;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getInquiryState() {
		return inquiryState;
	}

	public void setInquiryState(String inquiryState) {
		this.inquiryState = inquiryState;
	}

	public String getInquiryAnswer() {
		return inquiryAnswer;
	}

	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}

	@Override
	public String toString() {
		return "InquiryVO [inquiryNum=" + inquiryNum + ", memberNum=" + memberNum + ", inquiryType=" + inquiryType
				+ ", inquirySubType=" + inquirySubType + ", inquiryTitle=" + inquiryTitle + ", inquiryContent="
				+ inquiryContent + ", oriFilename=" + oriFilename + ", sysFilename=" + sysFilename + ", inquiryDate="
				+ inquiryDate + ", inquiryState=" + inquiryState + ", inquiryAnswer=" + inquiryAnswer + "]";
	}


}
