package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.TruckVO;
import org.candy.domain.UserTruckVO;

public interface TruckService {
	
	public List<TruckVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	
	public void register(TruckVO vo);

	public TruckVO read(int fno);
	
	public void remove(int fno);

	public void modify(TruckVO vo);
	
	/*public int updateReviewCnt(Integer fno, int amount);

	public void updateViewCnt(Integer fno);*/
	
	public List<String> getAttach(Integer fno);
	
	public void openClose(String uid, String value);
	
	public UserTruckVO readMyTruck(String uid);


}
