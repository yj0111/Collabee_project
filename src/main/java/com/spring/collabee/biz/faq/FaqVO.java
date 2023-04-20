package com.spring.collabee.biz.faq;

public class FaqVO {
	
	private int faqNum;
	private String faqType;
	private String faqTitle;
	private String faqContent;

	//FAQ
	public FaqVO() {
		System.out.println(">> FaqVO() 객체 생성");
	}

	public int getFaqNum() {
		return faqNum;
	}

	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}

	public String getFaqType() {
		return faqType;
	}

	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	@Override
	public String toString() {
		return "FaqVO [faqNum=" + faqNum + ", faqType=" + faqType + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + "]";
	}


	
}
