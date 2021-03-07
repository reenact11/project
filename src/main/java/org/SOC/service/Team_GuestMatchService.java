package org.SOC.service;

import java.util.List;

import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.dto.FormList;
import org.SOC.dto.FromTtoT;
import org.SOC.dto.FromTtoU;
import org.SOC.dto.MatchDTO;

public interface Team_GuestMatchService {

	public void write(MatchDTO MTO) throws Exception;

	public void remove(int postno) throws Exception;

	public MatchDTO read(int postno) throws Exception;

	public void modify(MatchDTO MTO) throws Exception;

	public List<MatchDTO> listCriteria(MatchCollectCriteria mccri) throws Exception;

	public int countPaging(MatchCollectCriteria mccri) throws Exception;

	public void formsend(FormVO fvo) throws Exception;

	public void matchVSteam(FormList fl) throws Exception;

	public void addGuest(FormList fl) throws Exception;

	public void fromttot(FromTtoT RTO) throws Exception;

	public void fromutot(FromTtoT RTO) throws Exception;

	public void fromttou(FromTtoU RTO) throws Exception;
}
