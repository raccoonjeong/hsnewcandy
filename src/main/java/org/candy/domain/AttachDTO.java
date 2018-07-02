package org.candy.domain;

import java.util.List;

import lombok.Data;

@Data
public class AttachDTO {

	private int uploadCnt;
	private List<AttachVO> list;
}
