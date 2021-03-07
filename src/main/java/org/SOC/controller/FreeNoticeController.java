package org.SOC.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.SOC.domain.BoardVO;
import org.SOC.domain.Criteria;
import org.SOC.domain.PageMaker;
import org.SOC.domain.SearchCriteria;
import org.SOC.domain.UserVO;
import org.SOC.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/freeboard")
public class FreeNoticeController {

	@Inject
	private BoardService boardservice;

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) throws Exception {
		String boardname;

		switch (cri.getCategory()) {
		case "Notice":
			boardname = "공지사항";
			break;
		case "Uniform":
			boardname = "유니폼 정보";
			break;
		case "Soccershoe":
			boardname = "축구화 정보";
			break;
		case "Soccerball":
			boardname = "축구공 정보";
			break;
		case "Proteam":
			boardname = "프로팀 갤러리";
			break;
		case "Worldsoc":
			boardname = "세계 축구 소식";
			break;
		default:
			boardname = "미구현";
			break;
		}
		log.info("@@@@@@@@@@@@@@@@@" + cri + "@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("list", boardservice.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardservice.listSearchcount(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardname", boardname);
		log.info("show list page......................" + cri.toString());
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET) // 글쓰기
	public void writerGET(@RequestParam String category, @RequestParam String boardname, Model model) throws Exception {
		model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		log.info("writer get ........... category = " + category + ", boardname = " + boardname);
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO board, @ModelAttribute("boardname") String boardname, HttpSession session,
			Model model) throws Exception {
		log.info("write post ...........");
		log.info(board.toString());
		log.info("132322222222222@" + board.getCategory() + "2222222222222222222" + boardname);
		UserVO uvo = (UserVO) session.getAttribute("login");
		int userno = uvo.getUserno();
		board.setUserno(userno);
		board.setCategory(board.getCategory());
		boardservice.write(board);

		model.addAttribute("category", board.getCategory());
		return "redirect:/freeboard/listPage";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET) // 글 읽기
	public void read(@ModelAttribute("cri") Criteria cri, @RequestParam("postno") int postno,
			@RequestParam("boardname") String boardname, Model model) throws Exception {
		System.out.println("postno....." + postno);
		model.addAttribute("boardname", boardname);
		boardservice.readcnt(postno);
		model.addAttribute(boardservice.read(postno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("postno") int postno, @RequestParam("boardname") String boardname, Model model)
			throws Exception {
		model.addAttribute("boardname", boardname);
		model.addAttribute(boardservice.read(postno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board, HttpSession session, Model model) throws Exception {
		log.info("mod post............");
		boardservice.modify(board);
		model.addAttribute("category", board.getCategory());
		return "redirect:/freeboard/listPage";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String removePOST(BoardVO bvo, HttpSession session, Model model) throws Exception {
		boardservice.remove(bvo.getPostno());

		model.addAttribute("category", bvo.getCategory());
		log.warn("@@@@@@@@@@@category@@@@@@@@@@@@" + bvo.getCategory());
		return "redirect:/freeboard/listPage";
	}

	@RequestMapping("/getAttach/{postno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("postno") Integer postno) throws Exception {
		log.info("@@@@@@@@@@@@@@@@@@"+boardservice.getAttach(postno));
		return boardservice.getAttach(postno);
	}
}
