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
 * 国家法律法规列表
 * */
@Controller
public class ControllerCountryLawList {
	private static Log log = LogFactory.getLog(ControllerCountryLawList.class);
	@Resource
	private EtechService etechService;
	@RequestMapping(value = "/countryLawList", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		String hql="From TdataCenter as dataCenter where dataCenter.type='"+EtechGobal.countryLaw+"' order by dataCenter.editTime";
		 @SuppressWarnings("unchecked")
		List<TdataCenter> dataCenterList = (List<TdataCenter>)etechService.findListByHQL(hql, 20);
		 request.setAttribute("dataCenterList", dataCenterList);
		 log.debug("current controller is policyAdviceView !");
		return "policyAdvice/countryLawList";
	}
}
