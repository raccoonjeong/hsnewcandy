package org.candy.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.candy.domain.UserAuthVO;
import org.candy.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class UserMapperTests {

	@Setter(onMethod_= {@Autowired})
	private UserMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Test
	public void TestCreat() {
		
		UserVO vo = new UserVO();
		
		vo.setUid("zzz");
		vo.setUpw("1111");
		vo.setUname("zzzz");
		vo.setRole("s");
		vo.setEmail("2222@gmail.com");
		vo.setPhone_number("010-0000-0000");
		
		mapper.create(vo);
	}
	
	@Test
	public void TestCreateAuth() {
		UserAuthVO vo = new UserAuthVO();
		
		vo.setUid("zzz");
		vo.setAuth("ROLE_USER");
		
		mapper.createAuth(vo);
		
	}
	
	@Test
	public void TestUpdatePassword() throws Exception{
		
		String mid = "zzz";
		String empw = encoder.encode("1111");
		log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+empw);
		
		mapper.updatePassword(mid,empw);
		
	}
	
	@Test
	public void TestIdCheck() {
		String mid = "zzz";
		
		mapper.idcheck(mid);
	}
}
