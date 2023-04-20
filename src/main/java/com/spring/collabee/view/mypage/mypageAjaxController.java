package com.spring.collabee.view.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxService;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxVO;
import com.spring.collabee.biz.myorderlist.MyOrderListService;
import com.spring.collabee.biz.myorderlist.MyOrderListVO;
import com.spring.collabee.biz.mypicklist.MyPickListVO;
import com.spring.collabee.biz.mypicklist.MyPicklistService;
import com.spring.collabee.biz.myreview.MyReviewService;
import com.spring.collabee.biz.myreview.MyReviewWrtVO;
import com.spring.collabee.biz.pagination.PaginationVO;
import com.spring.collabee.biz.proqna.MyProQnaService;
import com.spring.collabee.biz.proqna.MyProQnaVO;

@RestController
@SessionAttributes("loginMember") //loginMember 라는 이름의 Model 객체가 있으면 session에 저장 
@RequestMapping("/mypage")
public class mypageAjaxController {
	@Autowired
	MemberService memberService;
	@Autowired
	MyCouponBoxService myCouponBoxService;
	@Autowired
	EmoneyUsageService emoneyUsageService;
	@Autowired
	MyPicklistService myPicklistService;
	@Autowired
	MyOrderListService myOrderListService;
	@Autowired
	MyReviewService myReviewService;
	@Autowired
	MyProQnaService proQnaService;

	private PaginationVO p;
	
	
	public mypageAjaxController() {
		System.out.println("● mypageAjaxController 객체 생성");
	}
	
	@RequestMapping("/oldPwChkAjax.do") 
	public boolean oldPwChk(@RequestBody MemberVO mvo) {
		System.out.println("oldPwChk() 실행");	
		System.out.println("받은값 : " + mvo);
		MemberVO findMember = memberService.login(mvo);
		System.out.println("찾은 비번 : " + memberService.login(mvo).getPassword() );
		
		if (findMember != null) {
			System.out.println("비밀번호찾기 성공 >>");	
			if (mvo.getPassword().equals(findMember.getPassword())) {
				System.out.println("true리턴");
				return true;				 
			} else {
				return false;
			}
		} else {
			System.out.println("비밀번호찾기 실패 (사용자정보없음) >>");
			return false;
		}		
	
	}
	
	@RequestMapping("/modifyAjax.do") 
	public boolean modify(@RequestBody MemberVO mvo, Model model) {
		System.out.println("modify() 실행");	
		System.out.println("받은값 : "  + mvo);
		int result = memberService.modify(mvo);
		System.out.println("result : " + result );
		if (result < 0) {
			return false;
		} else {
			MemberVO loginMember = memberService.getMember(mvo.getId());
			model.addAttribute("loginMember", loginMember);
			return true;			
		}
		
	}

	/*
	 * @RequestMapping("/leaveAjax.do") public String leaveAjax(MemberVO mvo,
	 * SessionStatus sessionStatus) { System.out.println("leaveAjax.do 실행 > mvo : "
	 * + mvo ); memberService.leave(mvo); return "mypage/logout.do"; }
	 */
	
	
	//마이페이지 상단 쿠폰 갯수
	@RequestMapping("/getCouponCntAjax.do")
	public int getCouponCnt (@RequestBody MemberVO mvo) {
		System.out.println(">> getCouponCnt() 실행 ");
		System.out.println(">> 쿠폰 갯수 : " + myCouponBoxService.getCouponCnt(mvo));
		return myCouponBoxService.getCouponCnt(mvo);
	}

	//쿠폰페이지
	@RequestMapping("/couponAjax.do")
	public List<MyCouponBoxVO> getCouponBoxList(@RequestBody MemberVO mvo) {	
		System.out.println("coupon() 실행");	
		System.out.println("받은값 : " + mvo);
		System.out.println("보낼 값 : " + myCouponBoxService.getCouponBoxList(mvo));
		return myCouponBoxService.getCouponBoxList(mvo);
	}
	
	//마이페이지 상단 총 적립금
	@RequestMapping("/getTotEmoneyAjax.do")
	public int getTotEmoney (@RequestBody MemberVO mvo, Model model) {
		System.out.println(">> 마이페이지 상단 적립금");
		System.out.println("적립금 받은값 : " + emoneyUsageService.getTotEmoney(mvo));
			int totEmoney = emoneyUsageService.getTotEmoney(mvo);
			model.addAttribute("totEmoney", totEmoney);
			return 	emoneyUsageService.getTotEmoney(mvo);			
	}
	
	//적립금 내역 페이지
	@RequestMapping("/emoneyAjax.do")
	public List<EmoneyUsageVO> getEmoneyUsage(@RequestBody MemberVO mvo, Model model) {	
		System.out.println("getEmoneyUsage () 실행");	
		System.out.println("받은값 : " + mvo);
	
		return emoneyUsageService.getEmoneyUsageList(mvo);
	}
	
	
	@RequestMapping("/getEmoneyPagination.do")
	public Map <String, Object> getEmoneyPagination (@RequestBody Map<String, String> pageInfo, Model model) {
		String memberNum = pageInfo.get("memberNum");
		String cPage = pageInfo.get("cPage");
		
		
		int totRecod = emoneyUsageService.getEmoneyUsageCnt(Integer.parseInt(memberNum));
		//System.out.println(emoneyUsageService.getEmoneyUsageList(memberNum).toString());
		p = new PaginationVO();
		
		p.setTotalRecord(totRecod);
		p.setTotalPage();
		System.out.println("전체글갯수: " + p.getTotalRecord());
		System.out.println("전체페이지: " + p.getTotalPage());
		
		//현재 페이지 구하기 
		 //없으면 null 현재페이지는 cPage설정X
		if(cPage != null){  
			p.setNowPage(Integer.parseInt(cPage)); 	
		}
		System.out.println("> cPage :" + cPage);
		System.out.println("> paging nowPage :" + p.getNowPage());
		
		//3. 현재페이지에 표시할 게시글 시작번호(begin) 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());  // nowPage= 3 일때 end 6
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1); // begin 4
		
		if(p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1; 
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);

		//-- 끝페이지(endPage)가 전체 페이지수(totalPage) 보다 크면 
		// 끝 페이지를 전체페이지 수로 변경
		if(p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		System.out.println("> BeginPage :" + p.getBeginPage());
		System.out.println("> endPage :" + p.getEndPage() + "\n");
		
		
		Map<String, Integer> getPageInfo = new HashMap<String, Integer>();
		getPageInfo.put("memberNum",Integer.parseInt(memberNum));
		getPageInfo.put("begin", p.getBegin());
		getPageInfo.put("end", p.getEnd());
		List<EmoneyUsageVO> emoneyPage = emoneyUsageService.getEmoneyPage(getPageInfo);
		
		model.addAttribute("page", p);
		System.out.println("컨트롤러 p" + p);
		Map <String, Object> result = new HashMap<String, Object>();
		result.put("pageVO", p);
		result.put("pageContent",emoneyPage);
		
		return result;
	}
	


	
	//주문목록
	@RequestMapping("/getOrderListAjax.do")
	public List<MyOrderListVO> getOrderList(@RequestBody Map<String,Integer> orderInfo) {
		System.out.println("getOrderList() 실행 ~~> 주문목록불러오기");
		int memberNum = (int) orderInfo.get("memberNum");
		int period = (int) orderInfo.get("period");
		System.out.println(">>>> 주문목록 받아온 멤버 : " + memberNum );
		System.out.println(">>>> 주문목록 받아온 기간 : " + period );

		//회원의 전체 주문 목록 찾아오기
		List<MyOrderListVO> orderListAll = myOrderListService.getOrderList(orderInfo);
		System.out.println("orderListAll>>> " + orderListAll);
		
		//주문번호 별로 1건의 데이터만 저장(주문번호별 보기)
		Map<String, MyOrderListVO> orderList = new HashMap<String, MyOrderListVO>();
		for(int i = 0; i <orderListAll.size(); i++) {
			//리스트의 인덱스를 꺼내서(OrderListVO 에 담음)
			MyOrderListVO olvo  = orderListAll.get(i);
			//map에 넣어줌 (주문번호가 중복이면 첫번째만 들어감)
			orderList.put(olvo.getOrderNum(), olvo);	
		}
		
		List<MyOrderListVO> myOrderList = new ArrayList<MyOrderListVO>();
		for ( String key : orderList.keySet() ) {
			myOrderList.add(orderList.get(key));
		}
		System.out.println("view단으로 보낼 orderList : " + myOrderList);
		return	myOrderList;
	
	}
	
	/*주문상세
	@RequestMapping("/getOrderDetailAjax.do")
	public List<MyOrderListVO> getOrderDetailAjax(@RequestBody Map<String, Integer> orderInfo) {
		System.out.println("getOrderDetail() 실행 ~~> 주문상세불러오기");
		System.out.println(">>>> 주문상세 받아온 값 : " + orderInfo.get("memberNum"));
		System.out.println(">>>> 주문상세 받아온 값 : " + orderInfo.get("orderNum"));
		//null값 처리하기
		return myOrderListService.getOrderDetailAjax(orderInfo);
		
	}*/
	//주문상세
	@RequestMapping("/getOrderDetailAjax.do")
	public List<MyOrderListVO> getOrderDetail(@RequestBody Map<String, Object> orderInfo) {
		System.out.println("getOrderDetail() 실행 ~~> 주문상세불러오기");
		System.out.println(">>>> 주문상세 받아온 값 : " + orderInfo.get("memberNum"));
		System.out.println(">>>> 주문상세 받아온 값 : " + orderInfo.get("orderNum"));
		return myOrderListService.getOrderDetail(orderInfo);
	}
	
	//주문상세 전체상품 다시담기
	@RequestMapping("/addAllAjax.do")
	public List<Integer> addAllProductNum (@RequestBody Map<String, Object> orderInfo){
		List<MyOrderListVO> orderList = myOrderListService.getOrderDetail(orderInfo);
		List<Integer> allProductNum = new ArrayList<Integer>();
		for(int i=0; i < orderList.size(); i++) {
			int productNum = orderList.get(i).getProductNum();
			allProductNum.add(productNum);
		}
		System.out.println("전체주문 상품번호만 : " + allProductNum.toString());
		return allProductNum;
		
	}
	
	
	
	
	//찜하기
	@RequestMapping("addPickList.do")
	public int addPickList(@RequestBody Map<String, Integer> addPickInfo) {
		System.out.println("addPickInfo : " + addPickInfo);

		int findResult = myPicklistService.findPickItem(addPickInfo); //찾기
		if (findResult > 1) {
			myPicklistService.delPickList(addPickInfo);//삭제	
			return 0; //있으면 삭제
		} else {
			myPicklistService.addPickList(addPickInfo);//추가			
			return 1;
		}
	}
	
	//찜한상품조회
	@PostMapping("/getPickListAjax.do")
	public List<MyPickListVO> getPickList(@RequestBody MemberVO mvo) {	
		System.out.println("getPickList() 실행>>");	
		System.out.println("getPickList 받은값 : " + mvo);
		
		return myPicklistService.getPickList(mvo);
	}
	
	
	//찜한상품 목록에서 삭제
	@RequestMapping("/delPickListAjax.do")
	public int delPickList (@RequestBody Map<String, Integer> pickInfo) {
		System.out.println("delPickList() 실행 ~~> 찜한상품 삭제");
		System.out.println(">>>> 찜한상품 회원번호 : " + pickInfo.get("memberNum"));
		System.out.println(">>>> 찜한상품 제품번호 : " + pickInfo.get("productNum"));
		
		return myPicklistService.delPickList(pickInfo);
	}	
	
	
	
	//리뷰 목록 가져오기
	@PostMapping("/getMemberReviewAjax.do")
	public List<MyReviewWrtVO> getMemberReview (@RequestBody Map<String, String> reviewInfo) {
		System.out.println("getMemberReviewAjax() 실행");
		System.out.println(">>>> 리뷰가져오기 회원번호 : " + reviewInfo.get("memberNum"));
		System.out.println(">>>> controller리뷰구분 : " + reviewInfo.get("reviewStatus"));
	
		System.out.println("리뷰 작성가능 목록: ");
		return  myReviewService.getMyReview(reviewInfo);

	}
	
	/*작성한 리뷰 조회
	@RequestMapping("/seeMyReviewAjax.do")
	public MyReviewWrtVO seeMyReview (@RequestBody Map<String, String> reviewInfo) {
		return myReviewService.seeMyReview(reviewInfo);		
	} 안씀*/ 
	

	
	@RequestMapping("/getMyProQnaAjax.do")
	public List<MyProQnaVO>getMyProQna(@RequestBody MemberVO mvo) {
		return proQnaService.getMyProQna(mvo);
	}
	

	
	
	
}
