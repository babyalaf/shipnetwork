package com.mapper;

import java.util.List;

import com.pojo.BarChart;

public interface BarChartMapper {

	List<BarChart> getFlowList(String year);
	
	List<BarChart> getPeccancyList(String year);
	
	List<BarChart> getAlarmList(String year);
	
	List<BarChart> getMonthAlarms(String month);
}
