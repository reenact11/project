package org.SOC.dto;

import java.util.Date;
import lombok.Data;

@Data
public class CollectDTO {

	private int postno;
	private int userno;
	private String category;
	private String posttitle;
	private String postcontent;
	private int readcnt;
	private String recruitstate;
	private Date postdate;
	private String teamname;
	private int teamno;
	private String teamlogo;
	private boolean recruitcheck;

}