package org.candy.domain;



import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	//프리보드용 댓글VO
	private Integer rno, bno, gno, ord;//gno=그룹넘버, ord=대댓글인지 여부(0 or 1)
	private String rcontent, replyer;
	private Date regdate, updatedate;
	
}
