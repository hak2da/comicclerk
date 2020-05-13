package com.comic.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LossVO {
//	LOSS_NUM NUMBER  DEFAULT 1, -- 로스 번호
//	LOSS_CATEGORY VARCHAR(20), --로스 종류 수입/지출
//	LOSS_QTY NUMBER, -- 로스 수량
//	LOSS_PAY NUMBER, --로스 가격,
//	LOSS_PRODUCT VARCHAR(20), --로스 상품
//	LOSS_DATE DATE --로스 날짜

	private int loss_num;
	private String loss_category;
	private int loss_qty;
	private int loss_pay;
	private String loss_product;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date loss_date;
}
