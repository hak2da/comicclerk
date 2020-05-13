package com.comic.mapper;

import java.util.List;

import com.comic.model.BookVO;

public interface BookMapper {
	
	public List<BookVO> bookGetList();
	
	public BookVO bookRead(String book_name);
	
	public void bookInsert(BookVO vo);
	
	public int bookUpdate(BookVO vo);
	
	public int bookDelete(String book_name);
	
	public BookVO bookNameCheck(String book_name);
	
}
