package com.comic.service;

import java.util.List;

import com.comic.model.EmployeeVO;

public interface ManagementService {
	public List<EmployeeVO> managerList();
	public int deletemng(String emppwd,String mngnum);
	public int managerlogin(String empnum, String emppwd);
	public int managerloginrecord(String empnum, String emppwd,String todaydate);
	public void managerattendance(String empnum);
	public void managerleavework(String empnum,String leaveworkday); //퇴근
	public List<EmployeeVO> getempdata(String empnum);
	public void employeeModify(EmployeeVO vo);
	public int selectworkmonth(String empnum, String workmonth);
	public void insertworkmonth(String empnum, String workmonth, String payday);
	public void setmonthlypay(String empnum, String workmonth, int hour);

}
