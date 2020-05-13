package com.comic.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.BookAttachVO;
import com.comic.model.CriteriaVO;
import com.comic.model.PageVO;
import com.comic.service.SearchBookService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/SearchBook/*")
public class SearchBookController {
	
	private SearchBookService service;
	
	@GetMapping("/searchList")
	public void SearchResultList(CriteriaVO cri, Model model) {
		
		log.info("\r\n#### List : "+cri);
		model.addAttribute("list", service.searchGetList(cri));
		
		int total = service.searchTotal(cri);
		log.info("\r\n### total : "+total);
		model.addAttribute("count", service.searchTotal(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
}