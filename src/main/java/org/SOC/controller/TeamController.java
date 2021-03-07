package org.SOC.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.SOC.domain.TeamVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.FormList;
import org.SOC.dto.TReview;
import org.SOC.dto.TeamPage;
import org.SOC.dto.Teammember;
import org.SOC.service.TeamService;
import org.SOC.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/team")
public class TeamController {

	@Inject
	private TeamService teamservice;
	@Inject
	private UserService userservice;

	
	@RequestMapping(value = "/maketeam", method = RequestMethod.GET)
	public String maketeam(HttpSession session, Model model) throws Exception {
		TeamVO tvo = (TeamVO) session.getAttribute("teaminfo");
		if(tvo!=null) {
			session.setAttribute("msg","이미 가입한 팀이 존재합니다");
			return "team/makeAlert";
		}
		return "team/maketeam";
	}

	@RequestMapping(value = "/maketeam", method = RequestMethod.POST)
	public String maketeam(TeamVO TVO, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("TVO",TVO);
		UserVO uvo = (UserVO) session.getAttribute("login");
		int userno = uvo.getUserno();
		map.put("userno",userno);
		teamservice.maketeam(map);
		
		TeamVO teamvo = teamservice.search(userno);
		UserVO uservo = userservice.rolecheck(userno);
		session.setAttribute("msg","팀생성에 성공 하였습니다");
		session.setAttribute("teaminfo",teamvo);
		session.setAttribute("login",uservo);
		return "team/makeAlert";
		
	}
	
	@RequestMapping(value="/teampage",method= RequestMethod.GET)
	public void teampage(UserVO vo , HttpSession session , Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo = (UserVO) session.getAttribute("login");
		int userno = vo.getUserno();
		TeamPage TP = teamservice.teampage(userno);
		map.put("teaminfo",TP);
		
		int teamno = TP.getTeamno();
		List<Teammember> teammember = teamservice.teammember(teamno);
		map.put("teammember",teammember);
		
		List<FormList> fl = teamservice.formlist(userno);
		map.put("formlist",fl);
		
		List<TReview> TR = teamservice.treviewlist(teamno);
		int avgbpm = teamservice.teamavg(teamno);
		
		map.put("teamreview",TR);
		map.put("avgbpm",avgbpm);
		
		session.setAttribute("teaminfoMap" , map);
	}
	
	@RequestMapping(value="/teaminfo",method= RequestMethod.POST)
	public void teaminfo(TeamVO tvo , HttpSession session , Model model) throws Exception{
		
		TeamPage TP = teamservice.teaminfo(tvo.getTeamname());
		int avgbpm = teamservice.teamavg(TP.getTeamno());
		model.addAttribute("teaminfo" , TP);
		model.addAttribute("avgbpm",avgbpm);
	}
	
	@RequestMapping(value="/teammodify",method= RequestMethod.GET)
	public void teampageGET(HttpSession session , Model model) throws Exception{
	}
	
	@RequestMapping(value="/teammodify",method= RequestMethod.POST)
	public String teampagePOST(TeamPage TP , HttpSession session , Model model) throws Exception{
		
		teamservice.teammodify(TP);
		return "redirect:/team/teampage";
	}
	
	@RequestMapping(value="/teamquit",method= RequestMethod.GET)
	public String teamquit(HttpSession session , Model model) throws Exception{
		UserVO uvo = (UserVO) session.getAttribute("login");
		teamservice.teamquit(uvo.getUserno());
		model.addAttribute("msg","팀에서 탈퇴하셨습니다");
		session.setAttribute("teaminfo",null);
		return "/team/deleteAlert";
	}
	
	@RequestMapping(value="/teamdelete",method= RequestMethod.GET)
	public String teamdelete(HttpSession session , Model model) throws Exception{
		TeamVO tvo = (TeamVO) session.getAttribute("teaminfo");
		UserVO uvo = (UserVO) session.getAttribute("login");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("teamno",tvo.getTeamno());
		map.put("userno",uvo.getUserno());
		
		int memsearch = teamservice.memsearch(tvo.getTeamno());
		if(memsearch > 1 ) {
			model.addAttribute("msg","팀원이 존재할 경우 해체하실 수 없습니다.");
			return "/team/makeAlert";
		}
		teamservice.teamdelete(map);
		
		model.addAttribute("msg","팀이 해체 되었습니다");
		session.setAttribute("teaminfo",null);
		return "/team/deleteAlert";
	}
	
	@RequestMapping(value="/leaderchange",method= RequestMethod.POST)
	public String teampagePOST(String usernname , HttpSession session , Model model) throws Exception{
		UserVO uvo = (UserVO) session.getAttribute("login");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usernname" , usernname);
		map.put("loginno" , uvo.getUserno());
		
		teamservice.leaderchange(map);
		
		session.setAttribute("msg","직책이 변경 되었습니다");
		return "/team/makeAlert";
	}
	
	@RequestMapping("/getAttach/{teamno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("teamno") Integer teamno) throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@"+teamservice.getAttach(teamno));
		return teamservice.getAttach(teamno);
	}
	

}
