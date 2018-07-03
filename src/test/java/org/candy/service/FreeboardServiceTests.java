package org.candy.service;


import org.candy.domain.FreeboardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class FreeboardServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private FreeboardService service;
	
	@Test
	public void register() {
		log.info("Service register Test");
		for(int i = 0; i<10; i++) {
			FreeboardVO vo = new FreeboardVO();
			vo.setTitle("자유게시판제목"+i);
			vo.setContent("자유게시판내용"+i);
			vo.setWriter("user01");
			service.register(vo);
		}
	}
	@Test
	public void modify() {
		log.info("Service modify Test");
		FreeboardVO vo = new FreeboardVO();
		vo.setBno(100);
		vo.setTitle("수정제목100");
		vo.setContent("수정내용100");
	
		service.modify(vo);
		
	}
}
