package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 职位需求排行列表
 * */
@Controller
public class ControllerDemandList {

	@Resource
	private EtechService etechService;
	private static Log log=LogFactory.getLog(ControllerDemandList.class);
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/xuqiupaihangList", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		// 当前页
		int pageNo=0;
		int pageSize=20;
		if(!StringUtils.isEmpty(request.getParameter("pageNo"))){
			 pageNo= Integer.parseInt(request.getParameter("pageNo"));
			
		}
		if(!StringUtils.isEmpty(request.getParameter("pageSize"))){
			 pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		// 每页多少行数据
		String hql = "from Trecruit recruit left join fetch recruit.workType "+ "group by FROM_UNIXTIME(recruit.editTime/1000, '%Y-%m') order by FROM_UNIXTIME(recruit.editTime/1000, '%Y-%m') desc";
		log.debug(hql);
		List<Trecruit> monthlyDemandList = (List<Trecruit>) etechService.findObjectList(hql, pageNo, pageSize, Trecruit.class);
		request.setAttribute("monthlyDemandList", monthlyDemandList);
		return "dataChannel/xuqiupaihangList";
	}
}
