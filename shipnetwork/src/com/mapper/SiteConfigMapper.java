package com.mapper;

import java.util.List;

import com.pojo.SiteConfig;

public interface SiteConfigMapper {

	void update(SiteConfig config);
	
	List<SiteConfig> getAll();
}
