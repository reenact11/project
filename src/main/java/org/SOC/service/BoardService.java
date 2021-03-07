package org.SOC.service;

import java.util.List;

import org.SOC.domain.BoardVO;
import org.SOC.domain.Criteria;
import org.SOC.domain.SearchCriteria;

public interface BoardService {

	public void write(BoardVO board) throws Exception;
	
	public void readcnt(int postno) throws Exception;
	
	public BoardVO read(int postno) throws Exception;

	public void modify(BoardVO board) throws Exception;

	public void remove(int postno) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchcount(SearchCriteria cri) throws Exception;

	public void updateCommcnt(int post, int amount) throws Exception;
	
	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(Integer postno) throws Exception;

	public void deleteAttach(int postno) throws Exception;

	public void replaceAttach(String fullName, int postno) throws Exception;
}
