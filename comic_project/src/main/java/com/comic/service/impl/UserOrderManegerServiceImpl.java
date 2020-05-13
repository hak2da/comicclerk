package com.comic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.UserOrderManegerMapper;
import com.comic.model.OrderProductViewVO;
import com.comic.model.OrderVO;
import com.comic.model.OrderViewVO;
import com.comic.model.UserBillVO;
import com.comic.model.UserProductBillVO;
import com.comic.service.UserOrderManegerService;

import lombok.Setter;

@Service
public class UserOrderManegerServiceImpl implements UserOrderManegerService{

	@Setter(onMethod_ = @Autowired)
	private UserOrderManegerMapper ordermapper;
	
	@Override
	public void registerCategory(OrderViewVO vo) {
		ordermapper.orderInsert(vo);
	}

	@Override
	public List<OrderViewVO> readCategory() {
		return ordermapper.orderSelect();
	}

	@Override
	public void updateCategory(OrderViewVO vo) {
		ordermapper.orderUpdate(vo);
	}

	@Override
	public void deleteCategory(int number) {
		ordermapper.orderDelete(number);
	}

	@Override
	public List<Map<String, Object>> readProduct(String category) {
		return ordermapper.orderProductSelect(category);
	}

	@Override
	public int productCheck(String productName) {
		return ordermapper.productCheck(productName);
	}

	@Override
	public void productInsert(String productName, OrderProductViewVO vo) {
		ordermapper.productInsert(productName, vo);
	}

	@Override
	public void productCategoryUpdate(OrderViewVO vo) {
		ordermapper.productCategoryUpdate(vo);
	}

	@Override
	public void porductCateoryAllDelete(int number) {
		ordermapper.porductCateoryAllDelete(number);
	}

	@Override
	public void porductCateoryDelete(int number) {
		ordermapper.porductCateoryDelete(number);
	}

	@Override
	public String getCategoryValue(int number) {
		return ordermapper.getCategoryValue(number);
	}

	@Override
	public void realTimeOrderAdd(List<OrderVO> orderList) {
		for (int i = 0; i < orderList.size(); i++) {
			ordermapper.realTimeOrderAdd(orderList.get(i));
		}
		
	}
	
	@Override
	public UserBillVO userBill(String id) {
		return ordermapper.userBill(id);
	}

	@Override
	public List<UserProductBillVO> userProductBill(String id) {
		return ordermapper.userProductBill(id);
	}

}
