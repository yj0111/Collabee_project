package com.spring.collabee.view.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

@SessionAttributes("nmember")
@RestController
@RequestMapping("/cart")
public class CartAjaxController {

	@Autowired
	private CartService cartService;
	
	public CartAjaxController() {
	}
	
	
	@RequestMapping(value="/cartAdd.do", method = RequestMethod.POST)
	public int cartAdd(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, MemberVO mvo, @RequestBody Map<String, Object> map, CartVO cart, OrderVO ovo) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		
		String productNum = String.valueOf(map.get("productNum"));
		String count = String.valueOf(map.get("count"));
		
		cart.setProductNum(Integer.parseInt(productNum));
		cart.setCount(Integer.parseInt(count));
		
		GoodsVO chk = cartService.goodsStatus(cart);
		if (chk.getStock() == 0 || String.valueOf(chk.getProductDel()) == "Y" ) {
			// 구매 불가 상품
			return 0;
		} else {
			
			if (cookie == null && mvo == null) {
				// 비회원 장바구니 상품 첫 추가시 쿠키 생성
				String nmemberNum = RandomStringUtils.random(6, true, true);
				Cookie cartCookie = new Cookie("cartCookie", nmemberNum);
				
				// 비회원 데이터 유지기간 최대 3일 
				cartCookie.setPath("/");
				cartCookie.setMaxAge(60 * 60 * 24 * 3);
				response.addCookie(cartCookie);
				
				ovo.setNmemberNum(nmemberNum);
				model.addAttribute("nmember", ovo);
				// 비회원 상품 추가
				cart.setNmemberNum(nmemberNum);
				cartService.insertCart(cart);
				
				return 1;
				
			} else if (cookie != null && mvo == null) {
				// 비회원 장바구니 상품 추가
				String nmemberNum = cookie.getValue();
				
				// 비회원 데이터 유지기간 최대 3일 
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 3);
				response.addCookie(cookie);
				
				// 비회원 상품 추가
				cart.setNmemberNum(nmemberNum);
				// 장바구니 상품 존재 여부 확인
				CartVO confirm = cartService.checkCartList(cart);
				if (confirm == null) {
					// 비존재시 장바구니 추가 1 리턴
					cartService.insertCart(cart);
					
					return 1;
				} else {
					int countAdd = confirm.getCount();
					int stock = confirm.getStock();
					
					// 존재시 재고보다 적다면 추가 2 리턴
					if (stock > countAdd) {
						countAdd += cart.getCount();
						if (countAdd > stock) {
							countAdd = stock;
						}
						if (countAdd > 10 ) {
							countAdd = 10;
						}
						cart.setCount(countAdd);
						cartService.updateCart(cart);
						
						return 2;
					} else {
						// 이미 재고와 같을 때 3 리턴
						return 3;
					}
				}
			} else if (mvo != null) {
				//회원 장바구니 상품 추가
				cart.setMemberNum(mvo.getMemberNum());
				// 장바구니 상품 존재 여부 확인
				CartVO confirm = cartService.checkCartList(cart);
				if (confirm == null) {
					// 비존재시 장바구니 추가 1 리턴
					cartService.insertCart(cart);
					
					return 1;
				} else {
					int countAdd = confirm.getCount();
					int stock = confirm.getStock();
					
					// 존재시 재고보다 적다면 추가 2 리턴
					if (stock > countAdd) {
						countAdd += cart.getCount();
						if (countAdd > stock) {
							countAdd = stock;
						}
						if (countAdd > 10 ) {
							countAdd = 10;
						}
						cart.setCount(countAdd);
						cartService.updateCart(cart);
						
						return 2;
					} else {
						// 이미 재고와 같을 때 3 리턴
						return 3;
					}
				}
			} 
		}
			
		return 4;
	}
	
	@RequestMapping(value = "/updateCart.do", method = RequestMethod.POST)
	public int updateCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String, Object> map, MemberVO mvo, CartVO cart) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		String productNum = String.valueOf(map.get("productNum"));
		String count = String.valueOf(map.get("count"));

		cart.setProductNum(Integer.parseInt(productNum));
		cart.setCount(Integer.parseInt(count));
		
		if (mvo == null) {
			// 비회원 장바구니 상품 수량 변경
			String nmemberNum = cookie.getValue();
			cart.setNmemberNum(nmemberNum);
			cartService.updateCart(cart);
		} else {
			// 회원 장바구니 상품 수량 변경
			cart.setMemberNum(mvo.getMemberNum());
			cartService.updateCart(cart);
		}
		return 1;
	}
	
	@RequestMapping(value = "/changeAddr.do", method = RequestMethod.POST)
	public int changeAddr(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String, Object> map, Model model, MemberVO mvo, OrderVO ovo) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		String address = String.valueOf(map.get("address"));
		String addrDetail = String.valueOf(map.get("addressDetail"));
		 
		if (mvo == null) {
			if (session.getAttribute("nmember") == null) {
				ovo.setNmemberNum(cookie.getValue());
				ovo.setOrderAddr(address);
				ovo.setOrderAddrDetail(addrDetail);
				System.out.println("-----------비회원 주소" + ovo.toString());
				model.addAttribute("nmember", ovo);
			} else {
				ovo = (OrderVO) session.getAttribute("nmember");
				ovo.setOrderAddr(address);
				ovo.setOrderAddrDetail(addrDetail);
				System.out.println("----------------비회원 주소" + ovo.toString());
				model.addAttribute("nmember", ovo);
			}
		} else {
			mvo.setAddress(address);
			mvo.setAddressDetail(addrDetail);
			cartService.updateAddress(mvo);
		}
		
		return 1;
	}

	@RequestMapping(value = "/delectCart.do", method = RequestMethod.POST)
	public int delectCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "chbox[]") List<String> list, MemberVO mvo, CartVO cart) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		
		int result = 0;
		int productNum = 0;
		
		if (mvo == null) {
			// 비회원 장바구니 상품 삭제
			String nmemberNum = cookie.getValue();
			cart.setNmemberNum(nmemberNum);
		} else {
			// 회원 장바구니 상품 삭제
			cart.setMemberNum(mvo.getMemberNum());
		}
		
		for (String i : list) {
			productNum = Integer.parseInt(i);
			cart.setProductNum(productNum);
			cartService.deleteCart(cart);
			
			result = 1;
		}
		return result;
	}

}
