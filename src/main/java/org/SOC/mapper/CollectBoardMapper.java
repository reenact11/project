package org.SOC.mapper;

import java.util.List;
import java.util.Map;

import org.SOC.domain.BoardVO;
import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.domain.SearchCriteria;
import org.SOC.dto.CollectDTO;
import org.SOC.dto.FormList;

public interface CollectBoardMapper {

	void write(CollectDTO CTO) throws Exception;

	void readcnt(int postno) throws Exception;

	CollectDTO read(int postno) throws Exception;

	void update(CollectDTO CTO) throws Exception;

	void delete(int postno) throws Exception;

	List<CollectDTO> listCriteria(MatchCollectCriteria mccri) throws Exception;

	int countPaging(MatchCollectCriteria mccri) throws Exception;

	List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

	int listSearchCount(SearchCriteria cri) throws Exception;

	void updateCommCnt(Map<String, Object> paramMap) throws Exception;

	void updateReadCnt(int postno) throws Exception;

	void addAttach(String fullName) throws Exception;

	List<String> getAttach(int postno) throws Exception;

	void deleteAttach(int postno) throws Exception;

	void replaceAttach(Map<String, Object> paramMap) throws Exception;

	void formsend(FormVO fvo) throws Exception;

	void formcount(FormVO fvo) throws Exception;

	void memberjoin(FormList fl) throws Exception;

	void memberrole(FormList fl) throws Exception;

	void formdelete(FormList fl) throws Exception;

	void formalldelete(FormList fl) throws Exception;
}
