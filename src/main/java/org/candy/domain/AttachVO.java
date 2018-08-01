package org.candy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class AttachVO {
	
	//푸드트럭용 파일업로드
	
	private String uuid, fullname, represent; //디비에는 uuid+fullname , represent 는 대표사진 T or F 
	private int fno;
	private Date regdate;

}
