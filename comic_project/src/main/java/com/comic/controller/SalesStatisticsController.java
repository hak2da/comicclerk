package com.comic.controller;


import java.util.List;
import java.util.Map;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.model.LossVO;
import com.comic.model.SalesStatisticsVO;
import com.comic.service.SalesStatisticsService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/salesstatistics/")
@AllArgsConstructor
public class SalesStatisticsController {
	
	private SalesStatisticsService statisticsService;
	
	@GetMapping("saleslist")
	public String salesList() {
		return "salesstatistics/saleslist";
	}
	
	@GetMapping("salesdata")
	public ResponseEntity<List<SalesStatisticsVO>> salesData(){
		return new ResponseEntity<List<SalesStatisticsVO>>(statisticsService.salesList(), HttpStatus.OK);
	}
	
	@GetMapping("salesMonthdata")
	public ResponseEntity<List<SalesStatisticsVO>> salesMonthData(){
		return new ResponseEntity<List<SalesStatisticsVO>>(statisticsService.salesMonthList(), HttpStatus.OK);
	}
	
	@GetMapping("salesSearchdata")
	public ResponseEntity<List<SalesStatisticsVO>> salesSearchData(){
		return new ResponseEntity<List<SalesStatisticsVO>>(statisticsService.salesSearchList(), HttpStatus.OK);
	}
	
	@GetMapping("searchsales")
	public ResponseEntity<List<SalesStatisticsVO>> searchData(@RequestParam("type") String type, @RequestParam("keyword") String keyword){
		return new ResponseEntity<List<SalesStatisticsVO>>(statisticsService.salesSearchData(type, keyword), HttpStatus.OK);
	}
	
	@GetMapping("searchsalesDate")
	public ResponseEntity<List<SalesStatisticsVO>> searchDateData(@RequestParam("start") String start, @RequestParam("end") String end){
		return new ResponseEntity<List<SalesStatisticsVO>>(statisticsService.salesSearchDateData(start, end), HttpStatus.OK);
	}
	
	@GetMapping("salesstatisticslist")
	public String statisticsChartView() { // 매출 차트 통계 요청
		return "salesstatistics/statisticslist";
	}
	
	@GetMapping("getYearlist")
	public ResponseEntity<Map<String, List<String>>> statisticsYearShow(@RequestParam("year") String year){ //월 차트 데이터
		return new ResponseEntity<Map<String, List<String>>>(statisticsService.chartMonthData(year), HttpStatus.OK);
	}
	
	@GetMapping("getMonthlist")
	public ResponseEntity<Map<String, List<String>>> statisticsMonthShow(@RequestParam("year") String year, @RequestParam("month") String month){ //일 차트 데이터
		return new ResponseEntity<Map<String, List<String>>>(statisticsService.chartDayData(year, month), HttpStatus.OK);
	}
	
	@GetMapping("getProductlist")
	public ResponseEntity<Map<String,String>> statisticsProductShow() {
		return new ResponseEntity<Map<String, String>>(statisticsService.chartProduct(), HttpStatus.OK);
	}
	
	@GetMapping("getRoomlist")
	public ResponseEntity<Map<String,String>> statisticsRoomShow() {
		return new ResponseEntity<Map<String, String>>(statisticsService.chartRoom(), HttpStatus.OK);
	}
}
