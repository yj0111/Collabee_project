package com.spring.collabee.biz.board;

import java.sql.Date;

public class BoardVO {
	
	private int noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
	public BoardVO() {
		System.out.println(">> BoardVO() 객체 생성");
	}

	//공지사항
	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	@Override
	public String toString() {
		return "BoardVO [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + "]";
	}

	
}
