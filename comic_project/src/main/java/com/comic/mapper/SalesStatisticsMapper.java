package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.SalesStatisticsVO;

public interface SalesStatisticsMapper {

	public List<SalesStatisticsVO> productsalesData(@Param("year") String year);
	
	public List<SalesStatisticsVO> roomsalesData(@Param("year") String year);
	
	public List<SalesStatisticsVO> productsalesDayData(@Param("yearmonth") String yearmonth);
	
	public List<SalesStatisticsVO> roomsalesDayData(@Param("yearmonth") String yearmonth);

	public List<SalesStatisticsVO> productsales();
	
	public List<SalesStatisticsVO> roomsales();

	public List<SalesStatisticsVO> totalPrice();

	public List<SalesStatisticsVO> salesSearchList();

	public List<SalesStatisticsVO> salesSearchData(@Param("keyword")String keyword, @Param("numKeyword") int numKeyword);

	public List<SalesStatisticsVO> salesSearchDateData(@Param("start")String start, @Param("end")String end);

	public List<SalesStatisticsVO> totalMonthPrice();
}
