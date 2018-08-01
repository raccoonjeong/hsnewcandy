package org.candy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeboardVO {

	private int bno, replycnt, viewcnt;
	private String title, content, writer;
	private Date regdate, updatedate;

	private String[] files; //디비에는 없지만 첨부파일에 필요한것... 여러개 삭제할때만 쓰임

	
	//new아이콘작업
	private static final Long ADAY = 1000 * 60 * 60 * 24L; 

	public boolean checkNew() { 
		long gap = new Date().getTime() - regdate.getTime();
		return gap < ADAY;
	}
	
}
