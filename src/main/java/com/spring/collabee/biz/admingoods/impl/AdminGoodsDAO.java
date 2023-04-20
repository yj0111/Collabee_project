package com.spring.collabee.biz.admingoods.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.admingoods.adminPaginationVO;
import com.spring.collabee.biz.goods.GoodsVO;

@Repository
public class AdminGoodsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminGoodsDAO() {
		System.out.println(">> AdminGoodsDAO() 객체 생성");
	}
	
	
	//상품 입력
	public void adminGoodsInsert(GoodsVO vo) {
		System.out.println(">> Mybatis 사용 adminGoodsInsert() 실행");
		mybatis.insert("adminGoodsDAO.adminGoodsInsert", vo);
	}
	
	
	//상품 수정
	public void adminGoodsModify(GoodsVO vo) {
		System.out.println(">> Mybatis 사용 adminGoodsModify() 실행");
		mybatis.update("adminGoodsDAO.adminGoodsModify", vo);
	}
	
	//상품 삭제
	public void adminGoodsDelete(GoodsVO vo) {
		System.out.println(">> Mybatis 사용 adminGoodsDelete() 실행");
		mybatis.delete("adminGoodsDAO.adminGoodsDelete", vo);
	}
	
	
	//상품목록 전체 리스트 보기
	public List<GoodsVO> adminGoodsList(Map<String, Object> map){
		System.out.println(">> Mybatis 사용 adminGoodsList(vo) 실행");
		
		return mybatis.selectList("adminGoodsDAO.adminGoodsList", map);
	}
	
	//상품 상세 조회
	public GoodsVO adminGoodsSelect(GoodsVO vo) {
		System.out.println(">> Mybatis 사용 adminGoodsSelect(vo) 실행");
		
		return mybatis.selectOne("adminGoodsDAO.adminGoodsSelect", vo);
	}


	//판매자 조회
	public GoodsVO adminName(GoodsVO vo) {
		System.out.println(">> Mybatis 사용 adminName(vo) 실행");
		
		return mybatis.selectOne("adminGoodsDAO.adminName", vo);
	}
	
	//상품 총 개수 조회
	public int goodsCount() {
		
		return mybatis.selectOne("adminGoodsDAO.goodsCount");
	}

	//페이징 처리 상품리스트 조회
	public List<adminPaginationVO> selectList(adminPaginationVO vo) {

		return mybatis.selectList("adminGoodsDAO.selectList", vo);
	}

	
}
