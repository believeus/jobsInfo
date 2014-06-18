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
 * 数据频道
 * */
@Controller
public class ControllerDataChannel {
	private static Log log = LogFactory.getLog(ControllerDataChannel.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/dataChannel", method = RequestMethod.GET)
	public String dataChanelView(HttpSession session) {
		
		//公告公示
		String hql="From TdataCenter dataCenter where dataCenter.type='2'";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("notices",notices );
		
		//专题
		hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("subjectReport", subjectReport);
		
		log.debug("current controller is dataChanelView !");
		return "dataChannel/dataChannel";
	}
}
