package com.comic.service;

import java.util.List;

import com.comic.model.WorkrecordVO;

public interface MngCalendarService {
	public List<WorkrecordVO> workrecordmonth(String startday,String endday,String empnum);

}
