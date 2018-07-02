package org.candy.mapper;

import java.util.List;

import org.candy.domain.AttachVO;
import org.candy.domain.Criteria;


public interface UploadMapper {
	
	public List<AttachVO> getList(Criteria cri);
	
	public int delete(String uuid);
	
	public int insert(AttachVO vo);
	
	public int getTotal();
}
