package com.service;

import java.util.List;

import com.pojo.BarChart;

public interface BarChartService {

	List<BarChart> getBarChartList(int type);
	
	List<BarChart> getMonthAlarms();
}
