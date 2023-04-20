package com.spring.collabee.view.collections;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.collections.DivisionVO;


//@Controller
@RestController // 클래스 내의 요청처리 결과가 모두 @ResponseBody 처리됨
public class CollectionsAjaxController {
	
	@Autowired
	private CollectionsService collectionsService;
	
//	@RequestMapping("/collections/getJsonDivision.do")
//	public List<DivisionVO> getJsonDvisionList(String categoryNum) {
//		System.out.println(">>> 세부카테고리 제이슨 실행");
//		
//		System.out.println(categoryNum);
//		List<DivisionVO> list = collectionsService.getDivision(Integer.parseInt(categoryNum));
//		
//		System.out.println("갔다옴" + list);
//		return list;
//	}
	
}
