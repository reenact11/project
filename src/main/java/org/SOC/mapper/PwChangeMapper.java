package org.SOC.mapper;

import org.SOC.domain.PwChangeVO;

public interface PwChangeMapper {

	int searchid(PwChangeVO pwvo) throws Exception;
	
	void pwchange(PwChangeVO pwvo) throws Exception;

}
