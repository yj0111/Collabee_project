package com.spring.collabee.view.goods;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.goods.GoodsQnAVO;
import com.spring.collabee.biz.goods.GoodsReviewVO;
import com.spring.collabee.biz.goods.GoodsService;
import com.spring.collabee.biz.goods.GoodsVO;
import com.spring.collabee.biz.goods.OrderReviewVO;
import com.spring.collabee.biz.member.MemberVO;

@SessionAttributes("goods")
@RequestMapping("/goods")
@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;

	@Autowired
	private EmoneyUsageService emoneyService;
	
	public GoodsController() {
		System.out.println(">>GoodsController() 객체 생성");

	}

	@RequestMapping("/goodsContent.do")
	public String getGoods(HttpSession session, GoodsVO vo, GoodsReviewVO rvo, GoodsQnAVO qvo, MemberVO mvo, Model model) {
		System.out.println(">>상세 페이지");
		System.out.println("goodsService : " + goodsService);
		// 상품
		GoodsVO goods = goodsService.getGoods(vo);
		model.addAttribute("goods", goods);
		System.out.println("goods : " + goods);
		
		mvo = (MemberVO) session.getAttribute("member");

		List<GoodsReviewVO> rlist = goodsService.getReviewList(rvo);
		model.addAttribute("rlist", rlist);
		
		
//		
//		GoodsReviewVO review = goodsService.getReview(rvo);
//		model.addAttribute("review", review);
//		
//		List<GoodsReviewVO> recentList = goodsService.getRecentList(rvo);
//		model.addAttribute("recent", recentList);
//		
//		List<GoodsReviewVO> recommendList = goodsService.getRecommendList(rvo);
//		model.addAttribute("recommend", recommendList);
//		
//		goodsService.insertReview(rvo);
//		goodsService.updatePoint(rvo);
//		goodsService.updateReview(rvo);
//		goodsService.deleteReview(rvo);
//		
		List<GoodsQnAVO> qlist = goodsService.getQnAList(qvo);
		model.addAttribute("qlist", qlist);
//		
//		GoodsQnAVO qna = goodsService.getQnA(qvo);
//		model.addAttribute("qna", qna);
//		
//		goodsService.insertQnA(qvo);
//		goodsService.updateQnA(qvo);
//		goodsService.deleteQnA(qvo);
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if (member != null) {
			Map<String, Object> Rmap = new HashMap<>();
			Rmap.put("memberNum", member.getMemberNum());
			Rmap.put("productNum", vo.getProductNum());
			List<OrderReviewVO> list = goodsService.checkReviewNotYet(Rmap);
			model.addAttribute("orderReviewList", list);
			System.out.println("불러온 리뷰안쓴 주문목록 : " + list);
		}
		
		
		System.out.println("열리기 직전");

		return "/goods/goodsContent";
	}
	
		//리뷰전체보기
		@RequestMapping("/getReviewList.do")
		public String getReviewList(GoodsReviewVO rvo, Model model) {
			System.out.println("getReviewList() 실행 ~");
			
			List<GoodsReviewVO> rlist = goodsService.getReviewList(rvo);
			model.addAttribute("rlist", rlist);
			
			return "/goods/goodsContent";
			
		}
		
		//리뷰 글 한개 검색
		@RequestMapping("/getReview.do")
		public String getReview(GoodsReviewVO rvo, Model model) {
			System.out.println("getReview() 실행 ");
			
			GoodsReviewVO review = goodsService.getReview(rvo);
			model.addAttribute("review", review);
			
			return "/goods/goodsContent";
		}
		
	
		//후기 최근등록순 조회
		@RequestMapping("/getRecent.do")
		public String getRecent(GoodsReviewVO rvo, Model model) {
			System.out.println("getRecent()실행");
			
			List<GoodsReviewVO> recentList = goodsService.getRecentList(rvo);
			model.addAttribute("recent", recentList);
			
			return "/goods/goodsContent";
		}
		
		//후기 추천순 조회
		@RequestMapping("/getRecommend.do")
		public String getRecommend(GoodsReviewVO rvo, Model model) {
			System.out.println("getRecommend() 실행");
			
			List<GoodsReviewVO> recommendList = goodsService.getRecommendList(rvo);
			model.addAttribute("recommend", recommendList);
			
			return "/goods/goodsContent";
		}
		
		//리뷰 입력
		@RequestMapping(value = "/insertReview.do", method = RequestMethod.POST) 
		public String insertReview(GoodsReviewVO rvo, @RequestParam int productNum, @RequestParam String grade) throws IllegalStateException, IOException {
			
			System.out.println("받아온 rvo : " + rvo);
			MultipartFile uploadFile = rvo.getUploadFile();
			System.out.println(">> uploadFile : " + uploadFile);
			
			String saveFileName = null;
			
			if (uploadFile == null) {
				System.out.println("::: uploadFile 파라미터가 전달되지 않았을때~");
			} else if (!uploadFile.isEmpty()) {
				saveFileName = UUID.randomUUID().toString() + ".jpg";
				System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
				String fileName = uploadFile.getOriginalFilename(); //원본파일명
				System.out.println("::: 원본파일명 : " + fileName);
				System.out.println("::: 저장파일명 : " + saveFileName);
				uploadFile.transferTo(new File("C:\\MyStudy\\70_Spring2\\Collabee12-14\\WebContent\\resources\\imgs\\review\\" + saveFileName));
				
				rvo.setrSysFilename(saveFileName);
				rvo.setrOriFilename(fileName);
			}
			
			
			System.out.println("grade : " + grade);
			if(grade.equals("1")) {
				if (rvo.getrOriFilename() != null) {
					rvo.setPoint(200);
				} else {
					rvo.setPoint(100);
				}
			} else {
				if (rvo.getrOriFilename() != null) {
					rvo.setPoint(100);
				} else {
					rvo.setPoint(50);
				}
			}
			
			System.out.println("등급 분기 후 vo : " + rvo);
			
			goodsService.insertReview(rvo);
			goodsService.updateReviewState(rvo);
			goodsService.updatePoint(rvo);
			System.out.println("rvo : " + rvo);
			
			return "redirect:/goods/goodsContent.do?productNum=" + productNum;
		}
		
		
		// 리뷰 중복 확인
		@ResponseBody
		@RequestMapping("/reviewDoubleCheck.do")
		public Map<String, Object> reviewDoubleCheck(String productNum, String memberNum) {
			
			Map<String, Object> Rmap = new HashMap<>();
			Map<String, Object> Smap = new HashMap<>();
			System.out.println("가져온 데이터 : " + productNum + memberNum);
			Rmap.put("productNum", productNum);
			Rmap.put("memberNum", memberNum);
			
			int result = goodsService.reviewDoubleCheck(Rmap);
			System.out.println("리뷰 더블첵 결과 : " +result);
			if(result > 0) {
				System.out.println("중복된 리뷰!!!!!!!!!!!!!!");
				Smap.put("result", "exist");
			} else if(result == 0){
				System.out.println("아직안쓴 리뷰!!!!!!!!!!!!!!");
				Smap.put("result", "Nexist");
			} else {
				System.err.println("reviewDoubleCheck.do 에러남");
			}
			return Smap;
		}
		
		// 작성하지 않은 리뷰 있는지 확인
		@ResponseBody
		@RequestMapping("/checkReviewNotYet.do")
		public List<OrderReviewVO> checkReviewNotYet(String productNum, String memberNum){
			
			Map<String, Object> Rmap = new HashMap<>();
			Map<String, Object> Smap = new HashMap<>();
			System.out.println("가져온 데이터 : " + productNum + memberNum);
			Rmap.put("productNum", productNum);
			Rmap.put("memberNum", memberNum);
			
			List<OrderReviewVO> list = goodsService.checkReviewNotYet(Rmap);
			
			System.out.println("등록안한 리뷰 리스트 : " + list);
			return list;
		}
		
		//리뷰 수정
		@RequestMapping("/updateReview.do")
		public String updateReview(GoodsReviewVO rvo, @RequestParam int productNum) throws IllegalStateException, IOException {
			System.out.println(">> 리뷰 수정");
			
			MultipartFile uploadFile = rvo.getUploadFile();
			System.out.println(">> uploadFile : " + uploadFile);
			
			if (uploadFile == null) {
				System.out.println("::: uploadFile 파라미터가 전달되지 않았을때~");
			} else if (!uploadFile.isEmpty()) {
				System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
				String fileName = uploadFile.getOriginalFilename(); //원본파일명
				System.out.println("::: 원본파일명 : " + fileName);
				System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
				uploadFile.transferTo(new File("c:/Users/itwill/git/collabee/src/main/webapp/resources/imgs/review/" + UUID.randomUUID().toString()));
			}
			
			goodsService.updateReview(rvo);
			System.out.println("rvo : " + rvo);
			
			return "redirect:/goods/goodsContent.do?productNum=" + productNum;
		}
		
		//리뷰 삭제
		@RequestMapping(value = "/deleteReview.do")
		public String deleteReview(GoodsReviewVO rvo, @RequestParam int productNum) {
			goodsService.deleteReview(rvo);
			
			return "redirect:/goods/goodsContent.do?productNum=" + productNum;
		}
		
		
		//문의 전체 조회
		@RequestMapping("/getQnAList.do")
		public String getQnAList(GoodsQnAVO qvo, Model model) {
			System.out.println("getQnAList() 실행");
			
			List<GoodsQnAVO> qlist = goodsService.getQnAList(qvo);
			System.out.println("qlist: " + qlist);
			model.addAttribute("qlist", qlist);
			
			return "/goods/goodsContent";
		}
		
		//문의 한개 조회
		@RequestMapping("/getQnA.do")
		public String getQnA(GoodsQnAVO qvo, Model model) {
			System.out.println("getQnA() 실행");
			
			GoodsQnAVO qna = goodsService.getQnA(qvo);
			model.addAttribute("qna", qna);
			
			return "/goods/goodsContent";
		}
		
		
		//문의 입력
		@RequestMapping(value = "/insertQnA.do", method = RequestMethod.POST)
		public String insertQnA(GoodsQnAVO qvo, @RequestParam int productNum) {
			System.out.println("qvo : " + qvo);
			goodsService.insertQnA(qvo);
			
			return "redirect:/goods/goodsContent.do?productNum=" + productNum;
		}
		
		//문의 수정
		@RequestMapping(value = "/updateQnA.do", method = RequestMethod.POST)
		public String updateQnA(GoodsQnAVO qvo, @RequestParam int productNum) {
			System.out.println(">>문의 수정");
			System.out.println("qvo : " + qvo);
			goodsService.updateQnA(qvo);
			
			return "redirect:/goods/goodsContent.do?productNum=" + productNum;
		}
		
		//문의 삭제
		@RequestMapping(value = "/deleteQnA.do")
		public String deleteQnA(GoodsQnAVO qvo, @RequestParam int productNum) {
			goodsService.deleteQnA(qvo);
			
			return "redirect:/goods/goodsContent.do?productNum=" + productNum;
		}
	
		//관리자 문의 페이지 이동
		@RequestMapping("/adminGoodsQue.do")
		public String adminGoodsAnswer(GoodsQnAVO qvo, Model model) {
			System.out.println(">>관리자 - 문의 리스트페이지");

			List<GoodsQnAVO> qlist = goodsService.getQList(qvo);
			System.out.println("qvo:" + qvo);
			model.addAttribute("qlist", qlist);
			System.out.println("qlist: " + qlist);

			return "/goods/adminGoodsQue";

		}
		
		//관리자 문의 답변 페이지 
		@RequestMapping("/adminGoodsAnswer.do")
		public String admin_goods_answer(GoodsQnAVO qvo, Model model) {
			System.out.println(">>상품 문의 페이지 답변페이지");
			GoodsQnAVO qna = goodsService.getQnA(qvo);
			model.addAttribute("qna", qna);

			System.out.println("qna" + qna);
			return "/goods/adminGoodsAnswer";

		}
		
		//관리자 문의 답변
		@RequestMapping(value = "/answerQna.do", method = RequestMethod.POST)
		public String answerQna(GoodsQnAVO qvo, int proQnaNum) {
			System.out.println("===> 상품 문의 답변 입력");
			System.out.println(proQnaNum);
			goodsService.answerQna(qvo);

			System.out.println("qvo : " + qvo);

			return "redirect:/goods/adminGoodsQue.do";

		}
		
		//관리자 문의 답변 수정페이지
		@RequestMapping("/adminModifyAnswer.do")
		public String adminModifyAnswer(GoodsQnAVO qvo, Model model) {
			System.out.println(">>상품 문의 페이지 답변페이지");
			GoodsQnAVO qna = goodsService.getQnA(qvo); 
			model.addAttribute("qna", qna);
			  
			 System.out.println("qna" + qna);
			 
			return "/goods/adminModifyAnswer";

		}
	
	
	
	
	
}