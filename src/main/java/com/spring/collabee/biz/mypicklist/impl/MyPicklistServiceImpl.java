package com.spring.collabee.biz.mypicklist.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mypicklist.MyPickListVO;
import com.spring.collabee.biz.mypicklist.MyPicklistService;

@Service("myPicklistService")
public class MyPicklistServiceImpl implements MyPicklistService {
	@Autowired
	MyPickListDAO myPickListDAO;	
	
	@Override
	public List<MyPickListVO> getPickList(MemberVO mvo) {
		return myPickListDAO.getPickList(mvo);
	}

	@Override
	public int delPickList(Map<String, Integer> pickInfo) {
		return myPickListDAO.delPickList(pickInfo);
	}

	@Override
	public int findPickItem(Map<String, Integer> findPickInfo) {
		return myPickListDAO.findPickItem(findPickInfo);
	}

	@Override
	public int addPickList(Map<String, Integer> addPickInfo) {
		return myPickListDAO.addPickList(addPickInfo);
	}


}
