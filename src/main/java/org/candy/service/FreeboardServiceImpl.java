package org.candy.service;

import org.candy.domain.FreeboardVO;
import org.candy.mapper.FreeboardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class FreeboardServiceImpl implements FreeboardService {

	@Setter(onMethod_= {@Autowired})
	private FreeboardMapper mapper;

	@Override
	public FreeboardVO read(int bno) {
	
		return mapper.read(bno);
	}

}
