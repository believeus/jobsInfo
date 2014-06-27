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
 * 面试宝典列表
 * */
@Controller
public class ControllerMianshibaodianList {
	private static Log log = LogFactory.getLog(ControllerMianshibaodianList.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mianshibaodianList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//面试宝典
		String hql="From TdataCenter dataCenter where dataCenter.type='25'";
		List<TdataCenter> jianlizhinanService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("jianlizhinanService", jianlizhinanService);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("subjectReport", subjectReport);
		
		return "occupationIntroduction/mianshibaodianList";
	}
}
