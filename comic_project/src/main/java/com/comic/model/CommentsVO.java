package com.comic.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class CommentsVO {
	
	private int cmnt_num;
	private long board_num;
    private String cmnt_id;
    private String cmnt_content;
    private Date cmnt_date;
   
}
