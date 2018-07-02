package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReplyDTO {

	private int replyCnt;
	private List<ReplyVO> list;
	
}
