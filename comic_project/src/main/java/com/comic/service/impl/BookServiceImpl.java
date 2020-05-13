package com.comic.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comic.mapper.BookAttachMapper;
import com.comic.mapper.BookMapper;
import com.comic.model.BookAttachVO;
import com.comic.model.BookVO;
import com.comic.service.BookService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {
	
	private BookMapper mapper;
	
	private BookAttachMapper attachMapper;
	
	@Override
	public List<BookVO> bookGetList() {
		return mapper.bookGetList();
	}

	@Override
	public BookVO bookGet(String book_name) {
		BookVO vo = new BookVO();
		vo = mapper.bookRead(book_name);
		vo.setAttachList(attachMapper.findByBookName(book_name));
		return vo;
	}
	
	@Transactional
	@Override
	public void bookRegister(BookVO vo) {
		mapper.bookInsert(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		vo.getAttachList().forEach(attach -> {
			attach.setBook_name(vo.getBook_name());
			attachMapper.insert(attach);
		});
	}
	
	@Transactional
	@Override
	public boolean bookModify(String book_name_change, BookVO vo) {
		attachMapper.deleteAll(vo.getBook_name());
		boolean modifyResult = mapper.bookUpdate(vo) == 1;
		if(modifyResult && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setBook_name(book_name_change);
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean bookRemove(String book_name) {
		attachMapper.deleteAll(book_name);
		return mapper.bookDelete(book_name) == 1;
	}

	@Override
	public BookVO bookNameCheck(String book_name) {
		return mapper.bookNameCheck(book_name);
	}

	@Override
	public List<BookAttachVO> getAttachList(String book_name) {
		return attachMapper.findByBookName(book_name);
	}
	
}
