package com.spring.collabee.biz.pagination;

public class PaginationVO {
	@Override
	public String toString() {
		return "PaginationVO [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage
				+ ", numPerBlock=" + numPerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + "]";
	}

	private int nowPage = 1;      // 현재페이지
	private int nowBlock = 1;	  // 현재블록(페이지 담는 단위) ||게시판 하단에  [  [<] 3 4 5 6 7 [>]  ]
	
	private int numPerPage = 3;   // 하나의 페이지에 표시할 게시글 수(게시판 1 페이지당 노출되는 게시글 수)
	private int numPerBlock = 3 ; // 블록당 표시하는 페이지 갯수 (3개 > <- 123 ->

	private int totalRecord = 0;  // 총 게시글 갯수(원본 게시글 수)
	private int totalPage = 0;    // 전체 페이지  갯수
	private int totalBlock = 0;   // 전체 블록 갯수

	private int begin = 0; 			// 현재 페이지상의 시작 게시글 번호(글번호와 상관X)
	private int end = 0;   			// 현재 페이지상의 마지막 게시글번호 
	
	private int beginPage = 0; 		//현재 블록의 시작 페이지 번호 [ 1 2 3 4 5 ]
	private int endPage = 0;   		//현재 블록의 끝 페이지 번호   [ 1 2 3 4 5 ]
	
	//전체페이지
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage > 0) totalPage++;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getNumPerBlock() {
		return numPerBlock;
	}

	public void setNumPerBlock(int numPerBlock) {
		this.numPerBlock = numPerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
}
