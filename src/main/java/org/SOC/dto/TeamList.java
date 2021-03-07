package org.SOC.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TeamList {

  private int teamno;
  private String teamname;
  private String teamloc;
  private Date teamdate;
}

