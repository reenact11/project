package org.SOC.domain;

import lombok.Data;

@Data
public class UserVO {

  private String userid;
  private String userpw;
  private String usernname;
  private int userno;
  private String userrole;
  private String userlock;
}
/*  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

  public String getUserpw() {
    return userpw;
  }

  public void setUserpw(String userpw) {
    this.userpw = userpw;
  }

  public String getUsernname() {
    return usernname;
  }

  public void setUsernname(String usernname) {
    this.usernname = usernname;
  }

  public int getUserno() {
    return userno;
  }

  public void setUserno(int userno) {
    this.userno = userno;
  }

  @Override
  public String toString() {
    return "UserVO [userid=" + userid + ", userpw=" + userpw + ", usernname=" + usernname + ", userno=" + userno + "]";
  }
}*/
