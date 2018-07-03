package org.candy.mapper;


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
public class FreeboardMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private FreeboardMapper mapper;
	
	@Test
	public void registerTest() {
		
		for(int i = 0; i<100; i++) {
			FreeboardVO vo = new FreeboardVO();
			vo.setTitle("자유게시판제목"+i);
			vo.setContent("자유게시판내용"+i);
			vo.setWriter("user01");
			log.info(mapper.register(vo));
		}
	}
	@Test
	public void modifyTest() {
		
		FreeboardVO vo = new FreeboardVO();
		vo.setBno(2);
		vo.setTitle("수정제목1");
		vo.setContent("수정내용1");
	
		log.info(mapper.modify(vo));	
	}
	@Test
	public void readTest() {
		
		log.info(mapper.read(100));
	}
}
