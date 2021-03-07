
package org.SOC.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.SOC.domain.BoardVO;
import org.SOC.domain.Criteria;
import org.SOC.domain.SearchCriteria;
import org.SOC.mapper.FreeNoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private FreeNoticeMapper freeNoticeMapper;
	
	@Transactional
	@Override
	public void write(BoardVO board) throws Exception {
		freeNoticeMapper.write(board);
		String[] files = board.getFiles();

		if (files == null) {
			return;
		}

		for (String fileName : files) {
			freeNoticeMapper.addAttach(fileName);
		}
	}

	public void readcnt(int postno) throws Exception {
		freeNoticeMapper.readcnt(postno);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int postno) throws Exception {
		return freeNoticeMapper.read(postno);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		freeNoticeMapper.update(board);
		int postno = board.getPostno();
	    log.info("파일" + board.getFiles());
		freeNoticeMapper.deleteAttach(postno); 
	    
	    String[] files = board.getFiles();
	    
	    if(files == null) { return; } 
	    log.info("파일" + board.getFiles());
	    for (String fileName : files) {
	      replaceAttach(fileName, postno);
	    }
	}
	@Transactional
	@Override
	public void remove(int postno) throws Exception {
		freeNoticeMapper.deleteAttach(postno);
		freeNoticeMapper.delete(postno);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return freeNoticeMapper.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

		return freeNoticeMapper.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return freeNoticeMapper.listSearchCriteria(cri);
	}

	@Override
	public int listSearchcount(SearchCriteria cri) throws Exception {

		return freeNoticeMapper.listSearchcount(cri);
	}

	@Override
	public void updateCommcnt(int postno, int amount) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("postno", postno);
		paramMap.put("amount", amount);

		freeNoticeMapper.updateCommcnt(paramMap);
	}

	@Override
	public void addAttach(String fullName) throws Exception {

		freeNoticeMapper.addAttach(fullName);

	}

	@Override
	public List<String> getAttach(Integer postno) throws Exception {

		return freeNoticeMapper.getAttach(postno);
	}

	@Override
	public void deleteAttach(int postno) throws Exception {

		freeNoticeMapper.deleteAttach(postno);

	}

	@Override
	public void replaceAttach(String fullName, int postno) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
	    
	    paramMap.put("postno", postno);
	    paramMap.put("fullName", fullName);
	    
		freeNoticeMapper.replaceAttach(paramMap);

	}
}
