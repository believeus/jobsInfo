package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

@Controller
public class ControllerInfoCenter {
	@Resource
	private EtechService etechService;
	
	/** 信息中心 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/infoCenter", method = RequestMethod.GET)
	public String infoCenter(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='0'";
		List<TdataCenter> news = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='1'";
		List<TdataCenter> works = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='2'";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='3'";
		List<TdataCenter> imgs = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='4'";
		List<TdataCenter> vedios = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		session.setAttribute("news", news);// 新闻动态
		session.setAttribute("works", works);// 工作动态
		session.setAttribute("notices",notices ); // 公告公示
		session.setAttribute("imgs", imgs); // 图片新闻
		session.setAttribute("vedios", vedios);  // 视频新闻
		session.setAttribute("subjectReport", subjectReport); // 专题报道
		return "infoCenter/infoCenter"; 
	}
	
}
