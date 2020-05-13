package com.comic.model;

import lombok.Data;

@Data
public class MemberVO {
	
	private String MEMBER_ID;
	private String MEMBER_PWD;
	private String MEMBER_NAME;
	private String MEMBER_EMAIL;
	private String MEMBER_PHONE_NUMBER;
	
	// 멤버 임시 비밀번호 저장
	private String TEM_PWD;
	
}