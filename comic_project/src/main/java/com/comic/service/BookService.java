package com.comic.service;

import java.util.List;

import com.comic.model.BookAttachVO;
import com.comic.model.BookVO;

public interface BookService {
	
	public List<BookVO> bookGetList();
	
	public BookVO bookGet(String book_name);
	
	public void bookRegister(BookVO vo);
	
	public boolean bookModify(String book_name_change, BookVO vo);
	
	public boolean bookRemove(String book_name);
	
	public BookVO bookNameCheck(String book_name);
	
	public List<BookAttachVO> getAttachList(String book_name);
	
}
