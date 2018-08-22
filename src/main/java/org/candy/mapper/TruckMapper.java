package org.candy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.Criteria;
import org.candy.domain.TruckVO;

public interface TruckMapper {
	
	public List<TruckVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	
	public int register(TruckVO vo);
			
	public TruckVO read(int fno);

	public int remove(int fno);

	public int modify(TruckVO vo);
	
	//�Ķ���� �������϶� @Param ���̱�
	public int updateReviewCnt(@Param("fno")Integer fno, @Param("amount")int amount);

	public int addAttach(String fullName);//register�� �Ѹ�
	
	public int addAttachRepresent(String fullName);
	
	public void updateViewCnt(Integer fno);
	
	public List<String> getAttach(Integer fno);
	
	public void deleteAttach(Integer fno);
	
	//�Ķ���� �������϶� @Param ���̱�
	public void replaceAttach(@Param("fullName")String fullName,@Param("fno")Integer fno);
	
	public void updateLikeCnt(@Param("fno")Integer fno, @Param("amount")int amount);
	
	//����Ŭ����
	public void openClose(@Param("uid")String uid, @Param("value")String value);
	
	//���� Ʈ�� ���¿��� �ҷ�����
	public String readMyTruck(String uid);

}
