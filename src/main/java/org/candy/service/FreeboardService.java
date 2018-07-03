package org.candy.service;

import org.candy.domain.FreeboardVO;

public interface FreeboardService {
	
	public void register(FreeboardVO vo);

	public void modify(FreeboardVO vo);
	
	public FreeboardVO read(int bno);

}
