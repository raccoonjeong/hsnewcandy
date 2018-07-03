package org.candy.service;

import org.candy.domain.AttachDTO;
import org.candy.domain.AttachVO;
import org.candy.domain.Criteria;
import org.candy.mapper.UploadMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class UploadServiceImpl implements UploadService {

	@Setter(onMethod_= {@Autowired})
	private UploadMapper mapper;
	
	

	@Override
	public int delete(String uuid) {
		
		return mapper.delete(uuid);
	}

	@Override
	public int insert(AttachVO vo) {

		return mapper.insert(vo);
	}

	

	@Override
	public AttachDTO pageList(Criteria cri) {
		AttachDTO dto = new AttachDTO();
		dto.setList(mapper.getList(cri));
		dto.setUploadCnt(mapper.getTotal());
		
		return dto;
	}

}
