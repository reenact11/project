package org.SOC.mapper;

import java.util.List;
import java.util.Map;

import org.SOC.domain.BoardVO;
import org.SOC.domain.Criteria;
import org.SOC.domain.SearchCriteria;

public interface FreeNoticeMapper {
	

	void write(BoardVO board) throws Exception;

	void readcnt(int postno) throws Exception;
	
	BoardVO read(int postno) throws Exception;

	void update(BoardVO board) throws Exception;

	void delete(int postno) throws Exception;
	
	List<BoardVO> listCriteria(Criteria cri) throws Exception;

	int countPaging(Criteria cri) throws Exception;

	List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	int listSearchcount(SearchCriteria cri) throws Exception;

	void updateCommcnt(Map<String, Object> paramMap) throws Exception;

	void addAttach(String fullName) throws Exception;

	List<String> getAttach(Integer postno) throws Exception;

	void deleteAttach(int postno) throws Exception;

	void replaceAttach(Map<String, Object> paramMap) throws Exception;
}
