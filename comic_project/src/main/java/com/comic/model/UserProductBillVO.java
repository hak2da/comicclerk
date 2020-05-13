package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserProductBillVO {
	
	private Date order_time;
	private String product_name;
	private int order_qty;
	private int order_bill;
	
}
