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
 * 面试宝典
 * */
@Controller
public class ControllerMianshibaodian {
	private static Log log = LogFactory.getLog(ControllerMianshibaodian.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/mianshibaodian", method = RequestMethod.GET)
	public String newsListView(HttpSession session,Integer id) {
		
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("subjectReport", subjectReport);
		
		return "occupationIntroduction/mianshibaodian";
	}
}
