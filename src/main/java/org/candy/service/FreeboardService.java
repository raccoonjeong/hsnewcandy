package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.FreeboardVO;

public interface FreeboardService {
	
	public List<FreeboardVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	

}
