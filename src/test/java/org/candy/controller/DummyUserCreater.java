package org.candy.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.candy.domain.UserAuthVO;
import org.candy.domain.UserVO;
import org.candy.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class DummyUserCreater {
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testRead() {
		UserVO vo = mapper.read("user01");
		
		log.info("vo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+vo);
	}

	/*@Test
	public void testInsert() {
		
		for(int i =0; i<100; i++) {
			MemberVO vo = new MemberVO();
			vo.setMid("user"+i);
			vo.setMpw(encoder.encode("pw"+i));
			vo.setMname("�궗�슜�옄"+i);
			
			mapper.insert(vo);
			
			if(i>=0) {
				
			MemberAuthVO auth1 = new MemberAuthVO();
			auth1.setMid("user"+i);
			auth1.setAuth("ROLE_USER");
			
			mapper.insertAuth(auth1);
			}
			
			if( i>=80){
				MemberAuthVO authMan = new MemberAuthVO();
				authMan.setMid("user"+i);
				authMan.setAuth("ROLE_MANAGER");
				
				mapper.insertAuth(authMan);
				
			}
			if( i>=90){
				MemberAuthVO authAdmin = new MemberAuthVO();
				authAdmin.setMid("user"+i);
				authAdmin.setAuth("ROLE_ADMIN");
				
				mapper.insertAuth(authAdmin);
				
			}
		}
	}*/
}
