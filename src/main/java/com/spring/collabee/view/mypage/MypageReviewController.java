package com.spring.collabee.view.mypage;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.collabee.biz.myreview.MyReviewService;
import com.spring.collabee.biz.myreview.ProReviewVO;


@Controller
@SessionAttributes("myReview")
@RequestMapping("/mypage")
public class MypageReviewController {
	@Autowired
	MyReviewService myReviewService;
	
	//페이지 로드
	@GetMapping("/review.do")
	public String review(Model model) {
		ProReviewVO myReview = new ProReviewVO();
		model.addAttribute("myReview",myReview);
		return "/mypage/review";
	}
	
	
	//리뷰작성
	@RequestMapping("/writeProReview.do")
	public String writeProReview(ServletRequest request, @RequestParam MultipartFile rOriFilename, Model model) throws IllegalStateException, IOException {
		System.out.println("writeProReview 실행" );
		ProReviewVO prvo = new ProReviewVO();
		
		prvo.setOrderNum(request.getParameter("orderNum"));
		prvo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
		prvo.setMemberNum(Integer.parseInt(request.getParameter("memberNum")));
		prvo.setrContent(request.getParameter("Rcontent"));
		System.out.println(prvo.toString());
     
		if(rOriFilename == null) {
			System.out.println("파일업로드 안함");
			prvo.setPoint(50);
		} else if (!rOriFilename.isEmpty()){
			System.out.println("파일업로드 했음");
			String oriFile =  rOriFilename.getOriginalFilename();	
			
			//확장자 추출
			String extension = null;
	        int index = oriFile.lastIndexOf(".");	
	        if (index > 0) {
	        	extension = "."+oriFile.substring(index + 1);
	            System.out.println(extension);  // txt
	        }
	        
			String sysFile = UUID.randomUUID().toString() + extension;
			System.out.println(":: 원본 파일명 : " + oriFile);
			System.out.println(":: 저장 파일명 : " + sysFile);
			prvo.setrOriFilename(oriFile);
			prvo.setrSysFilename(sysFile);
			prvo.setPoint(200);
			rOriFilename.transferTo(new File("c:/Users/itwill/git/collabee/src/main/webapp/resources/imgs/review/"+sysFile)); //저장경로 설정
		}
		int rvResult = myReviewService.wrietReview(prvo);
		model.addAttribute("rvResult", rvResult);
		return "redirect:/mypage/review.do";
	}
		
	
	
	//리뷰 수정
	@RequestMapping("/modifyProReview.do")
	public String modifyProReview(ServletRequest request, Model model)  {
		System.out.println("modifyProReview 실행" );
	
		ProReviewVO prvo = new ProReviewVO();
		
		prvo.setReviewNum(Integer.parseInt(request.getParameter("reviewNum")));
		prvo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
		prvo.setOrderNum(request.getParameter("orderNum"));
		prvo.setMemberNum(Integer.parseInt(request.getParameter("memberNum")));
		prvo.setrContent(request.getParameter("R_content"));
		System.out.println("리뷰 수정내용 : " + prvo);
		
		int rvResult = myReviewService.modifyReview(prvo);
		model.addAttribute("rvResult", rvResult);
		return "redirect:/mypage/review.do";
	}

	
}
