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

import com.comic.model.ProductOrderVO;
import com.comic.model.ProductVO;
import com.comic.model.SalesStatisticsVO;
import com.comic.service.ProductOrderService;
import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/productOrder/")
@AllArgsConstructor
public class ProductOrderController {
	
	private ProductOrderService service;
	private ProductService productService;
	
	@GetMapping("/productOrderList")
	public void productOrderList(Model model) {
		model.addAttribute("productList", productService.productGetList());
	}
	
	@GetMapping("/productOrderData")
	public ResponseEntity<List<ProductOrderVO>> productOrderData() {
		return new ResponseEntity<List<ProductOrderVO>>(service.productOrderList(), HttpStatus.OK);
	}
	
	@GetMapping("/productOrderGet")
	public @ResponseBody ProductOrderVO productOrderGet(@RequestParam("productOrder_num") int productOrder_num) {
		return service.productOrderGet(productOrder_num);
	}
	
	@PostMapping("/productOrderRemove")
	public String productOrderRemove(@RequestParam("productOrder_num") int productOrder_num) {
		service.productOrderRemove(productOrder_num);
		return "redirect:/productOrder/productOrderList";
	}
	
	@PostMapping("/productOrderRegister")
	public String productOrderRegister(ProductOrderVO vo) {
		service.productOrderRegister(vo);
		return "redirect:/productOrder/productOrderList";
	}
	
	@PostMapping("/productOrderModify")
	public String productOrderModify(ProductOrderVO vo) {
		service.productOrderModify(vo);
		return "redirect:/productOrder/productOrderList";
	}
	
	@PostMapping("/productOrderCheck")
	public String productOrderCheck(@RequestParam("productOrder_num") int productOrder_num) {
		service.productOrderCheck(productOrder_num);
		return "redirect:/productOrder/productOrderList";
	}
}
