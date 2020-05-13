package com.comic.model;

import lombok.Data;

@Data
public class EmployeeAttachVO {
	
	private String uuid;		// UUID
	private String uploadPath;	// 업로드 된 경로
	private String fileName;	// 파일 이름
	private boolean fileType;	// 파일 타입
	
	private int EMPLOYEE_NUM;	//사원 번호
	
}
