package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.LossMapper;
import com.comic.mapper.SettlementMapper;
import com.comic.model.LossVO;
import com.comic.service.LossService;

import lombok.Setter;

@Service
public class LossServiceImpl implements LossService {

	@Setter(onMethod_ = @Autowired)
	private LossMapper lossMapper;
	
	@Override
	public List<LossVO> lossList() {
		return lossMapper.lossList();
	}

	@Override
	public void lossRegister(LossVO vo) {
		
		if(vo.getLoss_category().equals("손실")) {
			vo.setLoss_pay(vo.getLoss_pay()*(-1)*vo.getLoss_qty());
		} else {
			vo.setLoss_pay(vo.getLoss_pay()*vo.getLoss_qty());
		}
	
		lossMapper.lossRegister(vo);
	}

	@Override
	public void lossRemove(int loss_num) {
		lossMapper.lossDelete(loss_num);
	}

	@Override
	public LossVO lossGet(int loss_num) {
		return lossMapper.lossRead(loss_num);
	}

	@Override
	public void lossModify(LossVO vo) {
		if(vo.getLoss_category().equals("손실")) {
			vo.setLoss_pay(vo.getLoss_pay()*(-1)*vo.getLoss_qty());
		} else {
			vo.setLoss_pay(vo.getLoss_pay()*vo.getLoss_qty());
		}
		lossMapper.lossUpdate(vo);
	}

}
