package org.SOC.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.domain.PageMaker;
import org.SOC.domain.TeamVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.FormList;
import org.SOC.dto.FromTtoT;
import org.SOC.dto.FromTtoU;
import org.SOC.dto.MatchDTO;
import org.SOC.dto.Reviewdata;
import org.SOC.service.TeamService;
import org.SOC.service.Team_GuestMatchService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/matchboard")
public class MatchController {

	@Inject
	private Team_GuestMatchService TGmatchservice;
	@Inject
	private TeamService teamservice;

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("mccri") MatchCollectCriteria mccri, HttpSession session, Model model)
			throws Exception {
		
		UserVO uvo = (UserVO)session.getAttribute("login");
		if(uvo.getUserrole().equals("무소속") && mccri.getCategory().equals("VSTeam")) {
			model.addAttribute("loginmsg","팀 매치 게시판은 팀장만 접속 가능합니다.");
			return "/main/Alert";
		}
		
		String boardname;

		switch (mccri.getCategory()) {
		case "VSTeam":
			boardname = "팀대 팀";
			break;
		case "PlusGuest":
			boardname = "용병 모집";
			break;
		default:
			boardname = "미구현";
			break;
		}

		model.addAttribute("list", TGmatchservice.listCriteria(mccri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setMccri(mccri);
		pageMaker.setTotalmcCount(TGmatchservice.countPaging(mccri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardname", boardname);
		log.info("show list page......................" + mccri.toString());
		
		return "/matchboard/listPage";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writerGET(@RequestParam String category, @RequestParam String boardname, Model model) throws Exception {
		model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		log.info("writer get ........... category = " + category + ", boardname = " + boardname);
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(MatchDTO mto, @ModelAttribute("boardname") String boardname,Model model, HttpSession session)
			throws Exception {
		log.info("write post ...........");
		log.info(mto.toString());
		log.info("132322222222222@" + mto.getCategory());
		UserVO uvo = (UserVO) session.getAttribute("login");
		int userno = uvo.getUserno();
		mto.setUserno(userno);
		mto.setCategory(mto.getCategory());
		TGmatchservice.write(mto);
		model.addAttribute("category",mto.getCategory());

		return "redirect:/matchboard/listPage";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("postno") int postno, @RequestParam("boardname") String boardname, Model model)
			throws Exception {
		model.addAttribute("boardname", boardname);
		model.addAttribute(TGmatchservice.read(postno));
		log.info("mod get............");
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(MatchDTO mto, HttpSession session, Model model) throws Exception {
		log.info("mod post............");
		TGmatchservice.modify(mto);
		model.addAttribute("category", mto.getCategory());
		return "redirect:/matchboard/listPage";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String removePOST(MatchDTO mto, HttpSession session, Model model) throws Exception {
		TGmatchservice.remove(mto.getPostno());
		model.addAttribute("category", mto.getCategory());
		log.warn("category................." + mto.getCategory());
		return "redirect:/matchboard/listPage";
	}

	@RequestMapping(value = "/formsend", method = RequestMethod.POST)
	public ResponseEntity<String> formsend(@RequestBody FormVO fvo) throws Exception {

		ResponseEntity<String> entity = null;
		try {
			log.info("formsend....start" + fvo);
			TGmatchservice.formsend(fvo);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		log.info("formsend....end");
		return entity;
	}

	@RequestMapping(value = "/yes", method = RequestMethod.POST)
	public String yes(FormList fl, HttpSession session, Model model) throws Exception {
		TGmatchservice.matchVSteam(fl);
		model.addAttribute("msg", "팀 매치를 수락 하였습니다");
		return "/collectboard/joinAlert";
	}

	@RequestMapping(value = "/no", method = RequestMethod.POST)
	public String no(FormList fl, HttpSession session, Model model) throws Exception {
		TGmatchservice.addGuest(fl);
		model.addAttribute("msg", "팀 매치를 거절 하였습니다");
		return "/collectboard/joinAlert";
	}

	@RequestMapping(value = "/FromTtoT", method = RequestMethod.GET)
	public String FromTtoTeamGET(Reviewdata rdata, HttpSession session, Model model) throws Exception {
		TeamVO teamVO = (TeamVO) teamservice.search(rdata.getUserno());
		log.info("@@@@@@@@@@@@@@@@@@@" + teamVO);
		FromTtoT TtoT = new FromTtoT();
		TtoT.setTeamno(teamVO.getTeamno());
		TtoT.setFormno(rdata.getFormno());
		log.info("@@@@@@@@@@@@@@@@@@@" + TtoT);

		model.addAttribute("TtoT", TtoT);
		return "/matchboard/ReviewForm";
	}

	@RequestMapping(value = "/FromTtoT", method = RequestMethod.POST)
	public String FromTtoTeamPOST(@ModelAttribute("TtoT") FromTtoT TtoT, HttpSession session, Model model)
			throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@@" + TtoT);
		TGmatchservice.fromttot(TtoT);
		model.addAttribute("msg", "정상적으로 등록되었습니다.");
		return "/matchboard/FromTalert";
	}

	@RequestMapping(value = "/FromUtoT", method = RequestMethod.GET)
	public String FromUtoTeamGET(Reviewdata rdata, HttpSession session, Model model) throws Exception {
		TeamVO teamVO = (TeamVO) teamservice.search(rdata.getPostuser());
		log.info("@@@@@@@@@@@@@@@@@@@" + teamVO);
		FromTtoT TtoT = new FromTtoT();
		TtoT.setTeamno(teamVO.getTeamno());
		TtoT.setFormno(rdata.getFormno());
		log.info("@@@@@@@@@@@@@@@@@@@" + TtoT);

		model.addAttribute("TtoT", TtoT);
		return "/matchboard/ReviewForm";
	}

	@RequestMapping(value = "/FromUtoT", method = RequestMethod.POST)
	public String FromUtoTeamPOST(@ModelAttribute("TtoT") FromTtoT TtoT, HttpSession session, Model model)
			throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@@" + TtoT);
		TGmatchservice.fromutot(TtoT);
		model.addAttribute("msg", "정상적으로 등록되었습니다.");
		return "/matchboard/FromUalert";
	}

	@RequestMapping(value = "/FromTtoU", method = RequestMethod.GET)
	public String FromTtoUserGET(FromTtoU TtoU, HttpSession session, Model model) throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@@" + TtoU);

		model.addAttribute("TtoU", TtoU);
		return "/matchboard/ReviewFormToU";
	}

	@RequestMapping(value = "/FromTtoU", method = RequestMethod.POST)
	public String FromTtoUserPOST(@ModelAttribute("TtoU") FromTtoU TtoU, HttpSession session, Model model)
			throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@@" + TtoU);
		TGmatchservice.fromttou(TtoU);
		model.addAttribute("msg", "정상적으로 등록되었습니다.");
		return "/matchboard/FromTalert";
	}
	
	
	
	/*
	 * @RequestMapping(value = "/FromTReview", method = RequestMethod.GET) public
	 * void FromUReviewGET(ReviewDTO RTO, HttpSession session, Model model) throws
	 * Exception { model.addAttribute("RTO",RTO); model.addAttribute("msg",
	 * "정상적으로 등록되었습니다."); }
	 * 
	 * @RequestMapping(value = "/FromTReview", method = RequestMethod.POST) public
	 * String FromUReviewPOST(@ModelAttribute("RTO") ReviewDTO RTO, HttpSession
	 * session, Model model) throws Exception { TGmatchservice.writeUReview(RTO);
	 * model.addAttribute("msg", "정상적으로 등록되었습니다."); return "/collect/joinAlert"; }
	 */

}
