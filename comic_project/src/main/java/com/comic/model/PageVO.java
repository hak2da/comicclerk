package com.comic.model;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVO {
	
	private int startPage; //페이지 시작번호 1,11, 21
	private int endPage; // 페이지 끝번호 10, 20, 30
	private boolean prev, next; // 이전 페이지, 다음 페이지
	
	private int total;
	private CriteriaVO cri;
	
	public PageVO(CriteriaVO cri, int total) {
		
	this.cri = cri;
	this.total = total;
	
	this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;

	this.startPage = this.endPage - 9;

	int realEnd =(int)(Math.ceil((total * 1.0)/ cri.getAmount()));
	
	if (realEnd < this.endPage) {
		this.endPage = realEnd;
	}
	
	this.prev = this.startPage > 1; 
	
	this.next = this.endPage < realEnd;
	
	}
	

}
