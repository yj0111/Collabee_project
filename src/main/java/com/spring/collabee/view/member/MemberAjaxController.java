package com.spring.collabee.view.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.collabee.biz.mailsend.MailSendService;
import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@RestController 
@SessionAttributes("loginMember") // loginMember 라는 이름의 Model 객체가 있으면 session에 저장 
@RequestMapping("/member")
public class MemberAjaxController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailSendService mailService; //메일인증객체
	
	@PostMapping("/signupAjax.do")
	public boolean signup(@RequestBody MemberVO mvo, Model model) {
		System.out.println("signupAjax() 실행");
		int result = memberService.signup(mvo);
		if(result < 1) {
			System.out.println("회원가입 실패");
			return false; 
		} else {
			System.out.println("회원가입 성공");
			model.addAttribute("singUpId", mvo.getId());
			return true;
		}
	}
	
	
	@RequestMapping("/loginAjax.do")
	public Map<String, String> loginAjax(@RequestBody MemberVO mvo) { //@RequestBody post방식
		System.out.println("=> MemberAjaxController loginAjax() 실행 ");

		MemberVO findMember = memberService.login(mvo); 
		System.out.println("find member : " + findMember);
		Map<String, String> map = new HashMap<String,String>(); 
		
		if(findMember != null) {// 회원정보 있음
			
			System.out.println("getMemberState() : " + findMember.getMemberState());
			if (findMember.getMemberState().equals("L")) {
				map.put("result", "L");// 탈퇴회원 
			} else if (findMember.getMemberState().equals("D")){
				map.put("result", "D");//휴면회원
			} else if (findMember.getMemberState().equals("A")) {
				map.put("result", "A");//로그인 가능 
			}
		} else { //회원정보 없음
			map.put("result", "N");
		}
		return map;
	}
	

	@PostMapping("/findIdAjax.do")
	public MemberVO findId(@RequestBody MemberVO mvo) {
		System.out.println("[POST] findId() 실행");
		System.out.println("mvo : " + mvo);
		MemberVO findMember =  memberService.findId(mvo) ;
		System.out.println("findMember: " + findMember);
		
		if (findMember != null) {
			System.out.println("아이디 찾음 >>");	
		} else {
			System.out.println("아이디 찾기 실패 - 사용자정보없음 >>");
			findMember = mvo;
		}
		return findMember;
	}
	
	@PostMapping("/findPwAjax.do")
	public MemberVO findPw(@RequestBody MemberVO mvo) {
		System.out.println("[POST] findPw() 실행");
		System.out.println("mvo : " + mvo);
		MemberVO findMember =  memberService.findPw(mvo);
		System.out.println("findMember: " + findMember);
		
		if (findMember != null) {
			System.out.println("비밀번호 찾음>>");	
		} else {
			System.out.println("비밀번호찾기 실패 - 사용자정보없음 >>");
			findMember = mvo;
		}
		return findMember;
	}
	//이메일 인증요청
	@RequestMapping("mailAuthAjax.do")
	public String mailAuth(@RequestBody MemberVO mvo) {
		System.out.println("이메일 인증 요청 들어옴!");
		System.out.println("MemberVO mvo : " + mvo);
		System.out.println("이메일 인증 받을 이메일 : " + mvo.getEmail());
		return mailService.mailAuth(mvo.getEmail());
	}
	
	@RequestMapping("/confirmIdAjax.do") 
	public boolean confirmId(@RequestBody MemberVO mvo) {
		System.out.println("confirmId() 실행");
		System.out.println(">> [아이디 중복검사] 입력받은 값 : " + mvo.getId());
		
		//DB에 아이디 있는지 확인
		if (memberService.confirmId(mvo.getId()) != null) {
			return false;// 사용중인 아이디
		} else {
			return true;// 사용가능 아이디			
		}
	}
	
	//회원가입시 사용
	@RequestMapping("/signUpConfirmEmailAjax.do") 
	public Map<String, String> signUpConfirmEmailAjax(@RequestBody MemberVO mvo) {
		System.out.println("confirmEmail() 실행");	
		System.out.println(">> [이메일중복검사] 입력받은 값vo : " + mvo);
		MemberVO findMember = memberService.confirmModifyEmail(mvo);
		Map<String, String> map = new HashMap<String,String>(); 
		
		if (findMember!= null) { //이메일 사용자 있음
			System.out.println(">> return duplicate ");
			map.put("result", "duplicate"); //중복 이메일(사용불가)
		} else {
			System.out.println(">> return available ");
			map.put("result", "available"); //사용가능 이메일
		}	
		return map;
	}
	
	//회원정보 변경시 사용
	@RequestMapping("/confirmEmailAjax.do") 
	public Map<String, String> confirmModifyEmail(@RequestBody MemberVO mvo) {
		System.out.println("confirmEmail() 실행");	
		System.out.println(">> [이메일중복검사] 입력받은 값vo : " + mvo);
		MemberVO findMember = memberService.confirmModifyEmail(mvo);
		Map<String, String> map = new HashMap<String,String>(); 
		
		if (findMember!= null) {
			if(mvo.getId().equals(findMember.getId())) {
				System.out.println(">> return same ");
				map.put("result", "same"); //기존에 사용하던 이메일
			} else { 
				System.out.println(">> return duplicate ");
				map.put("result", "duplicate"); //중복 이메일(사용불가)
			}
		} else {
			System.out.println(">> return available ");
			map.put("result", "available"); //사용가능 이메일
		}	
		return map;
	}
	

	
}
