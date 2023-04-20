package com.spring.collabee.biz.emoneyusage.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.pagination.PaginationSevice;
import com.spring.collabee.biz.pagination.PaginationVO;

@Service("emoneyUsageService")
public class EmoneyUsageServiceImpl implements EmoneyUsageService, PaginationSevice  {
	@Autowired
	private EmoneyUsageDAO emoneyUsageDAO;

	private PaginationVO pagination;
	
	
	@Override
	public int getTotEmoney(MemberVO mvo) {
		return emoneyUsageDAO.getTotEmoney(mvo);
	}
	
	@Override
	public List<EmoneyUsageVO> getEmoneyUsageList(MemberVO mvo) {
		return emoneyUsageDAO.getEmoneyUsage(mvo);
	}
	@Override
	public int getEmoneyUsageCnt(int memberNum) {
		return emoneyUsageDAO.getEmoneyUsageCnt(memberNum);
	}

	
	
	//페이징 처리
	@Override
	public void getTotPost(MemberVO mvo) {
		int totRecod = 0; 
		totRecod = emoneyUsageDAO.getEmoneyUsage(mvo).size();
		pagination.setTotalRecord(totRecod);
		pagination.setTotalPage();

	}
	
	@Override
	public void getNowPage() {
		
	}

	@Override
	public List<EmoneyUsageVO> getEmoneyPage(Map<String, Integer> pageInfo) {
		return emoneyUsageDAO.getEmoneyUsagePage(pageInfo);
	}


}
