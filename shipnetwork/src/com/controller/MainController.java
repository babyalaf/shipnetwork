package com.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.BarChart;
import com.pojo.MaTou;
import com.pojo.ShipCheck;
import com.pojo.SiteConfig;
import com.pojo.User;
import com.service.BarChartService;
import com.service.MaTouService;
import com.service.ShipService;
import com.service.SiteConfigService;
import com.service.UserService;
import com.util.BjInfo;
import com.util.BootstrapTableResult;
import com.util.Common;
import com.util.JsonResult;

@Controller
public class MainController {
	
	@Autowired
	private ShipService shipService;
	@Autowired
	private BarChartService barChartService;
	@Autowired
	private SiteConfigService siteConfigService;
	@Autowired
	private UserService userService;
	@Autowired
	private MaTouService matouService;
	
	@RequestMapping (value= "/vcinfo",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult getVcInfo(HttpSession session){
		JsonResult jr = new JsonResult();
		SiteConfig sc = Common.SCMAP.get(session.getAttribute(Common.SESSION_TAG));
		jr.setObj(sc);
		jr.setCode(200);
		jr.setMsg("视频播放配置");
		return jr;
	}
	
	@RequestMapping (value= "/zdbj/{tag}",method=RequestMethod.GET)
	public String zdbj(@PathVariable String tag,HttpSession session){
		SiteConfig sc = Common.SCMAP.get(tag);
		session.setAttribute(Common.SESSION_TAG_NAME, sc.getTag());
		session.setAttribute(Common.SESSION_TAG, tag);
		return "redirect:/zdbj.jsp";
	}
	
	@RequestMapping (value= "/bjMonth",method=RequestMethod.GET)
	@ResponseBody
	public BootstrapTableResult bjMonth(HttpSession session, int limit, int offset, String search){
		BootstrapTableResult btr = new BootstrapTableResult();
		
		ShipCheck shipCheck = new ShipCheck();
		shipCheck.setSite(session.getAttribute(Common.SESSION_TAG).toString());
		shipCheck.setCheckTime(new SimpleDateFormat("yyyy-MM").format(new Date()));
		
		long cnt = shipService.getCountMonth(shipCheck);
		List<ShipCheck> list = shipService.getBjListMonth(shipCheck, offset, offset + limit);
		
		btr.setTotal(cnt);
		btr.setRows(list);
		return btr;
	}
	
	@RequestMapping (value= "/bjToday",method=RequestMethod.GET)
	@ResponseBody
	public BootstrapTableResult bjToday(){
		BootstrapTableResult btr = new BootstrapTableResult();
		List<BjInfo> infos = new ArrayList<BjInfo>();
		BjInfo bj = null;
		StringBuilder sb = new StringBuilder();
		List<ShipCheck> list = shipService.getBjListToday(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		for(ShipCheck sc : list){
			sb.setLength(0);
			if("0".equals(sc.getAis())){
				sb.append(" AIS异常 ");
			}else if("0".equals(sc.getReport())){
				sb.append(" 电子报港异常 ");
			}else if("1".equals(sc.getArrearage())){
				sb.append(" 有欠费 ");
			}else if("1".equals(sc.getOverdue())){
				sb.append(" 有过期签证 ");
			}else if("1".equals(sc.getPeccancy())){
				sb.append(" 有违章 ");
			}else if("1".equals(sc.getBlacklist())){
				sb.append(" 是黑名单船舶 ");
			}
			bj = new BjInfo();
			bj.setInfo(sb.toString());
			bj.setShip(sc.getName());
			bj.setSite(Common.SNMAP.get(sc.getSite()));
			infos.add(bj);
		}
		btr.setTotal(0);
		btr.setRows(infos);
		return btr;
	}
	
	@RequestMapping (value= "/barChart",method=RequestMethod.POST)
	@ResponseBody
	public List<BarChart> getBarChart(int type){
		return barChartService.getBarChartList(type);  //type:0流量 1违章 2报警
	}
	
	@RequestMapping (value= "/monthAlarm",method=RequestMethod.POST)
	@ResponseBody
	public List<BarChart> getMonthAlarms(){
		return barChartService.getMonthAlarms();
	}
	
	@RequestMapping (value= "/jcjl",method=RequestMethod.GET)
	@ResponseBody
	public BootstrapTableResult jcjl(int limit, int offset,ShipCheck shipCheck){
		BootstrapTableResult btr = new BootstrapTableResult();
		
		long cnt = shipService.getCount(shipCheck);
		List<ShipCheck> list = shipService.getList(shipCheck, offset, offset + limit);
		
		btr.setTotal(cnt);
		btr.setRows(list);
		return btr;
	}
	
	@RequestMapping (value= "/jkgl",method=RequestMethod.GET)
	@ResponseBody
	public BootstrapTableResult jkgl(){
		BootstrapTableResult btr = new BootstrapTableResult();
		List<SiteConfig> list = siteConfigService.getSiteConfigList();
		btr.setTotal(list.size());
		btr.setRows(list);
		return btr;
	}
	
	@RequestMapping (value= "/jkUpdate",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult jkUpdate(SiteConfig config){
		JsonResult jr = new JsonResult();
		siteConfigService.update(config);
		return jr;
	}
	
	@RequestMapping (value= "/zhgl",method=RequestMethod.GET)
	@ResponseBody
	public BootstrapTableResult zhgl(){
		BootstrapTableResult btr = new BootstrapTableResult();
		List<User> list = userService.getAll();
		btr.setTotal(list.size());
		btr.setRows(list);
		return btr;
	}
	
	@RequestMapping (value= "/mtgl",method=RequestMethod.GET)
	@ResponseBody
	public BootstrapTableResult mtgl(){
		BootstrapTableResult btr = new BootstrapTableResult();
		List<MaTou> list = matouService.getAll();
		btr.setTotal(list.size());
		btr.setRows(list);
		System.out.println(list);
		return btr;
	}
}
