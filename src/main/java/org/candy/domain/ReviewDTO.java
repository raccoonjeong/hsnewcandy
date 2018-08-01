package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewDTO {//데이터 트랜스퍼 오브젝트 (데이터전송객체.. 데이터보따리)

	//푸드트럭용 댓글(리뷰) DTO.... 리뷰 
	private int reviewCnt;
	private List<ReviewVO> list;
	
}
