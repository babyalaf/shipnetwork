package com.service;

import java.util.List;

import com.pojo.SiteConfig;

public interface SiteConfigService {
	
	List<SiteConfig> getSiteConfigList();
	
	void update(SiteConfig config);
}
