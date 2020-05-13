package com.comic.model;

import lombok.Data;

@Data
public class LoginVO {
	
	private String MEMBER_ID;
	private String MEMBER_PWD;
	private String EMPLOYEE_NUM;
	private String EMPLOYEE_PWD;
	private boolean useCookie;
	
}