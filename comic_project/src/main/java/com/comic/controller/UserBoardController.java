package com.comic.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.BoardVO;
import com.comic.model.CriteriaVO;
import com.comic.model.PageVO;
import com.comic.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/userView/board/*")
public class UserBoardController {
	
	private BoardService service;
	
	@GetMapping("/boardList")
	public void CustomerCenterList(CriteriaVO cri, Model model) {
		
		log.info("\r\n####list : "+cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("\r\n####total : "+total);
		model.addAttribute("count", service.getTotal(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		
	}
	
	@GetMapping("/boardRegister")
	public void register(){
		
	}
	
	@PostMapping("/boardRegister")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("\r\n####register : "+board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBoard_num());
		
		return "redirect:/userView/board/boardList";
		
	}
	
	@GetMapping({"/boardGet","/boardModify"})
	public void get(@RequestParam("board_num") Long board_num,
			@ModelAttribute("cri") CriteriaVO cri, Model model) {
		
		log.info("\r\n####get or modify : "+model);
		
		model.addAttribute("board", service.get(board_num));
	}
	
	@PostMapping("/boardModify")
	public String modify(BoardVO board, CriteriaVO cri, RedirectAttributes rttr) {
		
		log.info("\r\n####modify : "+board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "sucess");
		}
		return "redirect:/userView/board/boardList"+cri.getListLink(); 
		
	}
	
	@PostMapping("/boardRemove")
	public String remove(@RequestParam("board_num") Long board_num, CriteriaVO cri, RedirectAttributes rttr) {
		
		log.info("\r\n####remove board_num : "+board_num);
		
			if(service.remove(board_num)) {
				rttr.addFlashAttribute("result", "성공");
			}
		return "redirect:/userView/board/boardList"+cri.getListLink(); 
		
	}
}