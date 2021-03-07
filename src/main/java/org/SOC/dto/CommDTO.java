package org.SOC.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommDTO {

	private int commno;
	private String usernname;
	private int postno;
	private String commcontent;
	private Date commdate;

}
