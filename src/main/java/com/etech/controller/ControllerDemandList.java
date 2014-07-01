package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
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
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		// 每页多少行数据
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		String hql = "from Trecruit recruit left join fetch recruit.workType "+ "order by recruit.editTime desc";
		log.debug(hql);
		List<Trecruit> monthlyDemandList = (List<Trecruit>) etechService.findObjectList(hql, pageNo, pageSize, Trecruit.class);
		request.setAttribute("monthlyDemandList", monthlyDemandList);
		return "dataChannel/xuqiupaihangList";
	}
}
