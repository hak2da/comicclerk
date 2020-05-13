package com.comic.mapper;

import java.util.List;

import com.comic.model.EmployeeAttachVO;

public interface EmployeeAttachMapper {
	
	public void insert(EmployeeAttachVO vo);
	
	public void delete(String EMPLOYEE_NUM);
	
	public List<EmployeeAttachVO> findByEMPLOYEE_NUM(int EMPLOYEE_NUM);
	
}
