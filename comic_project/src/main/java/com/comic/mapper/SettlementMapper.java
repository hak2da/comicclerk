package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.ProductVO;

public interface SettlementMapper {
	public List<ProductVO> settlementList();

	public int settlementUpdate(@Param("num") int num, @Param("currentNum") int currentNum);

	public void settlementLossInsert(@Param("category") String category,
			@Param("errorNum") int errorNum, @Param("num") int num,@Param("pay") int pay);	
}