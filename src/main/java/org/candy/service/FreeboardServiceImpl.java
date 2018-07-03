package org.candy.service;


import java.util.List;

import org.candy.domain.Criteria;


import org.candy.domain.FreeboardVO;
import org.candy.mapper.FreeboardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;


import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FreeboardServiceImpl implements FreeboardService {
	

	@Setter(onMethod_= {@Autowired})
	private FreeboardMapper mapper;
	
	@Override
	public void register(FreeboardVO vo) {
		log.info("Service register...");
		mapper.register(vo);
	}

	@Override
	public void modify(FreeboardVO vo) {
		log.info("Service modify...");
		mapper.modify(vo);
	}

	@Override
	public FreeboardVO read(int bno) {
		log.info("Service read...");
		return mapper.read(bno);
	}

	public List<FreeboardVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}



}
