package org.candy.service;

import org.candy.domain.UserAuthVO;
import org.candy.domain.UserVO;
import org.candy.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public UserVO read(String uid) {
		
		return mapper.read(uid);
	}

	@Transactional
	@Override
	public void create(UserVO vo) {
		
		String encPassword = encoder.encode(vo.getUpw());
		
		log.info("vo.setupw(encPassword)�뒗 萸�~~~~~~~~~~?"+vo);
		vo.setUpw(encPassword);
	
		mapper.create(vo);
		
		UserAuthVO getAuth = new UserAuthVO();
		getAuth.setUid(vo.getUid());
		getAuth.setAuth("ROLE_USER");
		
		log.info("vo.getuid..."+vo.getUid());
		log.info("auth.."+getAuth);
		
		vo.getAuthList().add(getAuth);
			
		vo.getAuthList().forEach(auth->mapper.createAuth(auth));
		
	}

	@Override
	public void createAuth(UserAuthVO auth) {
		
		mapper.createAuth(auth);
	}

	@Override
	public void updatePassword(String uid, String encryptedPw) {
		
		mapper.updatePassword(uid, encryptedPw);
	}

	@Override
	public Integer idcheck(String uid) {

		return mapper.idcheck(uid);
	}

}
