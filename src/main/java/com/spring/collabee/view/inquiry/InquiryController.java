package com.spring.collabee.view.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.collabee.biz.faq.FaqVO;
import com.spring.collabee.biz.inquiry.InquiryService;
import com.spring.collabee.biz.inquiry.InquiryVO;

@RequestMapping("/inquiry")
@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;

	public InquiryController() {
		System.out.println(">>InquiryController() 객체 생성");
	}

	@RequestMapping("/inquiry.do")
	public String inquiry(InquiryVO vo, Model model) {
		System.out.println(">>1:1문의 페이지");

		List<InquiryVO> list = inquiryService.getInquiryList(vo);
		System.out.println("vo:" + vo);
		model.addAttribute("inquiryList", list);
		return "/inquiry/inquiry";
	}

	
	 @RequestMapping("/inquiry_write.do") 
	 
	 public String inquiry_write() {
	 System.out.println(">>1:1 문의 페이지 작성 페이지"); 
	 
	 return "/inquiry/inquiry_write"; 
	 
	 }
	  
	  @RequestMapping(value = "/insertInquiry.do", method = RequestMethod.POST) 
	  public String insertInquiry(InquiryVO vo){ 
		  System.out.println("===> Inquiry 입력");
		  System.out.println("vo : " + vo);
	  
		  inquiryService.insertInquiry(vo);
	  
		  return "redirect:/inquiry/inquiry.do";
		  
	  }
	
	  @RequestMapping("/admin_inquiry_answer.do") 
		 public String admin_inquiry_answer(InquiryVO vo, Model model) {
		 System.out.println(">>1:1 문의 페이지 답변페이지"); 
		 InquiryVO inquiry = inquiryService.getInquiry(vo);
		 model.addAttribute("inquiry", inquiry);
		 
		 System.out.println("inquiry" + inquiry);
		 return "/inquiry/admin_inquiry_answer"; 
		 		 
	}
	  
	  @RequestMapping(value = "/answerInquiry.do", method = RequestMethod.POST) 
	  public String answerInquiry(InquiryVO vo, int inquiryNum){ 
		  System.out.println("===> answerInquiry 답변 입력");
		  System.out.println(inquiryNum);
		  inquiryService.answerInquiry(vo);

		  System.out.println("vo : " + vo);
	  
	  
		  return "redirect:/inquiry/inquiry.do";
		  
	  } 

	  @RequestMapping("/admin_inquiry_modify.do") 
		 public String admin_inquiry_modify(InquiryVO vo, Model model) {
		 System.out.println(">>1:1 문의 페이지 답변수정페이지"); 
		 InquiryVO inquiry = inquiryService.getInquiry(vo);
		 model.addAttribute("inquiry", inquiry);
		 
		 System.out.println("inquiry" + inquiry);
		 return "/inquiry/admin_inquiry_modify"; 
		 		 
	}
	  
}
