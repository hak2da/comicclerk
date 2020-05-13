package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.RealOrderMapper;
import com.comic.model.RealOrderVO;
import com.comic.service.RealOrderService;

import lombok.Setter;

@Service
public class RealOrderServiceImpl implements RealOrderService {
	
	@Setter(onMethod_ = @Autowired)
	private RealOrderMapper realOrderMapper;
	
	@Override
	public List<RealOrderVO> realOrderData() {
		return realOrderMapper.realOrderData();
	}

}
