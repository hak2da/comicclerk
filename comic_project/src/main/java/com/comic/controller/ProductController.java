package com.comic.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.ProductVO;
import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/product/")
@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	
	@GetMapping("/productList")
	public void productGetList() {
	}
	
	@GetMapping("/productData")
	public ResponseEntity<List<ProductVO>> productData() {
		return new ResponseEntity<List<ProductVO>>(service.productGetList(), HttpStatus.OK);
	}
	
	@GetMapping("/productGet")
	public @ResponseBody ProductVO productGet(@RequestParam("product_num") int product_num) {
		return service.productGet(product_num);
	}
	
	@PostMapping("/productRegister")
	public String productRegister(ProductVO vo) {
		service.productRegister(vo);
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productModify")
	public String productModify(ProductVO vo) {
		service.productModify(vo);
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productRemove")
	public String productRemove(@RequestParam("product_num") int product_num) {
		service.productRemove(product_num);
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productNameCheck")
	@ResponseBody
	public int productNameCheck(@RequestParam("product_name") String product_name) {
		int result = 0;
		ProductVO nameCheck = service.productNameCheck(product_name);
		if(nameCheck != null) {
			result = 1;
		}
		return result;
	}
	
}
