package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.ChattingMapper;
import com.comic.model.ChatVO;
import com.comic.service.ChattingService;

import lombok.Setter;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Setter(onMethod_ = @Autowired)
	private ChattingMapper chattingmapper;
	
	@Override
	public void chatAdd(ChatVO vo) {
		chattingmapper.chatAdd(vo);
	}

	@Override
	public List<ChatVO> selectChat(int roomNum) {
		return chattingmapper.chatSelect(roomNum);
	}

	@Override
	public void deleteChat(int roomNum) {
		chattingmapper.deleteChat(roomNum);
	}

}
