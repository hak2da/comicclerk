package com.comic.service.impl;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.ManagerPosMapper;
import com.comic.model.RoomuseVO;
import com.comic.model.TodaycommuteVO;
import com.comic.service.ManagerPosService;

import lombok.Setter;

@Service
public class ManagerPosServiceImpl implements ManagerPosService {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerPosMapper managerposMapper;		

	public void start_room(String roomuse_id, String roomuse_num, String roomuse_status) {
		managerposMapper.roomstart(roomuse_id, roomuse_num,roomuse_status);
	}

	public void stop_room(String roomuse_num) {
		managerposMapper.roomstop(roomuse_num);		
	}

	public List<RoomuseVO> roomuselist() {		
		return managerposMapper.roomuselist();
	}
	public List<RoomuseVO> roomuselist2() {		
		return managerposMapper.roomuselist2();
	}

	@Override
	public List<TodaycommuteVO> todaycommutelist(String todayformat) {
		// TODO Auto-generated method stub
		return managerposMapper.todaycommutelist(todayformat);
	}


	

	

}
