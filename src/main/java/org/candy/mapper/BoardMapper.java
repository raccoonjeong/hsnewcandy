package org.candy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.TruckVO;
import org.candy.domain.Criteria;


public interface BoardMapper {
	
	public List<TruckVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	
	public List<TruckVO> searchList(Criteria cri);
	
	public int register(TruckVO vo);
			
	public TruckVO read(int fno);

	public int remove(int fno);

	public int modify(TruckVO vo);
	
	public int updateReviewCnt(@Param("fno")Integer fno, @Param("amount")int amount);

	public int addAttach(String fullName);
	
	public void updateViewCnt(Integer fno);
	
	public List<String> getAttach(Integer fno);
	
	public void deleteAttach(Integer fno);
	
	public void replaceAttach(@Param("fullName")String fullName,@Param("fno")Integer fno);
	
	
}
