package com.spring.collabee.biz.mailsend;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;


public interface MailSendService {
	//인증번호
	public void makeRandomNumber(); 
	// 인증 이메일 양식
	public String mailAuth(String email); 
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content); 

	
}