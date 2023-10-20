package com.project.springboot.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private int no;
	private String id;
   private String password;
   private String phoneNumber;
   private String address1;
   private String address2;
   private String classify;
   private String proileImage;
   private String introduction;
   private String LinkUrl;
   private String region;
}
