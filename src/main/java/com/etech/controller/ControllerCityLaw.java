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
 * 地方法律法规
 * */
@Controller
public class ControllerCityLaw {
	private static Log log = LogFactory.getLog(ControllerCityLaw.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cityLaw", method = RequestMethod.GET)
	public String policyAdviceView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> spceilas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("spceilas", spceilas);
		
		return "policyAdvice/cityLaw";
	}
}
