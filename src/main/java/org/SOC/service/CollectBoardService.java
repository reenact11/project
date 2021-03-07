package org.SOC.service;

import java.util.List;

import org.SOC.domain.BoardVO;
import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.domain.SearchCriteria;
import org.SOC.dto.CollectDTO;
import org.SOC.dto.FormList;

public interface CollectBoardService {

	public void write(CollectDTO CTO) throws Exception;

	public void readcnt(int postno) throws Exception;

	public CollectDTO read(int postno) throws Exception;

	public void modify(CollectDTO CTO) throws Exception;

	public void remove(int postno) throws Exception;

	public List<CollectDTO> listCriteria(MatchCollectCriteria mccri) throws Exception;

	public int countPaging(MatchCollectCriteria mccri) throws Exception;

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateCommCnt(int post, int amount) throws Exception;

	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(int postno) throws Exception;

	public void deleteAttach(int postno) throws Exception;

	public void replaceAttach(String fullName, int postno) throws Exception;

	public void formsend(FormVO fvo) throws Exception;

	public void memberjoin(FormList fl) throws Exception;

	public void notjoin(FormList fl) throws Exception;

}
