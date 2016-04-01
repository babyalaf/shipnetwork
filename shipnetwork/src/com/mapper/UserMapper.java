package com.mapper;

import java.util.List;

import com.pojo.User;

public interface UserMapper {

	User getUserByLoginName(String loginName);
	
	List<User> getAll();
	
}
