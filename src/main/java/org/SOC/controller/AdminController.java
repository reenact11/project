package org.SOC.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.SOC.domain.TeamVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.TeamList;
import org.SOC.dto.UserList;
import org.SOC.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminService adminservice;

	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public void Userlist(UserVO uvo , HttpSession session, Model model) throws Exception {
		uvo = (UserVO) session.getAttribute("login");
		int adminno = uvo.getUserno();
		List<UserList> userlist = adminservice.Userlist(adminno);
		
		model.addAttribute("userlist",userlist);
		
	}
	
	@RequestMapping(value = "/userlock", method = RequestMethod.GET)
	public String UserlockGET(UserVO uvo , HttpSession session, Model model) throws Exception {
		uvo.setUserlock("Y");
		
		adminservice.lockchange(uvo);
		session.setAttribute("msg","계정잠금 처리 하였습니다");
		return "/admin/userend";
	}
	
	@RequestMapping(value = "/userlock", method = RequestMethod.POST)
	public String UserlockPOST(UserVO uvo , HttpSession session, Model model) throws Exception {
		uvo.setUserlock("N");
		
		adminservice.lockchange(uvo);
		session.setAttribute("msg","계정잠금 해체처리 하였습니다");
		return "/admin/userend";
	}
	
	@RequestMapping(value = "/userdelete", method = RequestMethod.POST)
	public String Userdelete(@RequestParam("userno")int userno , HttpSession session, Model model) throws Exception {
		
		adminservice.userdelete(userno);
		session.setAttribute("msg","계정을 탈퇴처리 하였습니다");
		return "/admin/userend";
	}
	
	@RequestMapping(value = "/teamlist", method = RequestMethod.GET)
	public void Teamlist(HttpSession session, Model model) throws Exception {
		List<TeamList> teamlist = adminservice.Teamlist();
		
		model.addAttribute("teamlist",teamlist);
		
	}
	
	@RequestMapping(value = "/teamdelete", method = RequestMethod.POST)
	public String Teamdelete(TeamVO tvo, HttpSession session, Model model) throws Exception {
		
		adminservice.teamdelete(tvo.getTeamno());
		session.setAttribute("msg","팀을 해체처리 하였습니다");
		return "/admin/teamend";
	}
	
}
