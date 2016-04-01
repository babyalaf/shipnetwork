package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.MaTouMapper;
import com.pojo.MaTou;
import com.service.MaTouService;

@Service
public class MaTouServiceImpl implements MaTouService {
	
	@Autowired
	private MaTouMapper matouMapper;

	@Override
	public List<MaTou> getAll() {
		return matouMapper.getAll();
	}

	@Override
	public MaTou getMaTouByName(String Name) {
		// TODO Auto-generated method stub
		return matouMapper.getMaTouByName(Name);
	}

}
