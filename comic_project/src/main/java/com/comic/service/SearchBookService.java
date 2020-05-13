package com.comic.service;

import java.util.List;

import com.comic.model.BookVO;
import com.comic.model.CriteriaVO;

public interface SearchBookService {
	
	public List<BookVO> searchGetList (CriteriaVO cri); //페이징처리된 목록보기
	public int searchTotal(CriteriaVO cri);// 페이징처리를 위한 총 합
}
