package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewDTO {

	private int reviewCnt;
	private List<ReviewVO> list;
	
}
