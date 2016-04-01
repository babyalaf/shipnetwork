package com.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.BarChartMapper;
import com.pojo.BarChart;
import com.service.BarChartService;

@Service
public class BarChartServiceImpl implements BarChartService{

	@Autowired
	private BarChartMapper barChartMapper;
	
	@Override
	public List<BarChart> getBarChartList(int type) {
		List<BarChart> list = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(new Date());
		if(type==0){//流量
			list = barChartMapper.getFlowList(year);
		}else if(type==1){//违章
			list = barChartMapper.getPeccancyList(year);
		}else if(type==2){//报警
			list = barChartMapper.getAlarmList(year);
		}
		return list;
	}

	@Override
	public List<BarChart> getMonthAlarms() {
		return barChartMapper.getMonthAlarms(new SimpleDateFormat("yyyy-MM").format(new Date()));
	}

}
