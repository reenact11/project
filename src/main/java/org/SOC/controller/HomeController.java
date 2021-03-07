package org.SOC.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.SOC.domain.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,Model model,HttpSession session) {
		
		return "main/home";
	}
	
	@RequestMapping(value = "/main/Alert", method = RequestMethod.GET)
	public void Alertreturn(Locale locale,Model model,HttpSession session) {
		
		UserVO uvo = (UserVO) session.getAttribute("login");
		String dest = (String) session.getAttribute("dest");
		
		if(uvo == null && dest.equals("/")) {
			model.addAttribute("loginmsg","환영합니다! 최고의 축구매칭! 싸칭입니다!");
		}else {
			model.addAttribute("loginmsg","저희 싸칭의 모든 기능은 로그인 후 이용하실 수 있습니다");
		}
		
	}
	
	@RequestMapping(value = "/main/home", method = RequestMethod.GET)
	public void homereturn(Locale locale,Model model) {
	}
	

}
