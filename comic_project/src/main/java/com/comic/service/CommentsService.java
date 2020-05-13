package com.comic.service;

import java.util.List;

import com.comic.model.CommentsVO;

public interface CommentsService {
	
	public int register(CommentsVO vo); // 등록하기
	public int modify(CommentsVO vo); // 수정하기
	public int remove(int cmnt_num); // 삭제하기
	public List<CommentsVO> getList(Long board_num); // 목록보기

}
