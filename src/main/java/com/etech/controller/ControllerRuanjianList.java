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
 * 软件下载列表
 * */
@Controller
public class ControllerRuanjianList {
	private static Log log = LogFactory.getLog(ControllerRuanjianList.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/ruanjianList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//软件下载
		String hql="From TdataCenter dataCenter where dataCenter.type='29'";
		@SuppressWarnings("unchecked")
		List<TdataCenter> ruanjianList = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("ruanjianList", ruanjianList);
		
		return "dataChannel/ruanjianList";
	}
}
