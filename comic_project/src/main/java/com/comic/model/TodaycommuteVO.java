package com.comic.model;

import lombok.Data;

@Data
public class TodaycommuteVO {

	private String starttime; //출근시간
	private String endtime; //퇴근시간
	private String empname; //직원이름
	private String empnum; //직원사번
}
