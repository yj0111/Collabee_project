package com.spring.collabee.view.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderCouponVO;
import com.spring.collabee.biz.order.OrderService;
import com.spring.collabee.biz.order.OrderVO;

@SessionAttributes({"orderGoods", "orders", "couponCnt","couponCntN", "couponList", "couponListN", "save"})
@RestController
@RequestMapping("/order")
public class OrderAjaxController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private EmoneyUsageService emoneyService;
	
	@Autowired
	private OrderService orderService;
	
	public OrderAjaxController() {
	}
	
	@RequestMapping(value="/cartToOrder.do", method = RequestMethod.POST)
	public int cartToOrder(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam(value = "chbox[]") List<String> list, MemberVO mvo, CartVO cart, OrderVO ovo, OrderVO orders) {
		
		
		if (session.getAttribute("loginMember") == null) {
			// 비회원 주문
			if ( session.getAttribute("nmember") == null) {
				Cookie cookie = WebUtils.getCookie(request, "cartCookie");
				ovo.setNmemberNum(cookie.getValue());
			} else {
				ovo = (OrderVO) session.getAttribute("nmember");
			}
			cart.setNmemberNum(ovo.getNmemberNum());
			orders.setNmemberNum(ovo.getNmemberNum());
			
		} else {
			// 회원 주문
			mvo = (MemberVO) session.getAttribute("loginMember");
			orders = (OrderVO) session.getAttribute("orders");
			
			cart.setMemberNum(mvo.getMemberNum());
			orders.setMemberNum(mvo.getMemberNum());
			
			// 적립금 저장
			orders.setUsageAmount(emoneyService.getTotEmoney(mvo));
		}

		// 주문 상품 저장
		int productNum = 0;
		
		List<CartVO> orderGoods = new ArrayList<CartVO>();
		for (String i : list) {
			productNum = Integer.parseInt(i);
			cart.setProductNum(productNum);
			orderGoods.add(cartService.checkCartList(cart));
		}
		model.addAttribute("orderGoods", orderGoods);
		
		// 주문 금액 저장
		int totPriceTemp = 0;
		int totGoodsprice = 0;
		int totDiscount = 0;
		
		for (CartVO goods : orderGoods) {
			totPriceTemp += (goods.getSaleprice() * goods.getCount());
			totGoodsprice += (goods.getPrice() * goods.getCount());
		}
		totDiscount =  totGoodsprice - totPriceTemp;
		
		orders.setTotPrice(totPriceTemp);
		orders.setTotGoodsprice(totGoodsprice);
		orders.setTotDiscount(totDiscount);
		
		if (orders.getMemberNum() != 0) {
			// 쿠폰 수량 조회
			int couponCnt = orderService.getCouponCnt(orders);
			int couponCntN = orderService.getCouponCntN(orders);
			model.addAttribute("couponCnt", couponCnt);
			model.addAttribute("couponCntN", couponCntN);
			
			// 쿠폰 리스트 저장
			if (couponCnt != 0) {
				List<OrderCouponVO> couponList = orderService.getCouponList(orders);
				model.addAttribute("couponList", couponList);
			}
			if (couponCntN != 0) {
				List<OrderCouponVO> couponListN = orderService.getCouponListN(orders);
				model.addAttribute("couponListN", couponListN);
			}
		}
		model.addAttribute("orders", orders);
		
		return 1;
	}
	
	@RequestMapping(value="/changeOrderData.do", method = RequestMethod.POST)
	public OrderVO changeOrderData(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, MemberVO mvo, @RequestBody OrderVO omember, OrderVO orders) {
		orders = (OrderVO) session.getAttribute("orders");
		
		orders.setOrderName(omember.getOrderName());
		orders.setOrderPhone(omember.getOrderPhone());
		orders.setOrderAddr(omember.getOrderAddr());
		orders.setOrderAddrDetail(omember.getOrderAddrDetail());
		orders.setOrderPlace(omember.getOrderPlace());
		orders.setOrderRequest(omember.getOrderRequest());
		
		model.addAttribute("orders", orders);
		
		return orders;
	}

	@RequestMapping(value="/orderSend.do", method = RequestMethod.POST)
	public OrderVO orderSend(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, MemberVO mvo, @RequestBody OrderVO omember, OrderVO orders, CartVO cart) {
		orders = (OrderVO) session.getAttribute("orders");
		
		orders.setOrderNum(omember.getOrderNum());
		orders.setDeliveryPick(omember.getDeliveryPick());
		orders.setDeliveryFee(omember.getDeliveryFee());
		orders.setTotGoodsprice(omember.getTotGoodsprice());
		orders.setTotDiscount(omember.getTotDiscount());
		orders.setTotPrice(omember.getTotPrice());
		orders.setPtNum(omember.getPtNum());
		
		if (orders.getMemberNum() != 0) {
			orders.setCouponNum(omember.getCouponNum());
			orders.setUsageAmount(omember.getUsageAmount());

			cart.setMemberNum(orders.getMemberNum());
		}
		if (orders.getNmemberNum() != null) {
			cart.setNmemberNum(orders.getNmemberNum());
		}
		model.addAttribute("orders", orders);
		orderService.insertOrders(orders);
		
		cart.setOrderNum(orders.getOrderNum());

		// 주문 상품 저장
		int productNum = 0;
		
		List<CartVO> orderGoods = (List<CartVO>) session.getAttribute("orderGoods");
		for (CartVO cvo : orderGoods) {
			productNum = cvo.getProductNum();
			cart.setProductNum(productNum);
			cart.setCount(cvo.getCount());
			cart.setSaleprice(cvo.getSaleprice());
			cart.setPrice(cvo.getPrice());
			
			orderService.insertOrderProduct(cart);
			cartService.deleteCart(cart);
			
			// 재고 수정
			orderService.updateStock(cart);
		}
		
		if (orders.getMemberNum() != 0) {
			// 적립금 적립
			int saverate = orders.getSaverate();
			double saverated = ((double)saverate / 100);
			
			int totPrice = 0;
			if (orders.getDeliveryFee() == 0 ) {
				totPrice = orders.getTotPrice();
			} else {
				totPrice = orders.getTotPrice() - 3000;
			}
			int save = (int)Math.round(saverated * totPrice);
			model.addAttribute("save", save);
			
			EmoneyUsageVO saveVO = new EmoneyUsageVO();
			saveVO.setMemberNum(orders.getMemberNum());
			saveVO.setAmount(save);
			saveVO.setOrderNum(orders.getOrderNum());
			
			orderService.insertSaveEmoney(saveVO);
			
			// 적립금 사용
			if (orders.getUsageAmount() != 0) {
				EmoneyUsageVO use = new EmoneyUsageVO();
				use.setAmount(orders.getUsageAmount());
				use.setMemberNum(orders.getMemberNum());
				use.setOrderNum(orders.getOrderNum());
				
				orderService.insertUseEmoney(use);
			}
			
			// 쿠폰 사용
			if (orders.getCouponNum() != 0) {
				orderService.useCoupon(orders);
			}
		}
		return orders;
	}
	
	@RequestMapping(value="/orderChk.do", method= RequestMethod.POST)
	public Map<String, Object> orderChk(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestBody OrderVO orderChk, OrderVO nOrders, Map<String, Object> map) {
		if (orderService.getNMember(orderChk) != null) {
			nOrders = orderService.getNMember(orderChk);
			List<CartVO> nOrderGoods = new ArrayList<CartVO>();
			nOrderGoods = orderService.getNMemberOrderList(nOrders);
			
			map = new HashMap<String, Object>();
			map.put("nOrders", nOrders);
			map.put("nOrderGoods", nOrderGoods);
			map.put("result", 1);
		} else {
			map.put("result", 0);
		}
		return map;
	}
}
