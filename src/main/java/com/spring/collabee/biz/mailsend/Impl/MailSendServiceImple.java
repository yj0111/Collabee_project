package com.spring.collabee.biz.mailsend.Impl;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.mailsend.MailSendService;

@Service("mailSendService")
public class MailSendServiceImple implements MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	
	public MailSendServiceImple() {
		System.out.println("MailSendServiceImple() 객체생성");
	}
	
	@Override
	public void makeRandomNumber() {
		System.out.println("makeRandomNumber() 실행 인증번호생성>>");
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}

	@Override
	public String mailAuth(String email) {
		System.out.println("mailAuth()실행>>");
		makeRandomNumber();
		String setFrom = "market.collabee@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[마켓콜라비] 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"마켓콜라비를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 [ " + authNumber + " ] 입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		System.out.println(">>mailAuth()종료 리턴값 : " +Integer.toString(authNumber));
		return Integer.toString(authNumber);
	}

	@Override
	public void mailSend(String setFrom, String toMail, String title, String content) {
		System.out.println("mailSend()실행>>");
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
			System.out.println("mailSend() 종료");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}

}
