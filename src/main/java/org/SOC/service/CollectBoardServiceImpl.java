
package org.SOC.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.SOC.domain.BoardVO;
import org.SOC.domain.FormVO;
import org.SOC.domain.MatchCollectCriteria;
import org.SOC.domain.SearchCriteria;
import org.SOC.dto.CollectDTO;
import org.SOC.dto.FormList;
import org.SOC.mapper.CollectBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CollectBoardServiceImpl implements CollectBoardService {

	@Autowired
	private CollectBoardMapper collectBoardMapper;

	@Override
	public void write(CollectDTO CTO) throws Exception {
		collectBoardMapper.write(CTO);
	}

	@Transactional
	@Override
	public void readcnt(int postno) throws Exception {
		collectBoardMapper.readcnt(postno);
	}

	@Override
	public CollectDTO read(int postno) throws Exception {
		return collectBoardMapper.read(postno);
	}

	@Override
	public void modify(CollectDTO CTO) throws Exception {
		collectBoardMapper.update(CTO);
	}

	@Override
	public void remove(int postno) throws Exception {
		collectBoardMapper.delete(postno);
	}

	@Override
	public List<CollectDTO> listCriteria(MatchCollectCriteria mccri) throws Exception {

		return collectBoardMapper.listCriteria(mccri);
	}

	@Override
	public int countPaging(MatchCollectCriteria mccri) throws Exception {

		return collectBoardMapper.countPaging(mccri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {

		return collectBoardMapper.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return collectBoardMapper.listSearchCount(cri);
	}

	@Override
	public void updateCommCnt(int postno, int amount) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("postno", postno);
		paramMap.put("amount", amount);

		collectBoardMapper.updateCommCnt(paramMap);
	}

	@Override
	public void addAttach(String fullName) throws Exception {

		collectBoardMapper.addAttach(fullName);

	}

	@Override
	public List<String> getAttach(int postno) throws Exception {

		return collectBoardMapper.getAttach(postno);
	}

	@Override
	public void deleteAttach(int postno) throws Exception {

		collectBoardMapper.deleteAttach(postno);

	}

	@Override
	public void replaceAttach(String fullName, int postno) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("postno", postno);
		paramMap.put("fullName", fullName);
		collectBoardMapper.replaceAttach(paramMap);

	}

	@Transactional
	@Override
	public void formsend(FormVO fvo) throws Exception {
		collectBoardMapper.formsend(fvo);
		collectBoardMapper.formcount(fvo);

	}

	@Transactional
	@Override
	public void memberjoin(FormList fl) throws Exception {
		collectBoardMapper.memberjoin(fl);
		collectBoardMapper.memberrole(fl);
		collectBoardMapper.formalldelete(fl);
	}

	@Override
	public void notjoin(FormList fl) throws Exception {
		collectBoardMapper.formdelete(fl);
	}
}
