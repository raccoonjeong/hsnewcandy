package org.candy.security;


import java.util.stream.Collectors;

import org.candy.domain.UserDetailsVO;
import org.candy.domain.UserVO;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User{
	
	private UserDetailsVO vo;
	
	public UserDetailsVO getVo() {
		return vo;
	}
	
	
	public CustomUser(UserDetailsVO vo) {
		super(vo.getUid(), vo.getUpw(), vo.getAuthList().stream()
				.map(authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
				.collect(Collectors.toList()));
		this.vo = vo;
	}

}
