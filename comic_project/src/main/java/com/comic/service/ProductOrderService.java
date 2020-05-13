package com.comic.service;

import java.util.List;

import com.comic.model.ProductOrderVO;

public interface ProductOrderService {
	
	public List<ProductOrderVO> productOrderList();
	
	public void productOrderRemove(int productOrder_num);
	
	public void productOrderRegister(ProductOrderVO vo);
	
	public ProductOrderVO productOrderGet(int productOrder_num);
	
	public boolean productOrderModify(ProductOrderVO vo);
	
	public void productOrderCheck(int productOrder_num);
	
}
