package org.SOC.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TeamVO {

	private int teamno;
	private String teamname;
	private String teamintro;
	private String teamloc;
	private Date teamdate;
	private String teamlogo;

}
