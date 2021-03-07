package org.SOC.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.SOC.domain.RegisterVO;
import org.SOC.domain.UserVO;
import org.SOC.dto.LoginDTO;
import org.SOC.dto.MyFormList;
import org.SOC.dto.Mypage;
import org.SOC.dto.UReview;
import org.SOC.dto.UserInfo;
import org.SOC.mapper.TeamMapper;
import org.SOC.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private TeamMapper teamMapper;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return userMapper.login(dto);
	}
	
	@Override
	public UserVO rolecheck(int userno) throws Exception {

		return userMapper.rolecheck(userno);
	}

	@Override
	public void register(RegisterVO RVO) throws Exception {

		userMapper.register(RVO);
	}

	@Override
	public int idcheck(String userid) throws Exception {
		int result = userMapper.idcheck(userid);

		return result;
	}
	
	@Override
	public int nnamecheck(String usernname) throws Exception {
		int result = userMapper.nnamecheck(usernname);

		return result;
	}

	@Override
	public void keepLogin(String userid, String sessionId, Date next) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);

		userMapper.keepLogin(paramMap);

	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {

		return userMapper.checkUserWithSessionKey(value);
	}

	@Override
	public Mypage mypage(int userno) throws Exception {
		
		return userMapper.mypage(userno);
	}

	@Override
	public void mymodify(Mypage MP) throws Exception {
		userMapper.mymodify(MP);
	}

	@Transactional
	@Override
	public void mydelete(int userno) throws Exception {
		UserVO userVO = userMapper.rolecheck(userno);
		String role = userVO.getUserrole();
		if(teamMapper.beforesearch(userno) > 0 && role.equals("팀장")) {
			userMapper.allrolemod(userno);
			teamMapper.allmemdel(userno);
		}
		userMapper.mydelete(userno);
		
	}

	@Override
	public UserInfo userinfo(String usernname) throws Exception {
		return userMapper.userinfo(usernname);
	}

	@Override
	public List<MyFormList> myformlist(int userno) throws Exception {
		return userMapper.myformlist(userno);
	}
	
	@Override
	public List<UReview> ureviewlist(int userno) throws Exception {
		return userMapper.ureviewlist(userno);
	}
	
	@Transactional
	@Override
	public int useravg(int userno) throws Exception {
		int avgbpm;
		int reviewcount = userMapper.reviewcheck(userno);
		
		if(reviewcount == 0) {
			avgbpm=0;
		}else {
			avgbpm=userMapper.useravg(userno);
		}
		
		return avgbpm;
	}

}
