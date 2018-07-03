package org.candy.service;

import org.candy.domain.Criteria;
import org.candy.domain.ReviewDTO;
import org.candy.domain.ReviewVO;
import org.candy.mapper.BoardMapper;
import org.candy.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Setter(onMethod_= {@Autowired})
	private ReviewMapper ReviewMapper;
	

	@Setter(onMethod_= {@Autowired})
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int create(ReviewVO vo) {
		
		boardMapper.updateReviewCnt(vo.getFno(), 1);
		
		ReviewMapper.create(vo);
		 
		return ReviewMapper.updateup(vo);
	}

	@Override
	public ReviewVO read(Integer rno) {
		
		return ReviewMapper.read(rno);
	}

	@Override
	public int update(ReviewVO vo) {
		
		return ReviewMapper.update(vo);
	}

	@Transactional
	@Override
	public int delete(Integer rno) {
		int fno = ReviewMapper.getFno(rno);
		boardMapper.updateReviewCnt(fno, -1);
		
		return ReviewMapper.delete(rno);
	}


	@Override
	@Transactional
	public int rereview(ReviewVO vo) {
		boardMapper.updateReviewCnt(vo.getFno(), 1);
		
		return ReviewMapper.rereview(vo);
	}

	@Override
	public int haveChild(Integer rno) {
		
		return ReviewMapper.haveChild(rno);
	}

	@Override
	public int deleteParentReview(Integer rno) {
		// TODO Auto-generated method stub
		return ReviewMapper.deleteParentReview(rno);
	}

	@Override
	public ReviewDTO list(Criteria cri, Integer fno) {
		ReviewDTO dto = new ReviewDTO();
		dto.setList(ReviewMapper.list(cri, fno));
		dto.setReviewCnt(ReviewMapper.getTotal(fno));
		
		return dto;
	}

}
