package org.SOC.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.SOC.domain.RegisterVO;
import org.SOC.domain.TeamVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.LoginDTO;
import org.SOC.dto.MyFormList;
import org.SOC.dto.Mypage;
import org.SOC.dto.UReview;
import org.SOC.dto.UserInfo;
import org.SOC.service.TeamService;
import org.SOC.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService userservice;
	@Inject
	private TeamService teamservice;

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UserVO vo = userservice.login(dto);

		if (vo == null) {
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			return;
		}
		if (vo.getUserlock().equals("Y")) {
			session.setAttribute("msg", "관리자에 의해 잠금 처리된 계정입니다");
			return;
		}
		TeamVO tvo = teamservice.search(vo.getUserno());
		model.addAttribute("userVO", vo);
		model.addAttribute("teamVO", tvo);

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7; // 1주일

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			userservice.keepLogin(vo.getUserid(), session.getId(), sessionLimit);
		}
		// session.getId() = 로그인시 session상에 입력되어지는 session의 고유id
		log.info("loginPOST...........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void register(RegisterVO RVO, HttpSession session, Model model) throws Exception {
		log.info("register...........start");
		userservice.register(RVO);
		log.info("register...........end");
		
	}

	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public int idcheck(String userid) throws Exception {
		log.info("idcheck...........start");
		int result = userservice.idcheck(userid);
		log.info("idcheck...........end");
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/nnamecheck", method = RequestMethod.POST)
	public int nnamecheck(String usernname) throws Exception {
		log.info("nnamecheck...........start");
		int result = userservice.nnamecheck(usernname);
		log.info("nnamecheck...........end");
		return result;
		
	}


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		log.info("logout...........start");
		Object obj = session.getAttribute("login");

		if (obj != null) {
			UserVO vo = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userservice.keepLogin(vo.getUserid(), session.getId(), new Date());
			}

		}
		log.info("logout...........end");
		return "/user/logout";
	}
	
	@RequestMapping(value="/mypage",method= RequestMethod.GET)
	public String mypage(UserVO vo , HttpSession session , Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo = (UserVO) session.getAttribute("login");
		int userno = vo.getUserno();
		
		Mypage MP = userservice.mypage(userno);
		map.put("myinfo",MP);
		
		List<MyFormList> mfl = userservice.myformlist(userno);
		map.put("myformlist",mfl);
		
		List<UReview> UR = userservice.ureviewlist(userno);
		int avgbpm = userservice.useravg(userno);
		
		map.put("userreview",UR);
		map.put("avgbpm",avgbpm);
		
		model.addAttribute("mypage" , map);
		return "user/mypage";
	}
	
	@RequestMapping(value="/mymodify",method= RequestMethod.GET)
	public void mymodifyGET(HttpSession session , Model model) throws Exception{
		UserVO uvo = (UserVO) session.getAttribute("login");
		model.addAttribute(userservice.mypage(uvo.getUserno()));
	}
	
	@RequestMapping(value="/mymodify",method= RequestMethod.POST)
	public String mymodifyPOST(Mypage MP , HttpSession session , Model model) throws Exception{
		log.info("mymodify...........start");
		userservice.mymodify(MP);
		log.info("mymodify...........end");
		return "redirect:/user/mypage";
	}
	
	@RequestMapping(value="/mydelete",method= RequestMethod.GET)
	public void mydelete(UserVO vo , HttpSession session , Model model) throws Exception{
		vo = (UserVO) session.getAttribute("login");
		int userno = vo.getUserno();
		userservice.mydelete(userno);
	}
	
	@RequestMapping(value="/userinfo",method= RequestMethod.GET)
	public void userinfo(@RequestParam("usernname") String usernname , HttpSession session , Model model) throws Exception{
		UserInfo UI = userservice.userinfo(usernname);
		int avgbpm = userservice.useravg(UI.getUserno());
		model.addAttribute("userinfo" , UI);
		model.addAttribute("avgbpm",avgbpm);
	}

}
