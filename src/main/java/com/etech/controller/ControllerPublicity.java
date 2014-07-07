package com.etech.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 公示公告详情
 * */
@Controller
public class ControllerPublicity {
	
	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/publicityInfo", method = RequestMethod.GET)
	public String publicityInfoView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		return "infoCenter/publicityInfo";
	}
	
	@RequestMapping(value = "/publicityList", method = RequestMethod.GET)
	public String publictityList(HttpServletRequest request) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		String hql="From TdataCenter dataCenter where dataCenter.type='2' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("datas", page);
		return "infoCenter/publicityList";
	}
}
