package com.service;

import java.util.List;

import com.pojo.MaTou;
import com.pojo.User;

public interface MaTouService {
	
	MaTou getMaTouByName(String Name);
	
	List<MaTou> getAll();
}
