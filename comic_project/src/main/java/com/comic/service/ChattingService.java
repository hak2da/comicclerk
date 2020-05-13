package com.comic.service;

import java.util.List;

import com.comic.model.ChatVO;

public interface ChattingService {

	public void chatAdd(ChatVO chatvo);
 
	public List<ChatVO> selectChat(int roomNum);

	public void deleteChat(int roomNum);

}
