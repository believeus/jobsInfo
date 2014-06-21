package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 网上展示厅
 * */
@Controller
public class ControllerOnlineShow {
	private static Log log = LogFactory.getLog(ControllerOnlineShow.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/onlineShow", method = RequestMethod.GET)
	public String onlineShowView(HttpServletRequest request) {
		log.debug("current controller is imgShowView !");
		
		//视频新闻
		String hql="From TdataCenter dataCenter where dataCenter.type='4'";
		List<TdataCenter> vedios = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("vedios", vedios);
		
		return "onlineShow/onlineShow";
	}
}
