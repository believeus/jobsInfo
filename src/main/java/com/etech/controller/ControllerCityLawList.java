package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 地方法律法规列表
 * */
@Controller
public class ControllerCityLawList {
	private static Log log = LogFactory.getLog(ControllerCityLawList.class);
	@Resource
	private EtechService etechService;
	@RequestMapping(value = "/cityLawList", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		log.debug("current controller is policyAdviceView !");
		String hql="from TdataCenter as dataCenter where dataCenter.type='"+EtechGobal.cityLaw+"' order by dataCenter.editTime desc";
		@SuppressWarnings("unchecked")
		List<TdataCenter>  dataCenterList=(List<TdataCenter>) etechService.findListByHQL(hql, 15);
		request.setAttribute("dataCenterList", dataCenterList);
		return "policyAdvice/cityLawList";
	}
}
