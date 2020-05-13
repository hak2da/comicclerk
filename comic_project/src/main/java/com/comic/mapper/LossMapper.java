package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.LossVO;


public interface LossMapper {
	public List<LossVO> lossList();

	public void lossInsert(@Param("category") String category,@Param("errorNum") int errorNum, @Param("num") int num, @Param("pay") int pay);

	public void lossRegister(LossVO vo);

	public int lossDelete(int loss_num);

	public LossVO lossRead(int loss_num);

	public void lossUpdate(LossVO vo);
}
