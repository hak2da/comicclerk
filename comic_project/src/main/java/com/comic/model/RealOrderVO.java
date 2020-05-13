package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class RealOrderVO {
	private int order_num;
	private String order_id;
	private int order_roomnum;
	private Date order_time;
	private int order_qty;
	private String product_name;
	private int product_price;
}
