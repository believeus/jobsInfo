package com.etech.controller;

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
 * 表格下载详情
 * */
@Controller
public class ControllerBiaoge {
	private static Log log = LogFactory.getLog(ControllerBiaoge.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/biaoge", method = RequestMethod.GET)
	public String newsListView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		return "dataChannel/biaoge";
	}
}
