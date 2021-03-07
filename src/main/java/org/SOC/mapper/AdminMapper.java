package org.SOC.mapper;

import java.util.List;

import org.SOC.domain.UserVO;
import org.SOC.dto.TeamList;
import org.SOC.dto.UserList;

public interface AdminMapper {

	List<UserList> Userlist(int adminno) throws Exception;
	
	void lockchange(UserVO uvo) throws Exception;
	
	void userdelete(int userno) throws Exception;
	
	List<TeamList> Teamlist() throws Exception;
	
	void memberrole(int teamno) throws Exception;
	
	void teamdelete(int teamno) throws Exception;


}
