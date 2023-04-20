package com.spring.collabee.biz.cart.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDao;
	
	public CartServiceImpl() {
	}
	
	@Override
	public List<CartVO> getCartNLogin(CartVO vo) {
		return cartDao.getCartNLogin(vo);
	}
	@Override
	public List<CartVO> getCartLogin(CartVO vo) {
		return cartDao.getCartLogin(vo);
	}

	@Override
	public void updateCartLogin(CartVO vo) {
		cartDao.updateCartLogin(vo);
	}

	@Override
	public void updateAddress(MemberVO vo) {
		cartDao.updateAddress(vo);
	}
	
	@Override
	public OrderVO getGrade(MemberVO vo) {
		return cartDao.getGrade(vo);
	}
	
	@Override
	public void updateNmLimit(CartVO vo) {
		cartDao.updateNmLimit(vo);
	}
	
	@Override
	public CartVO checkCartList(CartVO vo) {
		return cartDao.checkCartList(vo);
	}
	@Override
	public GoodsVO goodsStatus(CartVO vo) {
		return cartDao.goodsStatus(vo);
	}
	
	@Override
	public void insertCart(CartVO vo) {
		cartDao.insertCart(vo);
		
	}

	@Override
	public void updateCart(CartVO vo) {
		cartDao.updateCart(vo);
	}

	@Override
	public void deleteCart(CartVO vo) {
		cartDao.deleteCart(vo);
	}
	
	@Override
	public int getCartCount(CartVO vo) {
		return cartDao.getCartCount(vo);
	}
	
	@Override
	public List<CartVO> getCartList(CartVO vo) {
		return cartDao.getCartList(vo);
	}

	@Override
	public List<CartVO> getCartList1(CartVO vo) {
		return cartDao.getCartList1(vo);
	}

	@Override
	public List<CartVO> getCartList2(CartVO vo) {
		return cartDao.getCartList2(vo);
	}

	@Override
	public List<CartVO> getCartList3(CartVO vo) {
		return cartDao.getCartList3(vo);
	}

	@Override
	public List<CartVO> getCartList4(CartVO vo) {
		return cartDao.getCartList4(vo);
	}

	
	
}
