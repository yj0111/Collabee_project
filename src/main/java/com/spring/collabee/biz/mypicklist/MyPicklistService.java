package com.spring.collabee.biz.mypicklist;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.spring.collabee.biz.member.MemberVO;

public interface MyPicklistService {
	List<MyPickListVO> getPickList(MemberVO mvo);
	int delPickList (@RequestBody Map<String, Integer> pickInfo);
	int findPickItem (@RequestBody Map<String, Integer> findPickInfo); //찜목록에서 찾기
	int addPickList(@RequestBody Map<String, Integer> addPickInfo);		//없으면 추가
}
