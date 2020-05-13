package com.comic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.ProductVO;
import com.comic.service.SettlementService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/settlement/")
@AllArgsConstructor//생성자함수
public class SettlementController {

	private SettlementService settleService;

	@GetMapping("settlementlist")
	public String settlementList(Model model) {
		model.addAttribute("settleList", settleService.settlementList()); // 재고테이블
		return "settlement/settlementlist";
	}

	@PostMapping("settlementlist")
	public @ResponseBody Map<String, Object> settlementCheck(@RequestBody HashMap<String, Object> map) {
		Map<String, Object> errorMap = settleService.settlementError(map); // 오차 재고

		return errorMap;
	}

	@PostMapping("modify")
	public String modify(@RequestParam("numList") String[] numList,
			@RequestParam("productList") String[] productList) {
		
		List<ProductVO> current = settleService.settlementList(); // 현재 재고 가져옴
		
		for (int i = 0; i < numList.length; i++) {
			settleService.modify(numList[i],productList[i], current.get(i).getProduct_qty()); // 재고 테이블 수정
			settleService.insertLoss(current.get(i),productList[i]); // 손실테이블에 추가 (현재재고와 입력 재고값 보냄)
		}
		
		return "redirect:/settlement/settlementlist";
	}
}
