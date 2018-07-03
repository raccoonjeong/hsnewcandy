package org.candy.mapper;

import org.candy.domain.FreeboardVO;

public interface FreeboardMapper {
	
	public int register(FreeboardVO vo);

	public int modify(FreeboardVO vo);	

	public FreeboardVO read(int bno);
}
