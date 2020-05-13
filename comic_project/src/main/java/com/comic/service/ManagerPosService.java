package com.comic.service;

import java.util.List;

import com.comic.model.*;

public interface ManagerPosService {
	public void start_room(String room_id,String room_num,String room_status);
	public void stop_room(String room_num);
	public List<RoomuseVO> roomuselist();
	public List<RoomuseVO> roomuselist2();
	public List<TodaycommuteVO> todaycommutelist(String todayformat);
	
}
