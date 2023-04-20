package com.spring.collabee.biz.proqna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.proqna.MyProQnaVO;

@Repository
public class MyProQnaDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MyProQnaDAO() {
		System.out.println("ProQnaDAO()객체 생성");
	}
	
	public List<MyProQnaVO> getMyProQna(MemberVO mvo) {
		return mybatis.selectList("mypageDAO.getMyProQna", mvo);
	}
	
	
}
