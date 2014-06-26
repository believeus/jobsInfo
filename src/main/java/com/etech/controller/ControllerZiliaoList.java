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
 * 资料下载列表
 * */
@Controller
public class ControllerZiliaoList {
	private static Log log = LogFactory.getLog(ControllerZiliaoList.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/ziliaoList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//资料下载
		String hql="From TdataCenter dataCenter where dataCenter.type='18'";
		@SuppressWarnings("unchecked")
		List<TdataCenter> ziliaoList = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("ziliaoList", ziliaoList);
		
		return "dataChannel/xiazaizhongxinList";
	}
}
