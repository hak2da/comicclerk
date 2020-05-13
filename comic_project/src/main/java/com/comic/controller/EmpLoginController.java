package com.comic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.comic.model.EmployeeVO;
import com.comic.service.MemberService;
import com.comic.service.impl.ManagementServiceImpl;

@Controller
public class EmpLoginController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	private ManagementServiceImpl managementService;// 매니저(직원관리)
	
	//직원 추가
	   @GetMapping("/EmployeeRegister")
	   public String EmployeeRegister() {
	      return "/younghak/EmployeeRegister";
	   }
	   
	   @PostMapping("/EmployeeRegister")
	   public String EmployeeRegister(EmployeeVO vo, Model model) {
	      service.employeeRegister(vo);
	      model.addAttribute("managerList", managementService.managerList()); // 재고테이블
			return "redirect:/managerpos/Manager_management";
	   }
}
