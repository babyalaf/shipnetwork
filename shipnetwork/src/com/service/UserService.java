package com.service;

import java.util.List;

import com.pojo.User;

public interface UserService {
	
	User getUserByLoginName(String loginName);
	
	List<User> getAll();
}
