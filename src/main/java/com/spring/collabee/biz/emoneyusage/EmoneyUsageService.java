package com.spring.collabee.biz.emoneyusage;

import java.util.List;
import java.util.Map;

import com.spring.collabee.biz.member.MemberVO;

public interface EmoneyUsageService {
	int getTotEmoney(MemberVO mvo);
	List <EmoneyUsageVO> getEmoneyUsageList(MemberVO mvo);	//적립금내역 조회
	
	List <EmoneyUsageVO> getEmoneyPage(Map<String, Integer> pageInfo);	//적립금내역 페이징
	
	int getEmoneyUsageCnt(int MemberNum);//적립금페이징 갯수
	
}
