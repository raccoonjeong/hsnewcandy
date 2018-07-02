package org.candy.service;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.Criteria;
import org.candy.domain.ReplyDTO;
import org.candy.domain.ReplyVO;

public interface ReplyService {
	
	public int create(ReplyVO vo);
	
	public ReplyVO read(Integer rno);
	
	public int update(ReplyVO vo);
	
	public ReplyDTO list(
			@Param("cri")Criteria cri,
			@Param("fno") Integer fno);
	
	public int rereply(ReplyVO vo);

	public int delete(Integer rno);
	
	public int haveChild(Integer rno);
	
	public int deleteParentReply(Integer rno);
	
}
