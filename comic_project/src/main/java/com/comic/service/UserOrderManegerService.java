package com.comic.service;

import java.util.List;
import java.util.Map;

import com.comic.model.OrderProductViewVO;
import com.comic.model.OrderVO;
import com.comic.model.OrderViewVO;
import com.comic.model.UserBillVO;
import com.comic.model.UserProductBillVO;

public interface UserOrderManegerService {
	
	public void registerCategory(OrderViewVO vo);
	
	public List<OrderViewVO> readCategory();
	
	public void updateCategory(OrderViewVO vo);
	
	public void deleteCategory(int number);
	
	public List<Map<String, Object>> readProduct(String category);
	
	public int productCheck(String productName);
	
	public void productInsert(String productName, OrderProductViewVO vo);

	public void productCategoryUpdate(OrderViewVO vo);

	public void porductCateoryAllDelete(int number);

	public void porductCateoryDelete(int number);

	public String getCategoryValue(int number);

	public void realTimeOrderAdd(List<OrderVO> orderList);
	
	public UserBillVO userBill(String id);
	
	public List<UserProductBillVO> userProductBill(String id);

}
