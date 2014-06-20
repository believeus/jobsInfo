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
 * 政策咨询-搜索
 * */
@Controller
public class ControllerPolicyAdviceSearch {
	private static Log log = LogFactory.getLog(ControllerPolicyAdviceSearch.class);

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/policyAdviceSearch", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		
		//专题
		List<TdataCenter> subjectReport = this.findListByHQL(String.valueOf(EtechGobal.subjectReport));
		request.setAttribute("subjectReport", subjectReport);
		
		return "policyAdvice/policyAdviceSearch";
	}
	
	private List<TdataCenter> findListByHQL(String type){
		String hql="From TdataCenter as dataCenter where type='"+type+"' order by dataCenter.top,dataCenter.editTime desc";
		log.debug(hql);
		@SuppressWarnings("unchecked")
		List<TdataCenter> dataCenterList = (List<TdataCenter>)etechService.findListByHQL(hql, 6);
		return dataCenterList;
	}
}
