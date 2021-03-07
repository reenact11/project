package org.SOC.mapper;

import java.util.List;
import java.util.Map;

import org.SOC.domain.TeamVO;
import org.SOC.dto.FormList;
import org.SOC.dto.TReview;
import org.SOC.dto.TeamPage;
import org.SOC.dto.Teammember;

public interface TeamMapper {
	void maketeam(TeamVO TVO) throws Exception;

	int beforesearch(int userno) throws Exception;

	int search(int userno) throws Exception;

	TeamVO teaminfo(int teamno) throws Exception;

	TeamPage teampage(int teamno) throws Exception;

	int teamnosearch(String teamname) throws Exception;

	int beforemake(String teamname) throws Exception;

	List<Teammember> teammember(int teamno) throws Exception;

	void userteam(Map<String, Object> map) throws Exception;

	void teammodify(TeamPage TP) throws Exception;

	void teamquit(int userno) throws Exception;

	int memsearch(int teamno) throws Exception;

	void teamdelete(int teamno) throws Exception;

	void allmemdel(int userno) throws Exception;

	List<FormList> formlist(int userno) throws Exception;

	List<TReview> treviewlist(int teamno) throws Exception;

	int teamavg(int teamno) throws Exception;
	
	int reviewcheck(int teamno) throws Exception;
	
	List<String> getAttach(Integer teamno) throws Exception;

}
