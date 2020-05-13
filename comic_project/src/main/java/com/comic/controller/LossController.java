package com.comic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.LossVO;
import com.comic.model.ProductVO;
import com.comic.service.LossService;
import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/loss")
@AllArgsConstructor
public class LossController {
	
	private LossService lossService;
	private ProductService productService;
	
	@GetMapping("losslist")
	public void lossList() {
	}
	
	@GetMapping("lossdata")
	public ResponseEntity<List<LossVO>> lossData(){ 
		return new ResponseEntity<List<LossVO>>(lossService.lossList(), HttpStatus.OK);
	}
	
	@PostMapping("lossRegister")
	public String lossRegister(LossVO vo) {
		lossService.lossRegister(vo);
		return "redirect:/loss/losslist";
	}
	
	@PostMapping("lossCreate")
	public @ResponseBody Map<String, List<ProductVO>> lossCreate() {
		Map<String, List<ProductVO>> map = new HashMap<String, List<ProductVO>>();
		map.put("product", productService.productGetList());
		return map;
	}
	
	@PostMapping("lossRemove")
	public String productRemove(@RequestParam("loss_num") int loss_num) {
		lossService.lossRemove(loss_num);
		return "redirect:/loss/losslist";
	}
	
	@GetMapping("lossUpdate")
	public @ResponseBody Map<String, Object> lossGetUpdate(@RequestParam("loss_num") int loss_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", productService.productGetList());
		map.put("getModify", lossService.lossGet(loss_num));
		return map;
	}
	
	
	@GetMapping("lossModify")
	public @ResponseBody Map<String, LossVO> lossGetModify(@RequestParam("loss_num") int loss_num) {
		Map<String, LossVO> map = new HashMap<String, LossVO>();
		map.put("getModify", lossService.lossGet(loss_num));
		return map;
	}
	
	@PostMapping("lossModify")
	public String lossModify(LossVO vo) {
		lossService.lossModify(vo);
		return "redirect:/loss/losslist";
	}
}
