package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.EmployeeVO;


public interface ManagementMapper {
	public List<EmployeeVO>employeelist();
	public int deletemng(@Param("emppwd") String emppwd,@Param("mngnum")  String mngnum);
	public int managerlogin(@Param("empnum") String empnum,@Param("emppwd") String  emppwd);
	
	public int managerloginrecord
	(@Param("empnum") String empnum,@Param("emppwd") String  emppwd,@Param("todaydate") String  todaydate);
	
	public void managerattendance(@Param("empnum") String empnum);
	
	public void managerleavework(@Param("empnum") String empnum,@Param("leaveworkday")String leaveworkday);
	public List<EmployeeVO> getempdata(@Param("empnum") String empnum);
	
	
	
	public void employeeModify(EmployeeVO vo);
	
	public int selectworkmonth(@Param("empnum")String empnum,@Param("workmonth") String workmonth);
	
	public void insertworkmonth(@Param("empnum")String empnum,@Param("workmonth")String workmonth,@Param("payday")String payday);
	
	public void setmonthlypay(@Param("empnum")String empnum, @Param("workmonth")String workmonth,@Param("hour") int hour);

}
