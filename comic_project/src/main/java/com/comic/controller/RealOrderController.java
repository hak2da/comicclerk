package com.comic.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.model.RealOrderVO;
import com.comic.service.RealOrderService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/realorder/")
public class RealOrderController {
	
	private RealOrderService realOrderService;
	
	@GetMapping("realOrderData")
	public ResponseEntity<List<RealOrderVO>> salesSearchData(){
		return new ResponseEntity<List<RealOrderVO>>(realOrderService.realOrderData(), HttpStatus.OK);
	}
}
