package org.SOC.mapper;

import java.util.List;

import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.dto.FormList;
import org.SOC.dto.FromTtoT;
import org.SOC.dto.FromTtoU;
import org.SOC.dto.MatchDTO;

public interface Team_GuestMatchMapper {

	void write(MatchDTO MTO) throws Exception;

	void readcnt(int postno) throws Exception;

	MatchDTO read(int postno) throws Exception;

	void update(MatchDTO MTO) throws Exception;

	void delete(int postno) throws Exception;

	List<MatchDTO> listCriteria(MatchCollectCriteria mccri) throws Exception;

	int countPaging(MatchCollectCriteria mccri) throws Exception;

	void formsend(FormVO fvo) throws Exception;

	void formcount(FormVO fvo) throws Exception;

	void recruitmodify(FormList fl) throws Exception;

	void formdelete(FormList fl) throws Exception;

	void otherdelete(FormList fl) throws Exception;

	void fromttot(FromTtoT RTO) throws Exception;

	void acheck(int formno) throws Exception;

	void fromutot(FromTtoT RTO) throws Exception;

	void bcheck(int formno) throws Exception;

	void fromttou(FromTtoU RTU) throws Exception;
	/*
	 * void update(ArticleVO AVO) throws Exception;
	 * 
	 * void delete(int postno) throws Exception;
	 * 
	 * List<ArticleVO> listAll (String category) throws Exception;
	 * 
	 * List<ArticleVO> listPage (Map<String, Object> paramMap) throws Exception;
	 * 
	 * List<ArticleVO> listCriteria(Criteria cri) throws Exception;
	 * 
	 * int countPaging(Criteria cri) throws Exception;
	 * 
	 * List<ArticleVO> listSearch(SearchCriteria cri) throws Exception;
	 * 
	 * int listSearchCount(SearchCriteria cri) throws Exception;
	 * 
	 * void updateCommCnt(Map<String, Object> paramMap) throws Exception;
	 * 
	 * void updateReadCnt(int postno) throws Exception;
	 * 
	 * void addAttach(String fullName) throws Exception;
	 * 
	 * List<String> getAttach(int postno) throws Exception;
	 * 
	 * void deleteAttach(int postno) throws Exception;
	 * 
	 * void replaceAttach(Map<String, Object> paramMap) throws Exception;
	 */
}
