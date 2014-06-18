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
 * 招聘会列表
 * */
@Controller
public class ControllerZhaopinhuiList {
	private static Log log = LogFactory.getLog(ControllerZhaopinhuiList.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/zhaopinhuiList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//招聘会
		String hql="From TdataCenter dataCenter where dataCenter.type='9'";
		List<TdataCenter> zhaopinhuiService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("zhaopinhuiService", zhaopinhuiService);
		
		return "occupationIntroduction/zhaopinhuiList";
	}
}
