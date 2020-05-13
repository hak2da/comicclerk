package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.ChatVO;

public interface ChattingMapper {

	public void chatAdd(ChatVO vo);
	
	public List<ChatVO> chatSelect(@Param("roomNum")int roomNum);

	public void deleteChat(@Param("roomNum")int roomNum);
}
