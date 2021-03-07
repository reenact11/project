package org.SOC.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TeamPage {

	private int teamno;
	private String teamname;
	private String teamintro;
	private String teamloc;
	private String teamlogo;
	private Date teamdate;
	private int teamcount;

}
