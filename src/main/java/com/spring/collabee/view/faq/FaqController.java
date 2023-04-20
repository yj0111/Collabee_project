package com.spring.collabee.view.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.collabee.biz.faq.FaqService;
import com.spring.collabee.biz.faq.FaqVO;

@RequestMapping("/faq")
@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;

	public FaqController() {
		System.out.println(">>FaqController() 객체 생성");
	}


	 @RequestMapping("/faq.do") 
	 public String faq(){ 
		 System.out.println(">>FAQ 페이지");
		 return "/faq/faq"; 
		}
	 @RequestMapping("/faq_admin.do") 
	 public String faq_admin(){ 
		 System.out.println(">>FAQ 관리자 페이지");
		 return "/faq/faq_admin"; 
		}

	@ResponseBody
	@RequestMapping(value = "/getFaqList.do", method = RequestMethod.POST)
	public List<FaqVO> getFaqList(@RequestBody Map<String, Object> map) {
		System.out.println(">>> getFaqList Ajax 어찌고 썼다잉");
		String faqType = String.valueOf(map.get("faqType"));
		System.out.println("faqType:" + faqType);

		List<FaqVO> list = faqService.getFaqList(faqType);
		
		list = replaceNewLineChar(list);
		
		System.out.println("변경후 넘기기 직전 list:"+ list); 
		 
		return list;
	}

	private List<FaqVO> replaceNewLineChar(List<FaqVO> list) {
		
		int index = 0;
		for (FaqVO vo : list) {
			vo.setFaqContent(vo.getFaqContent().replace("\r\n", "<br>"));
			list.set(index, vo);
			index++;
			System.out.println("변경 후 vo : " + vo);
		}
		
		return list;
	}


	@RequestMapping("/faq_write.do")
	public String faq_write() {
		System.out.println(">>FAQ 페이지 작성 페이지");
		return "/faq/faq_write";
	}

	@RequestMapping(value = "/insertFaq.do", method = RequestMethod.POST)
	public String insertFaq(FaqVO vo) {
		System.out.println("===> Faq 입력");
		System.out.println("vo : " + vo);

		faqService.insertFaq(vo);

		return "redirect:/faq/faq_admin.do";
	}

	@RequestMapping("/faq_modify.do")
	public String faq_modify(FaqVO vo, Model model) {
		System.out.println(">>FAQ 페이지 수정 페이지");
		FaqVO faq = faqService.getFaq(vo);
		model.addAttribute("faq", faq);

		System.out.println("faq : " + faq);

		return "/faq/faq_modify";
	}

	@RequestMapping(value = "/updateFaq.do", method = RequestMethod.POST)
	public String updateNotice(FaqVO vo, int faqNum) {
		System.out.println("===> FAQ 수정");
		System.out.println(faqNum);
		faqService.updateFaq(vo);

		System.out.println("vo : " + vo);

		return "redirect:/faq/faq_admin.do";
	}

	@RequestMapping("/deletefaq.do")
	public String deleteFaq(FaqVO vo) {
		System.out.println(">> FAQ 삭제");
		System.out.println("vo : " + vo);

		faqService.deletFaq(vo);

		return "redirect:/faq/faq_admin.do";
	}

}
