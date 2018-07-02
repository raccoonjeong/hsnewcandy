package org.candy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class AttachVO {
	
	private String uuid, fullname, represent;
	private int fno;
	private Date regdate;

}
