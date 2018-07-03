package org.candy.service;

import org.candy.domain.UserAuthVO;
import org.candy.domain.UserVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class UserServiceTests {
	

	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Test
	public void TestCreat() {
		
		UserVO vo = new UserVO();
		
		vo.setUid("zxzx");
		vo.setUpw("1111");
		vo.setRole("s");
		vo.setUname("zzz");
		vo.setEmail("3333@gmail.com");
		
		service.create(vo);
	}
	
	@Test
	public void TestCreateAuth() {
		UserAuthVO vo = new UserAuthVO();
		
		vo.setUid("zxzx");
		
		service.createAuth(vo);
		
	}
	
	@Test
	public void TestUpdatePassword() throws Exception{
		
		String mid = "zxzx";
		String empw = encoder.encode("1111");
		log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+empw);
		
		service.updatePassword(mid,empw);
	}

}
