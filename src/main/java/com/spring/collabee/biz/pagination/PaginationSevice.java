package com.spring.collabee.biz.pagination;

import com.spring.collabee.biz.member.MemberVO;

public interface PaginationSevice {
	//전체 게시물 갯수
	void getTotPost(MemberVO mvo);
	//현재페이지 구하기
	void getNowPage();
	//현재페이지에 표시할 게시글 시작번호, 끝번호 구하기
	
	
}
