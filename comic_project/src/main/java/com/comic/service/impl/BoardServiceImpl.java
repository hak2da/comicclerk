package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.BoardMapper;
import com.comic.model.BoardVO;
import com.comic.model.CriteriaVO;
import com.comic.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		//// TODO Auto-generated method stub
		log.info("\r\n#### register #####"+board);
		
		board.setBoard_title(board.getBoard_title().replaceAll("(?i)<", "&lt;"));
		board.setBoard_content(board.getBoard_content().replaceAll("(?i)<", "&lt;"));      
		board.setBoard_title(board.getBoard_title().replaceAll("(?i)'", "&#039;"));
		board.setBoard_content(board.getBoard_content().replaceAll("(?i)'", "&#039;"));
		
		mapper.insert(board);
		
		//원래 책에는 insertSelectKey를 이용하는데 그냥 insert문을 이용했다.
		
	}

	@Override
	public BoardVO get(Long board_num) {
		// TODO Auto-generated method stub
		
		log.info("\r\n#### get #####"+board_num);
		
		return mapper.read(board_num);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("\r\n#### modify #####"+board);
		
		board.setBoard_title(board.getBoard_title().replaceAll("(?i)<", "&lt;"));
	    board.setBoard_content(board.getBoard_content().replaceAll("(?i)<", "&lt;"));
		board.setBoard_title(board.getBoard_title().replaceAll("(?i)'", "&#039;"));
		board.setBoard_content(board.getBoard_content().replaceAll("(?i)'", "&#039;"));
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long board_num) {
		// TODO Auto-generated method stub
		
		log.info("\r\n#### remove #####"+board_num);
		mapper.AlsoDelete(board_num);
		return mapper.delete(board_num) == 1;
	}

	@Override
	public List<BoardVO> getList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		
		log.info("\r\n#### get list with criteria #####"+cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		
		log.info("\r\n#### get total count #####"+cri);
		
		return mapper.getTotalCount(cri);
	}

}
