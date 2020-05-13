package com.comic.service;

import java.util.List;

import com.comic.model.ProductVO;

public interface ProductService {
	
	public List<ProductVO> productGetList();
	
	public ProductVO productGet(int product_num);
	
	public void productRegister(ProductVO vo);
	
	public boolean productModify(ProductVO vo);
	
	public void productRemove(int product_num);
	
	public ProductVO productNameCheck(String product_name);
	
	public List<ProductVO> productCategory();
	
	public List<ProductVO> productCategoryName(String product_category);
	
}
