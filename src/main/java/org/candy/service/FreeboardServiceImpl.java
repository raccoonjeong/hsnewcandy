package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.FreeboardVO;
import org.candy.mapper.FreeboardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
@Service
public class FreeboardServiceImpl implements FreeboardService{

	@Setter(onMethod_= {@Autowired})
	private FreeboardMapper mapper;
	
	@Override
	public List<FreeboardVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}


}
