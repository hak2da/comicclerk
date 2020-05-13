package com.comic.service;

import java.util.List;
import java.util.Map;

import org.springframework.util.MultiValueMap;

import com.comic.model.SalesStatisticsVO;


public interface SalesStatisticsService {

	public Map<String, List<String>> chartMonthData(String year);
	
	public Map<String, List<String>> chartDayData(String year,String month);
	
	public Map<String, String> chartProduct();

	public Map<String, String> chartRoom();

	public List<SalesStatisticsVO> salesList();

	public List<SalesStatisticsVO> salesSearchList();

	public List<SalesStatisticsVO> salesSearchData(String type, String keyword);

	public List<SalesStatisticsVO> salesSearchDateData(String start, String end);

	public List<SalesStatisticsVO> salesMonthList();
}
