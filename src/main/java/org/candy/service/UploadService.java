package org.candy.service;

import org.candy.domain.AttachDTO;
import org.candy.domain.AttachVO;
import org.candy.domain.Criteria;


public interface UploadService {
	
	
	public int delete(String uuid);
	
	public int insert(AttachVO vo);
	
	public AttachDTO pageList(Criteria cri);

}
