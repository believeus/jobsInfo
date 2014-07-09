package com.etech.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 资料下载列表
 * */
@Controller
public class ControllerZiliaoList {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/ziliaoList", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		//资料下载
		String hql="From TdataCenter dataCenter where dataCenter.type='18' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("ziliaoList", page);
		
		return "dataChannel/xiazaizhongxinList";
	}
}
