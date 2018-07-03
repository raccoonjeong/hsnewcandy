package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.TruckVO;


public interface BoardService {
	
	public List<TruckVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	
	public void register(TruckVO vo);

	public TruckVO read(int fno);
	
	public int remove(int fno);

	public void modify(TruckVO vo);
	
	public int updateReviewCnt(Integer fno, int amount);

	public void updateViewCnt(Integer fno);
	
	public List<String> getAttach(Integer fno);
	
	


}
