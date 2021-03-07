package org.SOC.dto;

import java.util.Date;
import lombok.Data;

@Data
public class MatchDTO {

	private int postno;
	private int userno; // 회원번호
	private String category; // 글분류
	private String posttitle; // 글제목
	private String postcontent; // 글내용
	private int readcnt; // 조회수
	private String recruitstate; // 모집상태
	private Date postdate; // 작성일
	private String teamname;
	private int teamno;
	private String teamlogo;
	private boolean recruitcheck;

}