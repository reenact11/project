package org.SOC.service;

import java.util.List;
import java.util.Map;

import org.SOC.domain.TeamVO;
import org.SOC.dto.FormList;
import org.SOC.dto.TReview;
import org.SOC.dto.TeamPage;
import org.SOC.dto.Teammember;

public interface TeamService {

	public void maketeam(Map<String, Object> map) throws Exception;

	public TeamVO search(int userno) throws Exception;

	public TeamPage teampage(int userno) throws Exception;

	public TeamPage teaminfo(String teamname) throws Exception;

	public List<Teammember> teammember(int teamno) throws Exception;

	public void teammodify(TeamPage TP) throws Exception;

	public void teamquit(int userno) throws Exception;

	public int memsearch(int teamno) throws Exception;

	public void teamdelete(Map<String, Integer> map) throws Exception;

	public void leaderchange(Map<String, Object> map) throws Exception;

	public List<FormList> formlist(int userno) throws Exception;

	public List<TReview> treviewlist(int teamno) throws Exception;

	public int teamavg(int teamno) throws Exception;
	
	public List<String> getAttach(Integer teamno) throws Exception;

	/*
	 * public void keepLogin(String uid, String sessionId, Date next) throws
	 * Exception;
	 */

	/* public UserVO checkLoginBefore(String value); */

}
