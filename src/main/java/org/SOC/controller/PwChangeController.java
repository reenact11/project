package org.SOC.controller;

import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.SOC.domain.PwChangeVO;
import org.SOC.service.PwChangeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pwchange")
public class PwChangeController {

	@Inject
	private PwChangeService pwchangeservice;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(PwChangeVO pwvo , HttpSession session, Model model) throws Exception {
		int check = pwchangeservice.searchid(pwvo);
		
		if(check==0) {
			model.addAttribute("msg","아이디 혹은 이메일이 올바르지 않습니다");
			return "/pwchange/fail";
		}
		
		// mail server 설정
		String host = "smtp.naver.com";
		final String user = "jmh4849@naver.com"; // 자신의 네이버 계정
		final String password = "wjdwlsgh1!";// 자신의 네이버 패스워드

		// 메일 받을 주소
		String to_email = pwvo.getUseremail();

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		System.out.println(AuthenticationKey);
		
		Session mailsession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(mailsession);
			msg.setFrom(new InternetAddress(user, "대한민국 1등 축구매칭. 싸칭"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요. 싸칭 비밀번호 변경 인증메일입니다.");
			// 메일 내용
			msg.setText("인증번호:" + temp);

			Transport.send(msg);
			System.out.println("이메일 전송");

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		session.setAttribute("AuthenticationKey", AuthenticationKey);
		// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
		model.addAttribute("useremail", pwvo.getUseremail());
		return "/pwchange/changePwd";
	}
	
	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public String change(PwChangeVO pwvo , HttpSession session, Model model) throws Exception {
		
		String AuthenticationKey = (String) session.getAttribute("AuthenticationKey");
		String AuthenticationUser = pwvo.getAuthenticationUser();
		if (!AuthenticationKey.equals(AuthenticationUser)) {
			System.out.println("인증번호 일치하지 않음");
			model.addAttribute("msg", "인증번호가 일치하지 않습니다");
			return "/pwchange/fail";
		}
		
		// 아래 부분에 새 비밀번호로 변경하는 로직이 필요하다.
			pwchangeservice.pwchange(pwvo);
			
			model.addAttribute("msg", "비밀번호 변경을 성공 했습니다.");
			return "/pwchange/fail";
		
		
	}
}
