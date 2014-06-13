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

@Controller
public class ControllerInfoCenter {
	private static Log log=LogFactory.getLog(ControllerInfoCenter.class);
	
	@Resource
	private EtechService etechService;
	
	/** 信息中心 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/infoCenter", method = RequestMethod.GET)
	public String infoCenter(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='0'";
		List<TdataCenter> news = (List<TdataCenter>)etechService.findObjectByList(hql);
		for (TdataCenter tdataCenter : news) {
			System.out.println(tdataCenter.getId());
		}
		session.setAttribute("news", news);// 新闻动态
		return "infoCenter/infoCenter";
	}
}
