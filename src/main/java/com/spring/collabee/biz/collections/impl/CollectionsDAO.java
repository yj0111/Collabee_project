package com.spring.collabee.biz.collections.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.collections.CategoriesVO;
import com.spring.collabee.biz.collections.DivisionVO;
import com.spring.collabee.biz.collections.SpecialCatVO;
import com.spring.collabee.biz.collections.SpecialVO;

import com.spring.collabee.biz.goods.GoodsVO;

@Repository
public class CollectionsDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CategoriesVO> getCategories() {
		System.out.println("===> MyBatis 사용  getCategories() 실행");
		return mybatis.selectList("collectionsDAO.getCategories");
	}

	public List<DivisionVO> getDivision() {
		System.out.println("===> MyBatis 사용  getDivision() 실행");
		return mybatis.selectList("collectionsDAO.getDivision");
	}

	public List<DivisionVO> getDivisionByCategory(DivisionVO vo) {
		return mybatis.selectList("collectionsDAO.getDivisionByCategory", vo);
	}

	public List<GoodsVO> getGoodsList() {
		System.out.println("===> MyBatis 사용  getGoodsList() 실행");
		return mybatis.selectList("collectionsDAO.getJsonGoodsList");
	}

	public List<GoodsVO> getGoodsList(Map<String, Object> map) {
		System.out.println("===> MyBatis 사용 getGoodsList(Map<String, Object> map) 실행");
		return mybatis.selectList("collectionsDAO.getJsonGoodsList", map);
	}

	public List<GoodsVO> getGoodsListByCategory(Map<String, Object> map) {
		System.out.println("===> MyBatis 사용 getGoodsListByCategory(DivisionVO vo) 실행");
		return mybatis.selectList("collectionsDAO.getGoodsListByCategory", map);
	}

	public List<GoodsVO> getspecial(int specialNum) {
		return mybatis.selectList("collectionsDAO.getSpecial", specialNum);
	}

	public List<SpecialCatVO> getSpecialCat() {
		return mybatis.selectList("collectionsDAO.getSpecialCat");
	}
	
	public int getJsonGoodsListCount() {
		System.out.println("DAO 상품 총수 매퍼 진입 전");
		return mybatis.selectOne("collectionsDAO.getJsonGoodsListCount");
	}
	
	public DivisionVO getCategoryName(DivisionVO vo) {
		return mybatis.selectOne("collectionsDAO.getCategoryName", vo);
	}

	public GoodsVO getOneGood(GoodsVO vo) {
		return mybatis.selectOne("collectionsDAO.getOneGood", vo);
	}
}
    

