package org.SOC.service;

import org.SOC.domain.PwChangeVO;
import org.SOC.mapper.PwChangeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PwChangeServiceImpl implements PwChangeService {

	@Autowired
	private PwChangeMapper pwchangeMapper;

	@Override
	public int searchid(PwChangeVO pwvo) throws Exception {
		int check = pwchangeMapper.searchid(pwvo);
		return check;
	}

	@Override
	public void pwchange(PwChangeVO pwvo) throws Exception {
		pwchangeMapper.pwchange(pwvo);
		
			
		
	}

	
}
