package org.candy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.candy.domain.Criteria;
import org.candy.domain.ReplyDTO;
import org.candy.domain.ReplyVO;
import org.candy.mapper.BoardMapper;
import org.candy.mapper.ReplyMapper;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Setter(onMethod_= {@Autowired})
	private ReplyMapper replyMapper;
	

	@Setter(onMethod_= {@Autowired})
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int create(ReplyVO vo) {
		
		boardMapper.updateReplyCnt(vo.getFno(), 1);
		
		replyMapper.create(vo);
		 
		return replyMapper.updateup(vo);
	}

	@Override
	public ReplyVO read(Integer rno) {
		
		return replyMapper.read(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		
		return replyMapper.update(vo);
	}

	@Transactional
	@Override
	public int delete(Integer rno) {
		int fno = replyMapper.getFno(rno);
		boardMapper.updateReplyCnt(fno, -1);
		
		return replyMapper.delete(rno);
	}

	@Override
	public ReplyDTO list(Criteria cri, Integer fno) {
		
		ReplyDTO dto = new ReplyDTO();
		dto.setList(replyMapper.list(cri, fno));
		dto.setReplyCnt(replyMapper.getTotal(fno));
		
		return dto;
	}

	@Override
	@Transactional
	public int rereply(ReplyVO vo) {
		boardMapper.updateReplyCnt(vo.getFno(), 1);
		
		return replyMapper.rereply(vo);
	}

	@Override
	public int haveChild(Integer rno) {
		
		return replyMapper.haveChild(rno);
	}

	@Override
	public int deleteParentReply(Integer rno) {
		// TODO Auto-generated method stub
		return replyMapper.deleteParentRply(rno);
	}

	

}
