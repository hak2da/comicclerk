package com.comic.model;

import lombok.Data;

@Data
public class ProductVO {

	private int product_num;			//	PRODUCT_NUM NUMBER PRIMARY KEY,  -- 상품 번호
	private String product_name;		//	PRODUCT_NAME VARCHAR2(20) NOT NULL, -- 상품이름
	private int product_price;			// PRODUCT_PRICE NUMBER NOT NULL, -- 상품 판매가
	private int product_qty;			//	PRODUCT_QTY NUMBER NOT NULL, -- 상품 수량
	private String product_category;	//	PRODUCT_CATEGORY VARCHAR2(20) NOT NULL -- 상품 종류
	
}
