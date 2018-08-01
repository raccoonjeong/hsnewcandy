package org.candy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LikeVO {
	//좋아요체크
	private int fno;
	private String uid;
	private Date regdate;
}
