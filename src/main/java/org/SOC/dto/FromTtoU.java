package org.SOC.dto;

import java.util.Date;

import lombok.Data;
@Data
public class FromTtoU {

	private int ureviewno; // 리뷰 번호
	private int formno; // 신청서 번호
	private int userno; // 대상유저 번호
	private String ureview; // 리뷰내용
	private int userbpm;
	private Date reviewdate;
}

  /* public Article(Integer postno, int userno, String category, 
         String posttitle, String postcontent, int readcnt, String recruitstate, String teamname, int teamno, Date postdate) {
      this.POSTNO = postno;
      this.USERNO = userno;
      this.CATEGORY = category;
      this.POSTTITLE = posttitle;
      this.POSTCONTENT = postcontent;
      this.READCNT = readcnt;                                                   
      this.RECRUITSTATE = recruitstate;
      this.TEAMNAME = teamname;
      this.TEAMNO = teamno;
      this.POSTDATE = postdate;
   }

   

   public Integer getPostno() {      //=getnumber
      return POSTNO;
   }

   public int getUserno() {      //=getWriter
      return USERNO;
   }

   public String getCategory() {
      return CATEGORY;
   }

   public String getPosttitle() {
      return POSTTITLE;
   }

   public String getPostcontent() {
      return POSTCONTENT;
   }

   public int getReadcnt() {
      return READCNT;
   }
   
   public String getRecruitstate() {
      return RECRUITSTATE;
   }
   
   public String getTeamname() {
      return TEAMNAME;
   }
   
   public int getTeamno() {
      return TEAMNO;
   }
   public Date postdate() {
      return POSTDATE;
   }

   public boolean getRecruitcheck() {
      if(RECRUITSTATE.equals("O")) {
         this.recruitcheck=true;
      }else {
         this.recruitcheck=false;
      }
      return recruitcheck;
   }
}*/