package org.candy.service;



import java.util.List;

import org.candy.domain.Criteria;

import org.candy.domain.FreeboardVO;

public interface FreeboardService {
	

	public void register(FreeboardVO vo);

	public void modify(FreeboardVO vo);
	
	public FreeboardVO read(int bno);

	public List<FreeboardVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	

}
