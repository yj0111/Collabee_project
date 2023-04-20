package com.spring.collabee.biz.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
	}
	
	public List<CartVO> getCartNLogin(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartNLogin", vo);
	}
	public List<CartVO> getCartLogin(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartLogin", vo);
	}
	public void updateCartLogin(CartVO vo) {
		mybatis.update("cartDAO.updateCartLogin", vo);
	}

	public void updateAddress(MemberVO vo) {
		mybatis.update("cartDAO.updateAddress", vo);
	}
	
	public OrderVO getGrade(MemberVO vo) {
		return mybatis.selectOne("cartDAO.getGrade", vo);
	}
	
	public void updateNmLimit(CartVO vo) {
		mybatis.update("cartDAO.updateNmLimit", vo);
	}
	public CartVO checkCartList(CartVO vo) {
		return mybatis.selectOne("cartDAO.checkCartList", vo);
	}
	public GoodsVO goodsStatus(CartVO vo) {
		return mybatis.selectOne("cartDAO.getProductStatus", vo);
	}
	public void insertCart(CartVO vo) {
		mybatis.insert("cartDAO.insertCart", vo);
	}

	public void updateCart(CartVO vo) {
		mybatis.update("cartDAO.updateCart", vo);
	}

	public void deleteCart(CartVO vo) {
		mybatis.delete("cartDAO.deleteCart", vo);
	}
	
	public int getCartCount(CartVO vo) {
		return mybatis.selectOne("cartDAO.getCartCount", vo);
	}
	
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartList", vo);
	}
	
	public List<CartVO> getCartList1(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartList1", vo);
	}

	public List<CartVO> getCartList2(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartList2", vo);
	}

	public List<CartVO> getCartList3(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartList3", vo);
	}

	public List<CartVO> getCartList4(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartList4", vo);
	}
}
