package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.SiteConfig;
import com.pojo.User;
import com.service.SiteConfigService;
import com.service.UserService;
import com.util.Common;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private SiteConfigService siteConfigService;

	@RequestMapping (value= "/logout",method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		Common.SCMAP = null;
		Common.SNMAP = null;
		return "redirect:/login.jsp";
	}
	
	@RequestMapping (value= "/login",method=RequestMethod.POST)
	public String login(String loginName,String password,HttpSession session){
		User u = userService.getUserByLoginName(loginName);
		if(null!=u){
			if(password.equals(u.getPassword())){
				session.setAttribute(Common.SESSION_USER, u);
				List<SiteConfig> list = siteConfigService.getSiteConfigList();
				Common.SCMAP = new HashMap<String, SiteConfig>();
				Common.SNMAP = new HashMap<String, String>();
				for(SiteConfig sc : list){
					Common.SCMAP.put(sc.getId(), sc);
					Common.SNMAP.put(sc.getId(), sc.getTag());
				}
				return "redirect:/index.jsp";
			}
		}
		return "redirect:/login.jsp";
	}
	
	@RequestMapping (value= "/userinfo",method=RequestMethod.POST)
	@ResponseBody
	public User getUserInfo(HttpSession session){
		return (User)session.getAttribute(Common.SESSION_USER);
	}
	
}
