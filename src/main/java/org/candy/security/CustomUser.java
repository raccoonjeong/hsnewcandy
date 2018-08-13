package org.candy.security;


import java.util.stream.Collectors;

import org.candy.domain.UserVO;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User{
	
	private String uname;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public CustomUser(UserVO vo) {
		super(vo.getUid(), vo.getUpw(), vo.getAuthList().stream()
				.map(authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
				.collect(Collectors.toList()));
		this.uname = vo.getUname();
		
		
	}

}
