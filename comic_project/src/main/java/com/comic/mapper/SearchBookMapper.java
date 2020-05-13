package com.comic.mapper;

import java.util.List;

import com.comic.model.BoardVO;
import com.comic.model.BookVO;
import com.comic.model.CriteriaVO;

public interface SearchBookMapper {
	
	/* public BoardVO read(String book_name); */
	public List<BookVO> getListWithPaging(CriteriaVO cri);
	
	public int getTotalCount(CriteriaVO cri);
  
  }
 