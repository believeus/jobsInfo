package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 求职指导列表
 * */
@Controller
public class ControllerQiuzhiList {
	private static Log log = LogFactory.getLog(ControllerQiuzhiList.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/qiuzhizhidaoList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//求职指导
		String hql="From TdataCenter dataCenter where dataCenter.type='26'";
		List<TdataCenter> jianlizhinanService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("jianlizhinanService", jianlizhinanService);
		
		return "occupationIntroduction/qiuzhizhidaoList";
	}
}
