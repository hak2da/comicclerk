package com.comic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.OrderProductViewVO;
import com.comic.model.OrderVO;
import com.comic.model.OrderViewVO;
import com.comic.model.UserBillVO;
import com.comic.model.UserProductBillVO;

public interface UserOrderManegerMapper {
	
	public void orderInsert(OrderViewVO vo);

	public List<OrderViewVO> orderSelect();
	
	public void orderUpdate(OrderViewVO vo);
	
	public void orderDelete(int number);
	
	public List<Map<String, Object>> orderProductSelect(String category);
	
	public int productCheck(String productName);

	public void productInsert(@Param("productName") String productName, @Param("vo") OrderProductViewVO vo);

	public void productCategoryUpdate(OrderViewVO vo);

	public void porductCateoryAllDelete(int number);

	public void porductCateoryDelete(int number);

	public String getCategoryValue(int number);

	public void realTimeOrderAdd(OrderVO orderVO);
	
	public UserBillVO userBill(String id);
	
	public List<UserProductBillVO> userProductBill(String id);

}
