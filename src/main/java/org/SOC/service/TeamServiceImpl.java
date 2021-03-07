package org.SOC.service;

import java.util.List;
import java.util.Map;

import org.SOC.domain.TeamVO;
import org.SOC.dto.FormList;
import org.SOC.dto.TReview;
import org.SOC.dto.TeamPage;
import org.SOC.dto.Teammember;
import org.SOC.mapper.TeamMapper;
import org.SOC.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper teamMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Transactional
	@Override
	public void maketeam(Map<String, Object> map) throws Exception {
		TeamVO tvo = (TeamVO) map.get("TVO");
		int userno = (int) map.get("userno");
		System.out.println("tvo="+tvo);
		teamMapper.maketeam(tvo);
		String teamname = tvo.getTeamname();
		int teamno = teamMapper.beforemake(teamname);

		map.put("teamno", teamno);
		map.put("userno", userno);
		teamMapper.userteam(map);
		userMapper.leadermake(teamno);
	}

	@Transactional
	@Override
	public TeamVO search(int userno) throws Exception {
		int beforesearch = teamMapper.beforesearch(userno);

		if (beforesearch == 0) {
			return null;
		}

		int teamno = teamMapper.search(userno);

		return teamMapper.teaminfo(teamno);
	}

	@Transactional
	@Override
	public TeamPage teampage(int userno) throws Exception {
		int teamno = teamMapper.search(userno);
		TeamPage TP = teamMapper.teampage(teamno);
		return TP;
	}

	@Transactional
	@Override
	public TeamPage teaminfo(String teamname) throws Exception {
		int teamno = teamMapper.teamnosearch(teamname);
		TeamPage TP = teamMapper.teampage(teamno);
		return TP;
	}

	@Override
	public List<Teammember> teammember(int teamno) throws Exception {
		List<Teammember> teammember = teamMapper.teammember(teamno);
		return teammember;
	}

	@Override
	public void teammodify(TeamPage TP) throws Exception {
		teamMapper.teammodify(TP);

	}

	@Transactional
	@Override
	public void teamquit(int userno) throws Exception {
		teamMapper.teamquit(userno);
		userMapper.nonemake(userno);

	}

	@Override
	public int memsearch(int teamno) throws Exception {
		return teamMapper.memsearch(teamno);
	}

	@Transactional
	@Override
	public void teamdelete(Map<String, Integer> map) throws Exception {
		teamMapper.teamdelete(map.get("teamno"));
		userMapper.nonemake(map.get("userno"));
	}

	@Transactional
	@Override
	public void leaderchange(Map<String, Object> map) throws Exception {
		String usernname = (String) map.get("usernname");
		userMapper.leaderchange(usernname);
		int loginno = (int) map.get("loginno");
		userMapper.memberchange(loginno);
	}

	@Override
	public List<FormList> formlist(int userno) throws Exception {
		return teamMapper.formlist(userno);
	}

	@Override
	public List<TReview> treviewlist(int teamno) throws Exception {
		return teamMapper.treviewlist(teamno);
	}

	@Transactional
	@Override
	public int teamavg(int teamno) throws Exception {
		int avgbpm;
		int reviewcount = teamMapper.reviewcheck(teamno);

		if (reviewcount == 0) {
			avgbpm = 0;
		} else {
			avgbpm = teamMapper.teamavg(teamno);
		}
		return avgbpm;
	}

	@Override
	public List<String> getAttach(Integer teamno) throws Exception {

		return teamMapper.getAttach(teamno);
	}

	/*
	 * @Override public void keepLogin(String uid, String sessionId, Date next)
	 * throws Exception {
	 * 
	 * //dao.keepLogin(uid, sessionId, next);
	 * 
	 * }
	 */

	/*
	 * @Override public UserVO checkLoginBefore(String value) { return null;
	 * 
	 * return dao.checkUserWithSessionKey(value); }
	 */

}
