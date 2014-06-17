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
 * 地方相关文件列表
 * */
@Controller
public class ControllerCityFileList {
	private static Log log = LogFactory.getLog(ControllerCityFileList.class);
	@Resource
	private EtechService etechService;
	@RequestMapping(value = "/cityFileList", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		log.debug("current controller is policyAdviceView !");
		String hql="from TdataCenter as dataCenter where dataCenter.type='"+EtechGobal.countryFile+"' order by dataCenter.editTime desc";
		@SuppressWarnings("unchecked")
		List<TdataCenter>  dataCenterList=(List<TdataCenter>) etechService.findListByHQL(hql, 15);
		request.setAttribute("dataCenterList", dataCenterList);
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/cityFileList";
	}
}
