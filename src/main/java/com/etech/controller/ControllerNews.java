package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 新闻详情
 * */
@Controller
public class ControllerNews {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/newsInfo", method = RequestMethod.GET)
	public String newsInfoView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter); 
		return "infoCenter/newsInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newsList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='0'";
		List<TdataCenter> news = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("notices", news);
		return "infoCenter/newsList";
	}
}
