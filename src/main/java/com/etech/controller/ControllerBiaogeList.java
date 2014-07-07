package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 表格下载列表
 * */
@Controller
public class ControllerBiaogeList {
	private static Log log = LogFactory.getLog(ControllerBiaogeList.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/biaogeList", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		//表格下载
		String hql="From TdataCenter dataCenter where dataCenter.type='28' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("biaogeList", page);
		
		return "dataChannel/biaogeList";
	}
}
