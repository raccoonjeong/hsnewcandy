package org.candy.domain;



import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Integer rno, bno, gno, ord;
	private String rcontent, replyer;
	private Date regdate, updatedate;
	
}
