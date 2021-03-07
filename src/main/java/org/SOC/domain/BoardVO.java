package org.SOC.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

  private int postno;
  private int userno;
  private String category;
  private String posttitle;
  private String postcontent;
  private int readcnt;
  private String recruitstate;
  private Date postdate;
  private boolean recruitcheck;

  private String[] files;
  
  public boolean recruitcheck() {
	  
	  if(this.recruitstate.equals("O")) {
		  return true;
	  }
	  return false;
  }
}
