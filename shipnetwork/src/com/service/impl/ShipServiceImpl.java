package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ShipCheckMapper;
import com.mapper.ShipPhotoMapper;
import com.pojo.ShipCheck;
import com.pojo.ShipPhoto;
import com.service.ShipService;

@Service
public class ShipServiceImpl implements ShipService {

	@Autowired
	private ShipCheckMapper shipCheckMapper;
	@Autowired
	private ShipPhotoMapper shipPhotoMapper;
	
	@Override
	public void addShipCheck(ShipCheck shipCheck) {
		shipCheckMapper.add(shipCheck);
	}

	@Override
	public void addShipPhoto(ShipPhoto shipPhoto) {
		shipPhotoMapper.add(shipPhoto);
	}

	@Override
	public void updateShipName(ShipCheck shipCheck) {
		shipCheckMapper.updateShipName(shipCheck);
	}

	@Override
	public ShipCheck getShipCheckById(String id) {
		return shipCheckMapper.getById(id);
	}

	@Override
	public List<ShipPhoto> getPhotosByShipId(String shipId) {
		return shipPhotoMapper.getPhotosByShipId(shipId);
	}

	@Override
	public long getCountMonth(ShipCheck shipCheck) {
		return shipCheckMapper.getCountMonth(shipCheck);
	}

	@Override
	public List<ShipCheck> getBjListMonth(ShipCheck shipCheck, int start, int end) {
		return shipCheckMapper.getBjListMonth(shipCheck, start, end);
	}

	@Override
	public List<ShipCheck> getBjListToday(String today) {
		return shipCheckMapper.getBjListToday(today);
	}

	@Override
	public long getCount(ShipCheck shipCheck) {
		return shipCheckMapper.getCount(shipCheck);
	}

	@Override
	public List<ShipCheck> getList(ShipCheck shipCheck, int start, int end) {
		return shipCheckMapper.getList(shipCheck, start, end);
	}

}
