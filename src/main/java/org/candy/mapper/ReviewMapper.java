package org.candy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.Criteria;
import org.candy.domain.ReviewVO;

public interface ReviewMapper {

	public int create(ReviewVO vo);
	
	public ReviewVO read(Integer rno);
	
	public int update(ReviewVO vo);	
	
	public List<ReviewVO> list(
			@Param("cri") Criteria cri,
			@Param("fno") Integer fno);
	
	public int getTotal(Integer fno);
	
	public int getFno(Integer rno);

	public int updateup(ReviewVO vo);
	
	public int rereview(ReviewVO vo);
	
	
	public int delete(Integer rno);
	
	public int haveChild(Integer rno);
	
	public int deleteParentReview(Integer rno); 
	
	
}
