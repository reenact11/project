package org.SOC.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommVO {

	private int commno;
	private int userno;
	private int postno;
	private String commcontent;
	private Date commdate;

}
