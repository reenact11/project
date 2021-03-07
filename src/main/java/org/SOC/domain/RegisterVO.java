package org.SOC.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RegisterVO {

	private int userno;
	private String userid;
	private String userpw;
	private String username;
	private String usernname;
	private String useremail;
	private String userage;
	private String usergender;
	private String usertel;
	private String userloc;
	private String userposition;
	private String userintro;
	private String userrole;
	private Date userdate;

}
