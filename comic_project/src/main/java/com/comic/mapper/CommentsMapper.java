package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.CommentsVO;

public interface CommentsMapper {
	
	public int insert(CommentsVO vo);
	
	public List<CommentsVO> getList(@Param("board_num") Long board_num);
	
	public int delete (int cmnt_num);
	
	public int update(CommentsVO vo);
	
//	public int getCountByBOARD_NUM(Long BOARD_NUM);
	
	

}
