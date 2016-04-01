package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.SiteConfigMapper;
import com.pojo.SiteConfig;
import com.service.SiteConfigService;

@Service
public class SiteConfigServiceImpl implements SiteConfigService {

	@Autowired
	private SiteConfigMapper siteConfigMapper;
	
	@Override
	public List<SiteConfig> getSiteConfigList() {
		return siteConfigMapper.getAll();
	}

	@Override
	public void update(SiteConfig config) {
		siteConfigMapper.update(config);
	}

}
