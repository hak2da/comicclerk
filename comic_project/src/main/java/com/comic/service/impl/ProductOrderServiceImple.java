package com.comic.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comic.mapper.ProductOrderMapper;
import com.comic.model.ProductOrderVO;
import com.comic.service.ProductOrderService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductOrderServiceImple implements ProductOrderService {
	
	private ProductOrderMapper mapper;

	@Override
	public List<ProductOrderVO> productOrderList() {
		return mapper.productOrderList();
	}
	
	@Transactional
	@Override
	public void productOrderRemove(int productOrder_num) {
		mapper.productOrderDelete(productOrder_num);
		int result = mapper.productOrderNumSelect(productOrder_num);
		if(result > 0) {
			for (int i = 0; i < result; i++) {
				mapper.productOrderNumUpdate(productOrder_num+1);
				productOrder_num++;
			}
		}
	}

	@Override
	public void productOrderRegister(ProductOrderVO vo) {
		mapper.productOrderInsert(vo);
	}

	@Override
	public ProductOrderVO productOrderGet(int productOrder_num) {
		return mapper.productRead(productOrder_num);
	}

	@Override
	public boolean productOrderModify(ProductOrderVO vo) {
		return mapper.productOrderUpdate(vo) == 1;
	}
	
	@Transactional
	@Override
	public void productOrderCheck(int productOrder_num) {
		mapper.productOrderCheck(productOrder_num);
		mapper.productOrderDelete(productOrder_num);
	}

}
