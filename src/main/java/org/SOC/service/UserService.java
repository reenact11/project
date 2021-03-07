package org.SOC.service;

import java.util.Date;
import java.util.List;

import org.SOC.domain.RegisterVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.LoginDTO;
import org.SOC.dto.MyFormList;
import org.SOC.dto.Mypage;
import org.SOC.dto.UReview;
import org.SOC.dto.UserInfo;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	
	public UserVO rolecheck(int userno) throws Exception;

	public void register(RegisterVO RVO) throws Exception;

	public int idcheck(String userid) throws Exception;
	
	public int nnamecheck(String usernname) throws Exception;

	public void keepLogin(String userid, String sessionId, Date next) throws Exception;

	public UserVO checkLoginBefore(String value) throws Exception;
	
	public Mypage mypage(int userno) throws Exception;
	
	public void mymodify(Mypage MP) throws Exception;
	
	public void mydelete(int userno) throws Exception;
	
	public UserInfo userinfo(String usernname) throws Exception;
	
	public List<MyFormList> myformlist(int userno) throws Exception;
	
	public List<UReview> ureviewlist(int userno) throws Exception;
	
	public int useravg(int userno) throws Exception;

}
