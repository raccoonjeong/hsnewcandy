package org.candy.domain;

import lombok.Data;

@Data
public class KeywordVO {
	//컨슈머가 등록하는 관심키워드와 관심지역
	private String keyword,uid;
	private double lat,lng;
}
