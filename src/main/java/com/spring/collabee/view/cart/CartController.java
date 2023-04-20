package com.spring.collabee.view.cart;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

@SessionAttributes({"orders", "nmember", "cartList", "cartCount", "cartList1", "cartList2", "cartList3", "cartList4"})
@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	public CartController() {
	}
	
	@RequestMapping("/cart.do")
	public String cart(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, CartVO cart, MemberVO mvo, OrderVO ovo) {
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		
		if (cookie == null && mvo == null) {
			// 비회원 장바구니 첫 클릭시 쿠키 생성
			String nmemberNum = RandomStringUtils.random(6, true, true);
			Cookie cartCookie = new Cookie("cartCookie", nmemberNum);
			
			// 비회원 데이터 유지기간 최대 3일 
			cartCookie.setPath("/");
			cartCookie.setMaxAge(60 * 60 * 24 * 3);
			response.addCookie(cartCookie);
			ovo.setNmemberNum(nmemberNum);
			
			model.addAttribute("nmember", ovo);
			
		} else if (cookie != null && mvo == null) {
			String nmemberNum = cookie.getValue();
			cart.setNmemberNum(nmemberNum);
			
			// 비회원 장바구니 조회
			List<CartVO> cartList = cartService.getCartList(cart);
			model.addAttribute("cartList", cartList);
			
			int cartCount = cartService.getCartCount(cart);
			model.addAttribute("cartCount", cartCount);
			
			List<CartVO> cartList1 = cartService.getCartList1(cart);
			List<CartVO> cartList2 = cartService.getCartList2(cart);
			List<CartVO> cartList3 = cartService.getCartList3(cart);
			List<CartVO> cartList4 = cartService.getCartList4(cart);
			
			model.addAttribute("cartList1", cartList1);
			model.addAttribute("cartList2", cartList2);
			model.addAttribute("cartList3", cartList3);
			model.addAttribute("cartList4", cartList4);
			
		} else {
			cart.setMemberNum(mvo.getMemberNum());
			
			//회원 장바구니 조회
			List<CartVO> cartList = cartService.getCartList(cart);
			model.addAttribute("cartList", cartList);
			
			int cartCount = cartService.getCartCount(cart);
			model.addAttribute("cartCount", cartCount);
			
			List<CartVO> cartList1 = cartService.getCartList1(cart);
			List<CartVO> cartList2 = cartService.getCartList2(cart);
			List<CartVO> cartList3 = cartService.getCartList3(cart);
			List<CartVO> cartList4 = cartService.getCartList4(cart);
			
			model.addAttribute("cartList1", cartList1);
			model.addAttribute("cartList2", cartList2);
			model.addAttribute("cartList3", cartList3);
			model.addAttribute("cartList4", cartList4);
			
			OrderVO orders = cartService.getGrade(mvo);
			model.addAttribute("orders", orders);
		}
		return "/cart/cart";
	}
	
	
}
