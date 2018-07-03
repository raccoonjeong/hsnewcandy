package org.candy.domain;

import java.util.Date;
import lombok.Data;

@Data
public class TruckVO {
	
	private int fno, likecnt, reviewcnt;
	private String title, content, writer, keyword, open_check;
	private double lat, lng;
	private Date regdate, updatedate;
	private String[] files;
	
	private static final Long ADAY = 1000 * 60 * 60 * 24L;
	

	public boolean checkNew() {
		
		long gap = new Date().getTime() - regdate.getTime();
		
		return gap < ADAY;
		
	}

}
