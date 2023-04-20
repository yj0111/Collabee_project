package com.spring.collabee.biz.member;

import java.util.List;

public interface MemberService {
	int signup(MemberVO mvo);	//회원가입
	int modify(MemberVO mvo);	//회원정보수정
	int leave(MemberVO mvo);		//회원탈퇴
	MemberVO getMember(String id);	//회원정보조회
	List<MemberVO> getMemberList(MemberVO mvo); //회원정보검색(관리자)
	
	String confirmId(String id);			//아이디 중복검사
	String confirmEmail(String email); 	//이메일 중복검사
	MemberVO login(MemberVO mvo); 		//로그인
	MemberVO findId(MemberVO mvo);	//아이디찾기
	MemberVO findPw(MemberVO mvo);	//비밀번호찾기
	MemberVO oldPwChk(MemberVO mvo);	// 회원정보변경 이전비밀번호 찾기
	MemberVO confirmModifyEmail(MemberVO mvo); //회원정보 변경 이전 이메일 확인

}
