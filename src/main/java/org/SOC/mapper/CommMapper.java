package org.SOC.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.SOC.domain.CommVO;
import org.SOC.domain.Criteria;
import org.SOC.dto.CommDTO;

public interface CommMapper {

	List<CommVO> list(int postno) throws Exception;

	void create(CommVO vo) throws Exception;

	void update(CommVO vo) throws Exception;

	void delete(int commno) throws Exception;

	 List<CommDTO> listPage(Map<String, Object> map) throws Exception; 

	int count(int postno) throws Exception;

}
