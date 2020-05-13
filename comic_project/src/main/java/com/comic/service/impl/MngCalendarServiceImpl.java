package com.comic.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.MngCalendarMapper;
import com.comic.model.WorkrecordVO;
import com.comic.service.MngCalendarService;

import lombok.Setter;

@Service
public class MngCalendarServiceImpl implements MngCalendarService {

	@Setter(onMethod_ = @Autowired)
	private MngCalendarMapper mngCalendarMapper;	
	
	@Override
	public List<WorkrecordVO> workrecordmonth(String startday, String endday, String empnum) {
		// TODO Auto-generated method stub
		return mngCalendarMapper.workrecordmonth(startday, endday, empnum);
	}
	


}
