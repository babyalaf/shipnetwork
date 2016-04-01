package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.util.BrokerResult;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private SimpMessagingTemplate template;
	
	@RequestMapping (value= "/mmsi",method=RequestMethod.GET)
	public String getMMSI(String siteId,String shipId,String mmsi,String direction,long time){
		return null;
	}
	
	
	@RequestMapping (value= "/photo",method=RequestMethod.GET)
	public String getPhoto(String shipId,long time,String url){
		return null;
	}
	
	
	@RequestMapping (value= "/videotape",method=RequestMethod.GET)
	public String getVideotape(String shipId,long startTime,long endTime){
		return null;
	}
	
	@RequestMapping (value= "/test",method=RequestMethod.GET)
	public void test(){
		template.convertAndSend("/broker/site", "厕所");
	}
	
	@RequestMapping (value= "/test1",method=RequestMethod.GET)
	public void brokerSite(){
		BrokerResult br = new BrokerResult();
		br.setSx(1);
		br.setXx(2);
		br.setZc(2);
		br.setYc(1);
		System.out.println("1");
		template.convertAndSend("/broker/site", br);
	}
}
