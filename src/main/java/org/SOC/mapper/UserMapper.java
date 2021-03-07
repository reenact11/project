package org.SOC.mapper;

import java.util.List;
import java.util.Map;

import org.SOC.domain.RegisterVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.LoginDTO;
import org.SOC.dto.MyFormList;
import org.SOC.dto.Mypage;
import org.SOC.dto.UReview;
import org.SOC.dto.UserInfo;

public interface UserMapper {

	UserVO login(LoginDTO dto) throws Exception;
	
	UserVO rolecheck(int userno) throws Exception;

	void register(RegisterVO RVO) throws Exception;

	int idcheck(String userid) throws Exception;
	
	int nnamecheck(String usernname) throws Exception;

	void keepLogin(Map<String, Object> paramMap) throws Exception;

	UserVO checkUserWithSessionKey(String value) throws Exception;

	Mypage mypage(int userno) throws Exception;
	
	void mymodify(Mypage MP) throws Exception;
	
	void mydelete(int userno) throws Exception;
	
	void allrolemod(int userno) throws Exception;
	
	UserInfo userinfo(String usernname) throws Exception;
	
	void leadermake(int teamno) throws Exception;
	
	void nonemake(int userno) throws Exception;
	
	void leaderchange(String usernname) throws Exception;
	
	void memberchange(int userno) throws Exception;
	
	List<MyFormList> myformlist(int userno) throws Exception;
	
	List<UReview> ureviewlist(int userno) throws Exception;
	
	int useravg(int userno) throws Exception;
	
	int reviewcheck(int userno) throws Exception;

}
