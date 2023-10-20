package com.project.springboot.noticeboard;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeBoardDTO {
	private int notiNo;
	private int no;
	private String title;
	private String content;
	private String ofile;
	private String nfile;
	private Date postDate;
}
