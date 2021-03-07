package org.SOC.service;

import java.util.List;

import org.SOC.domain.CommVO;
import org.SOC.domain.Criteria;
import org.SOC.dto.CommDTO;

public interface CommService {

	public List<CommVO> listComm(int postno) throws Exception;

	public void addComm(CommVO CVO) throws Exception;

	public void modifyComm(CommVO CVO) throws Exception;

	public void removeComm(int commno) throws Exception;

	 public List<CommDTO> listCommPage(Integer postno, Criteria cri) throws Exception; 

	public int count(int postno) throws Exception;
}
