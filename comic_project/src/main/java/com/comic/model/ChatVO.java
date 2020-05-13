package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	
	int chat_num;  	// 채팅 번호 
    int chat_roomnum;  	// 방 넘버
	String chat_id; // 채팅 아이디
	Date chat_time; 		// 채팅 시간
    String chat_onoff;// 실시간 접속상태
	String chat_content;// 채팅내용

}
