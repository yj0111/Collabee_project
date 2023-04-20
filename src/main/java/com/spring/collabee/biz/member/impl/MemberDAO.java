package com.spring.collabee.biz.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@Repository
public class MemberDAO {	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	Map <String, String> map;
	
	
	public MemberDAO() {
		System.out.println(">> MemberDAO mybatis() 객체생성");
	}
	
	public int signup(MemberVO mvo) {
		return mybatis.insert("memberDAO.signup", mvo); // 매퍼연결, 파라미터 	
	}

	public int modify(MemberVO mvo) {
		return mybatis.update("memberDAO.modify", mvo);
	}

	public int leave(MemberVO mvo) {
		return mybatis.update("memberDAO.leave", mvo);
	}

	public MemberVO getMember(String idOrEamil) {
		return mybatis.selectOne("memberDAO.getMember", idOrEamil);
	}

	public List<MemberVO> getMemberList(MemberVO mvo) {
		//관리자에서 필요시 구
		return null;
	}

	public String confirmId(String id) {
		System.out.println("===> MyBatis 사용 confrimId() 실행");
		System.out.println("mybatis getId : " + mybatis.selectOne("memberDAO.confirmId", id));
		return  mybatis.selectOne("memberDAO.confirmId", id);
	}

	public String confirmEmail(String email) {
		System.out.println("===> MyBatis 사용 confirmEmail() 실행");
		return mybatis.selectOne("memberDAO.confirmEmail", email);
	}
	
	
	public MemberVO login(MemberVO mvo) {
		System.out.println("===> MyBatis 사용 login() 실행");
		return mybatis.selectOne("memberDAO.login", mvo);
	}


	public MemberVO findId(MemberVO mvo) {
		System.out.println("===> MyBatis 사용 findId() 실행");
		return mybatis.selectOne("memberDAO.findId", mvo);
	}


	public MemberVO findPw(MemberVO mvo) {
		System.out.println("===> MyBatis 사용 findPw() 실행");
		return mybatis.selectOne("memberDAO.findPw", mvo);
	}

	public MemberVO oldPwChk(MemberVO mvo) {
		return mybatis.selectOne("memberDAO.oldPwChk", mvo);
	}

	public MemberVO confirmModifyEmail(MemberVO mvo) {
		return mybatis.selectOne("memberDAO.confirmModifyEmail", mvo);
	}


}
