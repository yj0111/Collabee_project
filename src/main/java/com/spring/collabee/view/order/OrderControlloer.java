package com.spring.collabee.view.order;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/order")
@Controller
public class OrderControlloer {
	
	public OrderControlloer() {
	}
	
	@RequestMapping("/order.do")
	public String order() {
		
		return "/order/order";
	}
	
	@RequestMapping("/orderComplete.do")
	public String orderComplete() {
		return "/order/orderComplete";
	}
	
	@RequestMapping("/cartadd.do")
	public String cartadd() {
		return "/order/cartadd";
	}
}
