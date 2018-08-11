package org.candy.service;

import org.candy.domain.Criteria;
import org.candy.domain.ReviewDTO;
import org.candy.domain.ReviewVO;
import org.candy.mapper.TruckMapper;
import org.candy.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ReviewMapper reviewMapper;

	@Setter(onMethod_ = { @Autowired })
	private TruckMapper truckMapper;

	@Transactional
	@Override
	public int create(ReviewVO vo) {

		truckMapper.updateReviewCnt(vo.getFno(), 1);

		reviewMapper.create(vo);

		return reviewMapper.updateup(vo);
	}

	@Override
	public ReviewVO read(Integer rno) {

		return reviewMapper.read(rno);
	}

	@Override
	public int update(ReviewVO vo) {

		return reviewMapper.update(vo);
	}

	@Transactional
	@Override
	public int delete(Integer rno) {
		int fno = reviewMapper.getFno(rno);
		truckMapper.updateReviewCnt(fno, -1);

		return reviewMapper.delete(rno);
	}

	@Override
	@Transactional
	public int rereview(ReviewVO vo) {
		truckMapper.updateReviewCnt(vo.getFno(), 1);

		return reviewMapper.rereview(vo);
	}

	@Override
	public ReviewDTO list(Criteria cri, Integer fno) {
		ReviewDTO dto = new ReviewDTO();
		dto.setList(reviewMapper.list(cri, fno));
		dto.setReviewCnt(reviewMapper.getTotal(fno));

		return dto;
	}

	@Override
	@Transactional
	public int like(Integer fno, String uid) {

		try {
			reviewMapper.like(fno, uid);
			truckMapper.updateLikeCnt(fno, 1);
			
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

}
