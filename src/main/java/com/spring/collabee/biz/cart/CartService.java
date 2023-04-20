package com.spring.collabee.biz.cart;

import java.util.List;
import java.util.Map;

import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

public interface CartService {
	List<CartVO> getCartNLogin(CartVO vo);
	List<CartVO> getCartLogin(CartVO vo);
	
	void updateCartLogin(CartVO vo);
	
	void updateAddress(MemberVO vo);
	OrderVO getGrade(MemberVO vo);

	void updateNmLimit(CartVO vo);
	CartVO checkCartList(CartVO vo);
	GoodsVO goodsStatus(CartVO vo);
	
	void insertCart(CartVO vo);
	void updateCart(CartVO vo);
	void deleteCart(CartVO vo);
	
	int getCartCount(CartVO vo);
	
	List<CartVO> getCartList(CartVO vo);
	List<CartVO> getCartList1(CartVO vo);
	List<CartVO> getCartList2(CartVO vo);
	List<CartVO> getCartList3(CartVO vo);
	List<CartVO> getCartList4(CartVO vo);
}
