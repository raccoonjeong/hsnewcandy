package org.candy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.Criteria;
import org.candy.domain.AttachDTO;
import org.candy.domain.AttachVO;


public interface UploadService {
	
	
	public int delete(String uuid);
	
	public int insert(AttachVO vo);
	
	public AttachDTO pageList(Criteria cri);

}
