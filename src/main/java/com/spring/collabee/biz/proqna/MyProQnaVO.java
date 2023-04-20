package com.spring.collabee.biz.proqna;

public class MyProQnaVO {
	//문의제목, 작성일, 답변상태, 작성내용, 답변내용
	int proQnaNum, productNum, memberNum, qSecret;
	String qTitle, productName, qContent, qDate, qStatus, aAnswer, thumSysFilename;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProQnaNum() {
		return proQnaNum;
	}
	public void setProQnaNum(int proQnaNum) {
		this.proQnaNum = proQnaNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getqSecret() {
		return qSecret;
	}
	public void setqSecret(int qSecret) {
		this.qSecret = qSecret;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public String getqStatus() {
		return qStatus;
	}
	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}
	public String getaAnswer() {
		return aAnswer;
	}
	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
	}
	public String getThumSysFilename() {
		return thumSysFilename;
	}
	public void setThumSysFilename(String thumSysFilename) {
		this.thumSysFilename = thumSysFilename;
	}
	@Override
	public String toString() {
		return "MyProQnaVO [proQnaNum=" + proQnaNum + ", productNum=" + productNum + ", memberNum=" + memberNum
				+ ", qSecret=" + qSecret + ", qTitle=" + qTitle + ", productName=" + productName + ", qContent="
				+ qContent + ", qDate=" + qDate + ", qStatus=" + qStatus + ", aAnswer=" + aAnswer + ", thumSysFilename="
				+ thumSysFilename + "]";
	}

	
	
	
	
	

}
