package com.comic.mapper;

import java.util.List;

import com.comic.model.BoardVO;
import com.comic.model.CriteriaVO;

public interface BoardMapper {
	
//	public List<CustomerBoardVO> getList();
	
	public void insert(BoardVO board);
	
//	public void insertSelectKey(CustomerBoardVO board);
	
	public int delete(Long board_num);
	
	public int AlsoDelete(Long board_num);
	
	public int update(BoardVO board);
	
	public BoardVO read(Long board_num);
	
	public List<BoardVO> getListWithPaging(CriteriaVO cri);
	
	public int getTotalCount(CriteriaVO cri);

}
