package com.spring.collabee.biz.collections;

import java.util.List;
import java.util.Map;

import com.spring.collabee.biz.goods.GoodsVO;

public interface CollectionsService {
	
		List<CategoriesVO> getCategories(); 
		List<DivisionVO> getDivision();
		List<DivisionVO> getDivisionByCategory(DivisionVO vo);
		List<GoodsVO> getGoodsList();
		List<GoodsVO> getGoodsList(Map<String, Object> map);
		List<GoodsVO> goodsListByCategory(Map map);
		List<GoodsVO> getSpecial(int specialNum);
		List<SpecialCatVO> getSpecialCat();
		int getJsonGoodsListCount();
		DivisionVO getCategoryName(DivisionVO vo);
		GoodsVO getOneGood(GoodsVO vo);

}
