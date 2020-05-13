package com.comic.model;

import java.util.List;

import lombok.Data;

@Data
public class BookVO {
	
	private String book_name;			// 책이름
	private String book_loc;			// 책위치
	private String book_publisher;		// 책출판사
	private String book_writer;			// 책 저자
	private String book_content;		// 책 소개
	private String book_category;		// 책 분류
	private int book_lastbook;			// 마지막권
	private String book_status;			// 연재상태
	private String book_name_change;
	
	private List<BookAttachVO> attachList;	// 책 이미지
	
}
