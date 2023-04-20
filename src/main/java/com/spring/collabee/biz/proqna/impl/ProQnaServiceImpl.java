package com.spring.collabee.biz.proqna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.proqna.MyProQnaService;
import com.spring.collabee.biz.proqna.MyProQnaVO;

@Service("proQnaService")
public class ProQnaServiceImpl implements MyProQnaService {
	@Autowired
	MyProQnaDAO myProQnaDAO;
	
	@Override
	public List<MyProQnaVO> getMyProQna(MemberVO mvo) {
		return myProQnaDAO.getMyProQna(mvo);
	}

}
