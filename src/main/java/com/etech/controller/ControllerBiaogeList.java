package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 表格下载列表
 * */
@Controller
public class ControllerBiaogeList {
	private static Log log = LogFactory.getLog(ControllerBiaogeList.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/biaogeList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//表格下载
		String hql="From TdataCenter dataCenter where dataCenter.type='28' order by id desc";
		@SuppressWarnings("unchecked")
		List<TdataCenter> biaogeList = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("biaogeList", biaogeList);
		
		return "dataChannel/biaogeList";
	}
}
