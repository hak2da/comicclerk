package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.WorkrecordVO;

public interface MngCalendarMapper {
	public List<WorkrecordVO> workrecordmonth(@Param("startday")String startday
			,@Param("endday") String endday,@Param("empnum") String empnum);

}
