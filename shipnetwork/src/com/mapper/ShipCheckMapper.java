package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.ShipCheck;

public interface ShipCheckMapper {

	void add(ShipCheck shipCheck);
	
	void updateShipName(ShipCheck shipCheck);
	
	ShipCheck getById(String id);
	
	long getCountMonth(ShipCheck shipCheck);
	
	List<ShipCheck> getBjListMonth(@Param("shipCheck")ShipCheck shipCheck,@Param("start")int start,@Param("end")int end);
	
	List<ShipCheck> getBjListToday(String today);
	
	long getCount(ShipCheck shipCheck);
	
	List<ShipCheck> getList(@Param("shipCheck")ShipCheck shipCheck,@Param("start")int start,@Param("end")int end);
}
