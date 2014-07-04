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
 * 国家相关文件列表
 * */
@Controller
public class ControllerCountryFileList {
	private static Log log = LogFactory.getLog(ControllerCountryFileList.class);
	@Resource
	private EtechService etechService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/countryFileList", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		String hql="from TdataCenter as dataCenter where dataCenter.type='"+EtechGobal.countryFile+"' order by dataCenter.editTime,dataCenter.id desc";
		List<TdataCenter>  dataCenterList=(List<TdataCenter>) etechService.findListByHQL(hql, 15);
		request.setAttribute("dataCenterList", dataCenterList);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> spceilas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		request.setAttribute("spceilas", spceilas);
		
		return "policyAdvice/countryFileList";
	}
}
