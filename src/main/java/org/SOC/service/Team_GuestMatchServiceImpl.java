
package org.SOC.service;

import java.util.List;

import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.dto.FormList;
import org.SOC.dto.FromTtoT;
import org.SOC.dto.FromTtoU;
import org.SOC.dto.MatchDTO;
import org.SOC.mapper.Team_GuestMatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class Team_GuestMatchServiceImpl implements Team_GuestMatchService {

	@Autowired
	private Team_GuestMatchMapper TGmatchMapper;

	@Override
	public void write(MatchDTO MTO) throws Exception {
		TGmatchMapper.write(MTO);
	}

	@Override
	public void remove(int postno) throws Exception {
		TGmatchMapper.delete(postno);
	}

	@Transactional
	@Override
	public MatchDTO read(int postno) throws Exception {
		TGmatchMapper.readcnt(postno);
		return TGmatchMapper.read(postno);
	}

	@Override
	public void modify(MatchDTO MTO) throws Exception {
		TGmatchMapper.update(MTO);
	}

	@Override
	public List<MatchDTO> listCriteria(MatchCollectCriteria mccri) throws Exception {
		return TGmatchMapper.listCriteria(mccri);
	}

	@Override
	public int countPaging(MatchCollectCriteria mccri) throws Exception {
		return TGmatchMapper.countPaging(mccri);
	}

	@Transactional
	@Override
	public void formsend(FormVO fvo) throws Exception {
		TGmatchMapper.formsend(fvo);
		TGmatchMapper.formcount(fvo);
	}

	@Transactional
	@Override
	public void matchVSteam(FormList fl) throws Exception {
		TGmatchMapper.otherdelete(fl);
		TGmatchMapper.recruitmodify(fl);
	}

	@Override
	public void addGuest(FormList fl) throws Exception {
		TGmatchMapper.formdelete(fl);
	}

	@Transactional
	@Override
	public void fromttot(FromTtoT RTO) throws Exception {
		TGmatchMapper.fromttot(RTO);
		TGmatchMapper.acheck(RTO.getFormno());
	}

	@Transactional
	@Override
	public void fromutot(FromTtoT RTO) throws Exception {
		TGmatchMapper.fromutot(RTO);
		TGmatchMapper.bcheck(RTO.getFormno());
	}

	@Transactional
	@Override
	public void fromttou(FromTtoU RTU) throws Exception {
		TGmatchMapper.fromttou(RTU);
		TGmatchMapper.acheck(RTU.getFormno());
	}
}
