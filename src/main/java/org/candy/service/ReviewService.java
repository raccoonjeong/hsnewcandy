package org.candy.service;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.Criteria;
import org.candy.domain.ReviewDTO;
import org.candy.domain.ReviewVO;

public interface ReviewService {

	public int create(ReviewVO vo);
	
	public ReviewVO read(Integer rno);
	
	public int update(ReviewVO vo);	
	
	public ReviewDTO list(
			@Param("cri") Criteria cri,
			@Param("fno") Integer fno);
		
	public int rereview(ReviewVO vo);	
	
	public int delete(Integer rno);
	
	public int haveChild(Integer rno);
	
	public int deleteParentReview(Integer rno); 
	
	
}
