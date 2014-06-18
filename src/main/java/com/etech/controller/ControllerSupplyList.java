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
 * 职业供给排行列表
 * */
@Controller
public class ControllerSupplyList {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gongjipaihangList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//供给排行
		String hql="From TdataCenter dataCenter where dataCenter.type='17'";
		List<TdataCenter> monthSupplyList = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("monthSupplyList", monthSupplyList);
		
		return "dataChannel/gongjipaihangList";
	}
}
