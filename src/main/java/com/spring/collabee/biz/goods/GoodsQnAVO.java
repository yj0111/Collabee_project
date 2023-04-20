package com.spring.collabee.biz.goods;
import java.sql.Date;

public class GoodsQnAVO {
	//상품 문의
		private int proQnaNum, productNum, memberNum, qSecret, aNum; 
		private String qTitle, qContent, qStatus;
		private Date qDate;
		private String aAnswer;
		private String productName;
		
	public GoodsQnAVO() {
		System.out.println("GoodsQnAVO() 생성 ~");
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


	public int getaNum() {
		return aNum;
	}


	public void setaNum(int aNum) {
		this.aNum = aNum;
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


	public String getqStatus() {
		return qStatus;
	}


	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}


	public Date getqDate() {
		return qDate;
	}


	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}


	public String getaAnswer() {
		return aAnswer;
	}


	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
	}


	
	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	@Override
	public String toString() {
		return "GoodsQnAVO [proQnaNum=" + proQnaNum + ", productNum=" + productNum + ", memberNum=" + memberNum
				+ ", qSecret=" + qSecret + ", aNum=" + aNum + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", qStatus=" + qStatus + ", qDate=" + qDate + ", aAnswer=" + aAnswer + ", productName=" + productName
				+ "]";
	}



	
	




}