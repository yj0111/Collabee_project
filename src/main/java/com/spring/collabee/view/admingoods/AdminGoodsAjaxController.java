package com.spring.collabee.view.admingoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.goods.GoodsVO;

@RestController
public class AdminGoodsAjaxController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@ResponseBody
	@RequestMapping("/adminGoods/getJsonGoodsList.do")
	public List<GoodsVO> getJsonGoodsList(GoodsVO goods, String sword, Model model) {
		System.out.println(">> 상품목록 페이지에서 상품 검색");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sword", sword);
		map.put("productNum", goods.getProductNum());
		map.put("goods", goods);
		List<GoodsVO> list = adminGoodsService.adminGoodsList(map);
		
		System.out.println("키워드 : " + sword);
		//model.addAttribute("sword", sword);
		//model.addAttribute("goodsList", list);
		return list;
	}
}
