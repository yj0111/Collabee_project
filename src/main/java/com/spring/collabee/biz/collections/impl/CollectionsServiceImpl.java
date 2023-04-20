package com.spring.collabee.biz.collections.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.collections.CategoriesVO;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.collections.DivisionVO;
import com.spring.collabee.biz.collections.SpecialCatVO;
import com.spring.collabee.biz.collections.SpecialVO;
import com.spring.collabee.biz.goods.GoodsVO;

@Service
public class CollectionsServiceImpl implements CollectionsService{
	
	@Autowired
	private CollectionsDAO collectionsDAO;
	
	@Override
	public List<CategoriesVO> getCategories() {
		return collectionsDAO.getCategories();
	}

	@Override
	public List<DivisionVO> getDivision() {
		return collectionsDAO.getDivision();
	}

	@Override
	public List<DivisionVO> getDivisionByCategory(DivisionVO vo) {
		return collectionsDAO.getDivisionByCategory(vo);
	}

	@Override
	public List<GoodsVO> getGoodsList() {
		return collectionsDAO.getGoodsList();
	}

	@Override
	public List<GoodsVO> getGoodsList(Map<String, Object> map) {
		return collectionsDAO.getGoodsList(map);
	}

	@Override
	public List<GoodsVO> goodsListByCategory(Map map) {
		return collectionsDAO.getGoodsListByCategory(map);
	}

	@Override
	public List<GoodsVO> getSpecial(int specialNum) {
		return collectionsDAO.getspecial(specialNum);
	}

	@Override
	public List<SpecialCatVO> getSpecialCat() {
		return collectionsDAO.getSpecialCat();
	}
	
	@Override
	public int getJsonGoodsListCount() {
		return collectionsDAO.getJsonGoodsListCount();
	}

	@Override
	public DivisionVO getCategoryName(DivisionVO vo) {
		return collectionsDAO.getCategoryName(vo);
	}

	@Override
	public GoodsVO getOneGood(GoodsVO vo) {
		return collectionsDAO.getOneGood(vo);
		
	}

}
