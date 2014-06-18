package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 职位需求排行列表
 * */
@Controller
public class ControllerDemandList {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/xuqiupaihangList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		//需求排行
		String hql="From TdataCenter dataCenter where dataCenter.type='16'";
		List<TdataCenter> monthlyDemandList = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("monthlyDemandList", monthlyDemandList);
		return "dataChannel/xuqiupaihangList";
	}
}
