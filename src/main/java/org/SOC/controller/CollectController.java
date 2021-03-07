package org.SOC.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.domain.PageMaker;
import org.SOC.domain.UserVO;
import org.SOC.dto.CollectDTO;
import org.SOC.dto.FormList;
import org.SOC.service.CollectBoardService;
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
@RequestMapping("/collectboard")
public class CollectController {

	@Inject
	private CollectBoardService collectboardservice;

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("mccri") MatchCollectCriteria mccri, HttpSession session, Model model)
			throws Exception {

		String boardname;

		switch (mccri.getCategory()) {
		case "FW":
			boardname = "공격수 모집";
			break;
		case "MF":
			boardname = "미드필더 모집";
			break;
		case "DF":
			boardname = "수비수 모집";
			break;
		case "GK":
			boardname = "골키퍼 모집";
			break;
		case "ALL":
			boardname = "포지션 무관 모집";
			break;
		default:
			boardname = "미구현";
			break;
		}

		model.addAttribute("list", collectboardservice.listCriteria(mccri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setMccri(mccri);
		pageMaker.setTotalmcCount(collectboardservice.countPaging(mccri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardname", boardname);
		log.info("show list page......................" + mccri.toString());
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writerGET(@RequestParam String category, @RequestParam String boardname, Model model) throws Exception {
		model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		log.info("writer get ........... category = " + category + ", boardname = " + boardname);
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(CollectDTO cto, @ModelAttribute("boardname") String boardname,Model model, HttpSession session)
			throws Exception {
		log.info("write post ...........");
		log.info(cto.toString());
		log.info("category..........." + cto.getCategory());
		UserVO uvo = (UserVO) session.getAttribute("login");
		int userno = uvo.getUserno();
		cto.setUserno(userno);
		cto.setCategory(cto.getCategory());
		collectboardservice.write(cto);
		model.addAttribute("category",cto.getCategory());

		return "redirect:/collectboard/listPage";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("postno") int postno, @RequestParam("boardname") String boardname, Model model)
			throws Exception {
		model.addAttribute("boardname", boardname);
		model.addAttribute(collectboardservice.read(postno));
		log.info("mod get............");
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(CollectDTO cto, HttpSession session, Model model) throws Exception {
		log.info("mod post............");
		collectboardservice.modify(cto);
		model.addAttribute("category", cto.getCategory());
		return "redirect:/collectboard/listPage";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String removePOST(CollectDTO cto, HttpSession session, Model model) throws Exception {
		collectboardservice.remove(cto.getPostno());
		model.addAttribute("category", cto.getCategory());
		log.warn("category................." + cto.getCategory());
		return "redirect:/collectboard/listPage";
	}

	@RequestMapping(value = "/formsend", method = RequestMethod.POST)
	public ResponseEntity<String> formsend(@RequestBody FormVO fvo) throws Exception {

		ResponseEntity<String> entity = null;
		try {
			log.info("formsend....start" + fvo);
			collectboardservice.formsend(fvo);
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
		collectboardservice.memberjoin(fl);
		model.addAttribute("msg", "팀 가입을 수락 하였습니다");
		return "/collectboard/joinAlert";
	}

	@RequestMapping(value = "/no", method = RequestMethod.POST)
	public String no(FormList fl, HttpSession session, Model model) throws Exception {
		collectboardservice.notjoin(fl);
		model.addAttribute("msg", "팀 가입을 거절 하였습니다");
		return "/collectboard/joinAlert";
	}

}
