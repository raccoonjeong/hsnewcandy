package org.candy.mapper;

import org.apache.ibatis.annotations.Param;
import org.candy.domain.UserAuthVO;
import org.candy.domain.UserDetailsVO;
import org.candy.domain.UserVO;

public interface UserMapper {

	public UserDetailsVO read(String uid);
	
	public void create(UserVO vo);
	
	public void createAuth(UserAuthVO auth);
	
	public void updatePassword(@Param("uid")String uid, @Param("eupw")String encryptedPw);
	
	public Integer idcheck(String uid);
	
	//글작성여부
	public int existTruck(@Param("uid")String uid, @Param("whether")Integer whether);
}
