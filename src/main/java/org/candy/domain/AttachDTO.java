package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class AttachDTO {
	
	//푸드트럭용 파일업로드 갯수 확인.... 첨부파일 있는지없는지? 클립아이콘 붙일지 확인하려고??(?)

	private int uploadCnt;
	private List<AttachVO> list;
}
