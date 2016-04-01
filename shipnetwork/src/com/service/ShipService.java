package com.service;

import java.util.List;

import com.pojo.ShipCheck;
import com.pojo.ShipPhoto;

public interface ShipService {

	void addShipCheck(ShipCheck shipCheck);
	
	void addShipPhoto(ShipPhoto shipPhoto);
	
	void updateShipName(ShipCheck shipCheck);
	
	ShipCheck getShipCheckById(String id);
	
	List<ShipPhoto> getPhotosByShipId(String shipId);
	
	long getCountMonth(ShipCheck shipCheck);
	
	List<ShipCheck> getBjListMonth(ShipCheck shipCheck,int start,int end);
	
	List<ShipCheck> getBjListToday(String today);
	
	long getCount(ShipCheck shipCheck);
	
	List<ShipCheck> getList(ShipCheck shipCheck,int start,int end);
}
