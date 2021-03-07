package org.SOC.service;

import org.SOC.domain.PwChangeVO;

public interface PwChangeService {

	public int searchid(PwChangeVO pwvo) throws Exception;
	
	public void pwchange(PwChangeVO pwvo) throws Exception;

}
