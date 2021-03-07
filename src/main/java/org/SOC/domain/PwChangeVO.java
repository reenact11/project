package org.SOC.domain;

import lombok.Data;

@Data
public class PwChangeVO {

  private String userid;
  private String useremail;
  private String userpw;
  private String AuthenticationUser;
}

