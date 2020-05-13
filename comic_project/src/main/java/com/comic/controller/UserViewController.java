package com.comic.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.ChatVO;
import com.comic.model.UserBillVO;
import com.comic.model.UserProductBillVO;
import com.comic.service.ChattingService;
import com.comic.service.UserOrderManegerService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/userView/")
@AllArgsConstructor
public class UserViewController {
	
	private UserOrderManegerService userOrderManegerService;
	
	private ChattingService chatService;
	
	@PostMapping("/mainPro")
	public void mainViewPro() {
		
	}
	
	@GetMapping("/mainPro")
	public void mainViewGetPro() {
		
	}
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@PostMapping("/main")
	public void mainPost() {
		
	}
	
	@GetMapping("/order")
	public void orderView(Model model, final HttpSession session) {
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
		model.addAttribute("OrderViewVO_List", userOrderManegerService.readCategory());
	}
	
	@GetMapping("/chatting")
	public @ResponseBody List<ChatVO> chat(final HttpSession session, Model model) {
		
		List<ChatVO> chatList= chatService.selectChat(Integer.parseInt(session.getAttribute("roomNum").toString()));
		return chatList;
	}
	
	@GetMapping("userBill")
	public @ResponseBody UserBillVO userBill(@RequestParam("userId") String id) {
		return userOrderManegerService.userBill(id);
	}
	
	@GetMapping("userProductBill")
	public @ResponseBody List<UserProductBillVO> userProductBill(@RequestParam("userId") String id) {
		System.out.println(userOrderManegerService.userProductBill(id));
		return userOrderManegerService.userProductBill(id);
	}
}
