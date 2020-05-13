package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int order_num; // 주문 번호
	private String order_id; // 주문 아이디
	private int order_roomnum; // 방번호
	private Date order_time; // 주문시간
	private int order_product_num;
	private int order_qty; // 수량
}
