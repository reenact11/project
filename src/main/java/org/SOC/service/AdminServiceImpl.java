package org.SOC.service;

import java.util.List;

import org.SOC.domain.UserVO;
import org.SOC.dto.TeamList;
import org.SOC.dto.UserList;
import org.SOC.mapper.AdminMapper;
import org.SOC.mapper.TeamMapper;
import org.SOC.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private TeamMapper teamMapper;

	@Override
	public List<UserList> Userlist(int adminno) throws Exception {
		return adminMapper.Userlist(adminno);
	}

	@Override
	public void lockchange(UserVO uvo) throws Exception {
		adminMapper.lockchange(uvo);
		
	}

	@Override
	public void userdelete(int userno) throws Exception {
		
		UserVO userVO = userMapper.rolecheck(userno);
		String role = userVO.getUserrole();
		
		if(teamMapper.beforesearch(userno)>0 && role.equals("팀장")) {
			userMapper.allrolemod(userno);
			teamMapper.allmemdel(userno);
		}
		
		adminMapper.userdelete(userno);
		
	}

	@Override
	public List<TeamList> Teamlist() throws Exception {
		return adminMapper.Teamlist();
	}
	
	@Transactional
	@Override
	public void teamdelete(int teamno) throws Exception {
		adminMapper.memberrole(teamno);
		adminMapper.teamdelete(teamno);
	}

	
}
