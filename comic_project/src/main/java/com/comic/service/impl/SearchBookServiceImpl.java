package com.comic.service.impl;
 
import java.util.List;

import org.springframework.stereotype.Service;

import com.comic.mapper.SearchBookMapper;
import com.comic.model.BookVO;
import com.comic.model.CriteriaVO;
import com.comic.service.SearchBookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class SearchBookServiceImpl implements SearchBookService {
	
	private SearchBookMapper mapper;

	@Override
	public List<BookVO> searchGetList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		log.info("\r\n#### get list with criteria #####"+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int searchTotal(CriteriaVO cri) {
		log.info("\r\n#### searchTotal #####"+cri);
		return mapper.getTotalCount(cri);
	}

}
