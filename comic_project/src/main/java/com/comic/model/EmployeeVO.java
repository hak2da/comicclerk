package com.comic.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class EmployeeVO {
   
   private int EMPLOYEE_NUM; //직원사번
   private String EMPLOYEE_PWD; //비밀번호
   private String EMPLOYEE_NAME; //이름
   private String EMPLOYEE_PHONE; //연락처
   private String EMPLOYEE_ACCOUNT; //계좌번호
   private Date EMPLOYEE_STARTDAY; //입사일
   private String EMPLOYEE_POSITION; //직책
   private int EMPLOYEE_PAY; //시급/월급
   
   private List<EmployeeAttachVO> attachList;
   
}