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
 * 政策咨询
 * */
@Controller
public class ControllerPolicyAdvice {
	private static Log log = LogFactory.getLog(ControllerPolicyAdvice.class);
	@Resource
	private EtechService etechService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/policyAdvice", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		//国家法律法规
		List<TdataCenter> countryLawDataList = (List<TdataCenter>)etechService.getListByProperty(TdataCenter.class,"type", EtechGobal.countryLaw);
		request.setAttribute("countryLawDataList",countryLawDataList);
		//地方法律法规
		List<TdataCenter> cityLawDataList = (List<TdataCenter>) etechService.getListByProperty(TdataCenter.class,"type", EtechGobal.cityLaw);
		request.setAttribute("cityLawDataList", cityLawDataList);
		//国家相关文件
		List<TdataCenter> countryFileDataList=(List<TdataCenter>)etechService.getListByProperty(TdataCenter.class,"type", EtechGobal.countryFile);
		request.setAttribute("countryFileDataList", countryFileDataList);
		// 地方文件
		List<TdataCenter> cityFileDataList=(List<TdataCenter>)etechService.getListByProperty(TdataCenter.class, "type", EtechGobal.cityFile);
		request.setAttribute("cityFileDataList", cityFileDataList);
		return "policyAdvice/policyAdvice";
	}
}
