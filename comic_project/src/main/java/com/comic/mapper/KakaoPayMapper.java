package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.BillVO;

public interface KakaoPayMapper {
	public void insertroomSale(@Param("id") String id);

	public void insertproductSale(@Param("id") String id);

	public void resetRoom(@Param("id") String id);

	public void productUpdate(@Param("id") String id);
	
	public List<BillVO> billGetList(@Param("id") String id);
	
	public void productQtyUpdate(@Param("order_product_num") int order_product_num,@Param("order_qty") int order_qty);
}
