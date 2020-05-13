package com.comic.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.LossMapper;
import com.comic.mapper.SalesStatisticsMapper;
import com.comic.model.LossVO;
import com.comic.model.SalesStatisticsVO;
import com.comic.service.SalesStatisticsService;

import lombok.Setter;

@Service
public class SalesStatisticsServiceImpl implements SalesStatisticsService {
	
	@Setter(onMethod_ = @Autowired)
	private SalesStatisticsMapper statisticsMapper;
	
	@Setter(onMethod_ = @Autowired)
	private LossMapper lossMapper;
	
	private List<String> monthList = monthLabel();
	private List<String> dayList = dayLabel();
	private String pattern = "yyyy-M-dd";
	private SimpleDateFormat simpleDataFormat = new SimpleDateFormat(pattern);
	
	@Override
	public Map<String, List<String>> chartMonthData(String year) { // 년도별 월 매출
		Map<String, List<String>> map = statistics(statisticsMapper.productsalesData(year),statisticsMapper.roomsalesData(year));
		return map;
	}
	
	@Override
	public Map<String, List<String>> chartDayData(String year, String month) { // 년도,월에 대한 일매출
		Map<String, List<String>> map = statisticsDay(statisticsMapper.productsalesDayData(year+month), statisticsMapper.roomsalesDayData(year+month));
		return map;
	}
	
	@Override
	public Map<String, String> chartProduct() {  // 상품 매출 TOP 5
		List<SalesStatisticsVO> list = statisticsMapper.productsales();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getProductsales_product(), Integer.toString(list.get(i).getProductsales_order_price()));
		}
		
		return map;
	}
	
	@Override
	public Map<String, String> chartRoom() {  // 방 매출
		List<SalesStatisticsVO> list = statisticsMapper.roomsales();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < list.size(); i++) {
			map.put(Integer.toString(list.get(i).getRoomsales_num()),Integer.toString(list.get(i).getRoomsales_totalprice()));
		}
		return map;
	}
	
	private Map<String, List<String>> statisticsDay(List<SalesStatisticsVO> productsalesDayData,
			List<SalesStatisticsVO> roomsalesDayData) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> dayprice = daytotal(dayList,simpleDataFormat,productsalesDayData, roomsalesDayData);
		
		map.put("day", dayList);
		map.put("dayprice", dayprice);
		
		return map;
	}

	private Map<String, List<String>> statistics(List<SalesStatisticsVO> productsalesData,
			List<SalesStatisticsVO> roomsalesData) { // 년도별 월 상품, 방매출 합계 데이터
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> monthprice = 
				monthtotal(monthList,simpleDataFormat,productsalesData,roomsalesData); // 1월부터 순차적으로 값 저장.. 리스트로
		
		
		map.put("month", monthList); // 월 차트 라벨(1~12)
		map.put("monthprice", monthprice); // 월별 매출액
			
		return map;
	}
	private List<String> daytotal(List<String> dayList, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> productsalesDayData, List<SalesStatisticsVO> roomsalesDayData) { // 년도 월별 일 상품, 방매출 합계 데이터
			String result = null;
			List<String> dayPrice = new ArrayList<String>();
			for (int i = 0; i < dayList.size(); i++) {
				int productDayTotal = dayproductTotalPrice(Integer.toString(i+1), simpleDataFormat, productsalesDayData);
				int roomTotal = dayroomTotalPrice(Integer.toString(i+1), simpleDataFormat, roomsalesDayData);
				result = Integer.toString(productDayTotal+roomTotal);
				dayPrice.add(result);
			}
		return dayPrice;
	}

	private List<String> monthtotal(List<String> monthList,SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> productsalesData, List<SalesStatisticsVO> roomsalesData) { // x월 전체 매출액
		String result = null;
		
		List<String> monthPrice = new ArrayList<String>();
		for (int i = 0; i < monthList.size(); i++) {
			int productTotal = monthproductTotalPrice(Integer.toString((i+1)), simpleDataFormat, productsalesData);
			int roomTotal = monthroomTotalPrice(Integer.toString((i+1)), simpleDataFormat, roomsalesData);
			result = Integer.toString(productTotal+roomTotal);
			monthPrice.add(result);
		}
		
		return monthPrice;
	}
	
	private int dayroomTotalPrice(String day, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> roomsalesDayData) {
		int total = 0;
		for (int i = 0; i < roomsalesDayData.size(); i++) {
			if(simpleDataFormat.format(roomsalesDayData.get(i).getRoomsales_time()).split("-")[2].equals("0"+day) || 
					simpleDataFormat.format(roomsalesDayData.get(i).getRoomsales_time()).split("-")[2].equals(day)) {
				total += roomsalesDayData.get(i).getRoomsales_totalprice();
			}
		}
		return total;
	}
	
	private int monthroomTotalPrice(String month, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> roomsalesData) { // 월 룸 매출액
		
			int total = 0;
		
		for (int i = 0; i < roomsalesData.size(); i++) {
			if(simpleDataFormat.format(roomsalesData.get(i).getRoomsales_time()).split("-")[1].equals(month)) { //.substring(5, 7) 월 ex) 09
				total += roomsalesData.get(i).getRoomsales_totalprice(); // total에 x월 룸 매출 금액 저장
			} 
		}
		return total;
	}
	
	private int dayproductTotalPrice(String day, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> productsalesDayData) {
		int total = 0;
		for (int i = 0; i < productsalesDayData.size(); i++) {
			if(simpleDataFormat.format(productsalesDayData.get(i).getProductsales_time()).split("-")[2].equals("0"+day) ||
					simpleDataFormat.format(productsalesDayData.get(i).getProductsales_time()).split("-")[2].equals(day)) {
				total += productsalesDayData.get(i).getProductsales_order_price();
			}
		}
		return total;
	}

	private int monthproductTotalPrice(String month, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> productsalesData) { //월 상품 매출액
		int total = 0;

		for (int i = 0; i < productsalesData.size(); i++) {
			if(simpleDataFormat.format(productsalesData.get(i).getProductsales_time()).split("-")[1].equals(month)) { //.substring(5, 7) 월 ex) 9
				total += (productsalesData.get(i).getProductsales_order_price()*productsalesData.get(i).getProductsales_qty());// total에 x월 상품판매 금액 저장
			} 
		}
		return total;
	}

	private List<String> monthLabel() { // 차트 월 라벨
		List<String> monthList = new ArrayList<String>();
		for (int i = 0; i < 12; i++) {
			monthList.add(Integer.toString(i+1));
		}
		return monthList;
	}
	
	private List<String> dayLabel() { // 차트 일 라벨
		List<String> dayList = new ArrayList<String>();
		for (int i = 0; i < 31; i++) {
			dayList.add(Integer.toString(i+1));
		}
		return dayList;
	}

	@Override
	public List<SalesStatisticsVO> salesList() {  // 매출 테이블
		return statisticsMapper.totalPrice();
	}
	

	@Override
	public List<SalesStatisticsVO> salesMonthList() {
		System.out.println(statisticsMapper.totalMonthPrice());
		return statisticsMapper.totalMonthPrice();
	}

	@Override
	public List<SalesStatisticsVO> salesSearchList() {
		return statisticsMapper.salesSearchList();
	}

	@Override
	public List<SalesStatisticsVO> salesSearchData(String type, String keyword) {
		int numKeyword = 0;
		
		if(type.equals("roomsales_num")) {
			numKeyword = Integer.parseInt(keyword);
		} else if (type.equals("all")) {
			if( isStringDouble(keyword)) { // 숫자일경우
				numKeyword = Integer.parseInt(keyword);
			}
		}
		
		return statisticsMapper.salesSearchData(keyword, numKeyword);
	}

	private boolean isStringDouble(String s) {
		try {
	        Double.parseDouble(s);
	        return true;
	    } catch (NumberFormatException e) {
	        return false;
	    }
	}

	@Override
	public List<SalesStatisticsVO> salesSearchDateData(String start, String end) {
		return statisticsMapper.salesSearchDateData(start, end);
	}
	
}
