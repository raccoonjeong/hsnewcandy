package org.candy.mapper;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.FreeboardVO;


public interface FreeboardMapper {
	
	public List<FreeboardVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	
	public List<FreeboardVO> searchList(Criteria cri);

}
