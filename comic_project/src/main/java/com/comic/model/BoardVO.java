package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long board_num;
    private String board_id;
    private String board_content;
    private Date board_date;
    private String board_title;

}
