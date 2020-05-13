package com.comic.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.BookAttachVO;
import com.comic.model.BookVO;
import com.comic.service.BookService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/book")
@AllArgsConstructor
public class BookController {
	
	private BookService service;
	
	@GetMapping("/bookList")
	public void bookGetList() {
	}
	
	@GetMapping("/bookData")
	public ResponseEntity<List<BookVO>> bookData() {
		return new ResponseEntity<List<BookVO>>(service.bookGetList(), HttpStatus.OK);
	}
	
	@GetMapping("/bookGet")
	public @ResponseBody BookVO bookGet(@RequestParam("book_name") String book_name) {
		return service.bookGet(book_name);
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BookAttachVO>> getAttachList(@RequestParam("book_name") String book_name) {
		return new ResponseEntity<List<BookAttachVO>>(service.getAttachList(book_name), HttpStatus.OK);
	}
	
	@PostMapping("/bookRegister")
	public String bookRegister(BookVO vo) {
		service.bookRegister(vo);
		return "redirect:/book/bookList";
	}
	
	@PostMapping("/bookModify")
	public String bookModify(@RequestParam("book_name_change") String book_name_change, BookVO vo) {
		List<BookAttachVO> attachList = service.getAttachList(vo.getBook_name());
		service.bookModify(book_name_change, vo);
      service.bookModify(book_name_change, vo);
      if(!attachList.get(0).getUuid().equals(vo.getAttachList().get(0).getUuid())) {
          deleteFiles(attachList);
       }
		return "redirect:/book/bookList";
	}
	
	@PostMapping("/bookRemove")
	public String bookRemove(@RequestParam("book_name") String book_name) {
		List<BookAttachVO> attachList = service.getAttachList(book_name);
		if(service.bookRemove(book_name)) {
			deleteFiles(attachList);
		}
		return "redirect:/book/bookList";
	}
	
	@PostMapping("/bookNameCheck")
	 @ResponseBody
	public int productNameCheck(@RequestParam("book_name") String book_name) {
		int result = 0;
		BookVO nameCheck = service.bookNameCheck(book_name);
		if(nameCheck != null) {
			result = 1;
		}
		return result;
	}
	
	private void deleteFiles(List<BookAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("/home/ubuntu/upload/comic_book/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("/home/ubuntu/upload/comic_book/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		});
		
	}
	
}
