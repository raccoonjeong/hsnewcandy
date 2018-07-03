package org.candy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Integer fno, rno, gno, ord;
	private String rcontent, replyer;
	private Date regdate, updatedate;

}
