package org.SOC.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.SOC.domain.CommVO;
import org.SOC.domain.Criteria;
import org.SOC.dto.CommDTO;
import org.SOC.mapper.CommMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommServiceImpl implements CommService {

	@Autowired
	private CommMapper commMapper;

	public List<CommVO> listComm(int postno) throws Exception {

		return commMapper.list(postno);
	}

	public void addComm(CommVO CVO) throws Exception {
		commMapper.create(CVO);
	}

	public void modifyComm(CommVO CVO) throws Exception {
		commMapper.update(CVO);
	}

	public void removeComm(int commno) throws Exception {
		commMapper.delete(commno);
	}

	
	  public List<CommDTO> listCommPage(Integer postno, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postno",postno);
		map.put("cri",cri);
		return commMapper.listPage(map);
	  
	  }
	 
	public int count(int postno) throws Exception {
		return commMapper.count(postno);
	}
}
