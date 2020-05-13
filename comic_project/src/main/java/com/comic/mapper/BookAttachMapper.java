package com.comic.mapper;

import java.util.List;

import com.comic.model.BookAttachVO;

public interface BookAttachMapper {
	
	public void insert(BookAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BookAttachVO> findByBookName(String book_name);
	
	public void deleteAll(String book_name);
	
	public List<BookAttachVO> getOldFiles();
	
}
