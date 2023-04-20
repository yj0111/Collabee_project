package com.spring.collabee.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberServiceImpl() {
		System.out.println("MemberServiceImpl 객체생성");
	}
	
	@Override
	public int signup(MemberVO mvo) {
		return memberDAO.signup(mvo);
	}

	@Override
	public int modify(MemberVO mvo) {
		return memberDAO.modify(mvo);
	}
	@Override
	public int leave(MemberVO mvo) {
		return memberDAO.leave(mvo);		
	}
	
	@Override
	public MemberVO getMember(String id) {
		return memberDAO.getMember(id);
	}
	
	@Override
	public List<MemberVO> getMemberList(MemberVO mvo) {
		return memberDAO.getMemberList(mvo);
	}

	
	
	@Override
	public String confirmId(String id) {
		System.out.println("[Serviceimpl] confirmId : " + id);
		System.out.println("memberDAO.confirmId(id) : " + memberDAO.confirmId(id));			
		
		return memberDAO.confirmId(id);
	}

	@Override
	public String confirmEmail(String email) {
		System.out.println("[Serviceimpl] confirmEmail : " + email);
		System.out.println("memberDAO.confrimId(email) : " + memberDAO.confirmEmail(email));			
		
		return memberDAO.confirmEmail(email);
	}


	@Override
	public MemberVO login(MemberVO mvo) {
		System.out.println("[Serviceimpl] login : "+ mvo.getId() + ", pw : " + mvo.getPassword());
		return memberDAO.login(mvo);
	}



	@Override
	public MemberVO findId(MemberVO mvo) {
		return memberDAO.findId(mvo);
	}


	@Override
	public MemberVO findPw(MemberVO mvo) {
		return memberDAO.findPw(mvo);
	}

	@Override
	public MemberVO oldPwChk(MemberVO mvo) {
		return memberDAO.oldPwChk(mvo);
	}

	@Override
	public MemberVO confirmModifyEmail(MemberVO mvo) {
		System.out.println("confirmModifyEmail VO : " +memberDAO.confirmModifyEmail(mvo));
		return memberDAO.confirmModifyEmail(mvo);
	}






	
}
