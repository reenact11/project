package org.SOC.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.SOC.domain.CommVO;
import org.SOC.service.CommService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.SOC.domain.Criteria;
import org.SOC.domain.PageMaker;
import org.SOC.dto.CommDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@RestController

@RequestMapping("/comm")
public class CommController {

	@Inject
	private CommService commservice;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommVO CVO) {

		ResponseEntity<String> entity = null;
		try {
			commservice.addComm(CVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/all/{postno}", method = RequestMethod.GET)
	public ResponseEntity<List<CommVO>> list(@PathVariable("postno") int postno) {

		ResponseEntity<List<CommVO>> entity = null;
		try {
			entity = new ResponseEntity<>(commservice.listComm(postno), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		log.info("Comm list..........");
		return entity;
	}

	@RequestMapping(value = "/{commno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> modify(@PathVariable("commno") int commno, @RequestBody CommVO CVO) {

		ResponseEntity<String> entity = null;
		try {
			CVO.setCommno(commno);
			commservice.modifyComm(CVO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		log.info("Comm modify..........");
		return entity;
	}

	@RequestMapping(value = "/{commno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("commno") int commno) {

		ResponseEntity<String> entity = null;
		try {
			commservice.removeComm(commno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		log.info("Comm remove..........");
		return entity;
	}

	@RequestMapping(value = "/{postno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("postno") Integer postno, @PathVariable("page") int page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			log.info("Criteria setPage..........");

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			log.info("Criteria Pagemaker..........");
			Map<String, Object> map = new HashMap<String, Object>();
			log.info("postno........ " + postno);
			List<CommDTO> list = commservice.listCommPage(postno, cri);

			map.put("list", list);

			int CommCount = commservice.count(postno);
			pageMaker.setTotalCount(CommCount);

			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			log.info("list, pageMaker", entity);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		log.info("Comm remove..........");
		return entity;
	}

}

