package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comic.mapper.EmployeeAttachMapper;
import com.comic.mapper.ManagementMapper;
import com.comic.model.EmployeeVO;
import com.comic.service.ManagementService;

import lombok.Setter;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Setter(onMethod_ = @Autowired)
	private ManagementMapper managementMapper;
	@Setter(onMethod_ = @Autowired)
	private EmployeeAttachMapper employeeAttachMapper;
	
	@Override
	public List<EmployeeVO> managerList() {
		return managementMapper.employeelist();
	}

	@Transactional
	@Override
	public int deletemng(String emppwd, String mngnum) {
		int result = 0;
		System.out.println("여기옴");
		if(managementMapper.deletemng(emppwd, mngnum) == 1) {
			System.out.println("이미지삭제");
			employeeAttachMapper.delete(mngnum);
			result = 1;
		}
		return result;
//		employeeAttachMapper.delete(mngnum);
//		managementMapper.deletemng(emppwd, mngnum);
	}

	@Override
	public int managerlogin(String empnum, String emppwd) {
		// TODO Auto-generated method stub
		return managementMapper.managerlogin(empnum, emppwd);
	}

	@Override
	public int managerloginrecord(String empnum, String emppwd,String todaydate) {
		// TODO Auto-generated method stub
		return managementMapper.managerloginrecord(empnum, emppwd,todaydate);
	}

	@Override
	public void managerattendance(String empnum) {
		// TODO Auto-generated method stub
		managementMapper.managerattendance(empnum);
	}
	
	@Override
	public void managerleavework(String empnum,String leaveworkday) {
		// TODO Auto-generated method stub
		managementMapper.managerleavework(empnum,leaveworkday);
	}

	@Override
	public List<EmployeeVO> getempdata(String empnum) {
		// TODO Auto-generated method stub
		return managementMapper.getempdata(empnum);
	}

	@Override
	public void employeeModify(EmployeeVO vo) {
		
		employeeAttachMapper.delete(Integer.toString(vo.getEMPLOYEE_NUM()));
		
		vo.getAttachList().forEach(attach -> {
			attach.setEMPLOYEE_NUM(vo.getEMPLOYEE_NUM());;
			employeeAttachMapper.insert(attach);
		});
		
		managementMapper.employeeModify(vo);
	}
	
	@Override
	public int selectworkmonth(String empnum, String workmonth) {
		return managementMapper.selectworkmonth(empnum,workmonth);
		
	}
	
	@Override
	public void insertworkmonth(String empnum, String workmonth, String payday) {
		managementMapper.insertworkmonth(empnum,workmonth,payday);
	}
	
	@Override
	public void setmonthlypay(String empnum, String workmonth, int hour) {
		managementMapper.setmonthlypay(empnum, workmonth, hour);
	}

}
