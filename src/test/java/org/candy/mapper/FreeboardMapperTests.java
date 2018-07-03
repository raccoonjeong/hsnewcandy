package org.candy.mapper;



import org.candy.domain.FreeboardVO;

import org.candy.domain.Criteria;

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
			vo.setTitle("ÀÚÀ¯°Ô½ÃÆÇÁ¦¸ñ"+i);
			vo.setContent("ÀÚÀ¯°Ô½ÃÆÇ³»¿ë"+i);
			vo.setWriter("user01");
			log.info(mapper.register(vo));
		}
	}
	@Test
	public void modifyTest() {
		
		FreeboardVO vo = new FreeboardVO();
		vo.setBno(2);
		vo.setTitle("¼öÁ¤Á¦¸ñ1");
		vo.setContent("¼öÁ¤³»¿ë1");
	
		log.info(mapper.modify(vo));	
	}
	@Test
	public void readTest() {
		
		log.info(mapper.read(100));
	}

	public void getList() {
		Criteria cri = new Criteria(1);
		log.info(mapper.list(cri));
	}

	@Test
	public void getTotal() {
		Criteria cri = new Criteria();
		log.info(mapper.getTotal(cri));
	}
	
	@Test
	public void getSearch() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setType("t");
		cri.setKeyword("ÀÚÀ¯");
		log.info(mapper.list(cri));
	}


}
