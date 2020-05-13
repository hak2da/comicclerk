package com.comic.service;

import java.util.List;

import com.comic.model.BoardVO;
import com.comic.model.CriteriaVO;

public interface BoardService {
	
	public void register(BoardVO board); //湲��벑濡�
	
	public BoardVO get(Long board_num); // �옄�꽭�엳 蹂닿린
	
	public boolean modify(BoardVO board); // �닔�젙�븯湲�
	
	public boolean remove(Long board_num); // �궘�젣�븯湲�
	
	public List<BoardVO> getList(CriteriaVO cri); //�럹�씠吏� 泥섎━�맂 紐⑸줉蹂닿린
	
	public int getTotal(CriteriaVO cri); // �럹�씠吏뺤쓣 �쐞�븳 珥� �빀

}
