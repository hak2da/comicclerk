package com.comic.model;

import lombok.Data;

@Data
public class OrderProductViewVO {

	private int orderview_num;
	private String orderview_category;
	private int orderview_product_num;
	private String orderview_filename;
	private String orderview_uploadpath;
	private String orderview_uuid;

}
