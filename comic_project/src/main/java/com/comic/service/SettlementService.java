package com.comic.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comic.model.ProductVO;

public interface SettlementService {
	public List<ProductVO> settlementList();

	public boolean modify(String num, String currentNum, int stockNum);

	public Map<String, Object> settlementError(HashMap<String, Object> map);

	public void insertLoss(ProductVO product, String string);

}