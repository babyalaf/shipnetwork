package com.mapper;

import java.util.List;

import com.pojo.ShipPhoto;

public interface ShipPhotoMapper {

	void add(ShipPhoto shipPhoto);
	
	List<ShipPhoto> getPhotosByShipId(String shipId);
}
