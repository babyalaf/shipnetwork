package com.mapper;

import java.util.List;

import com.pojo.MaTou;

public interface MaTouMapper {

	MaTou getMaTouByName(String Name);
	
	List<MaTou> getAll();
	
}
