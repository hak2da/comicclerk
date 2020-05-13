package com.comic.service;

import java.util.List;

import com.comic.model.LossVO;

public interface LossService {
	public List<LossVO> lossList();

	public void lossRegister(LossVO vo);

	public void lossRemove(int loss_num);

	public LossVO lossGet(int loss_num);

	public void lossModify(LossVO vo);
}
