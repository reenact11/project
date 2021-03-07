package org.SOC.service;

import java.util.List;

import org.SOC.domain.UserVO;
import org.SOC.dto.TeamList;
import org.SOC.dto.UserList;

public interface AdminService {

	public List<UserList> Userlist(int adminno) throws Exception;
	
	public void lockchange(UserVO uvo) throws Exception;
	
	public void userdelete(int userno) throws Exception;
	
	public List<TeamList> Teamlist() throws Exception;
	
	public void teamdelete(int teamno) throws Exception;
	

}
