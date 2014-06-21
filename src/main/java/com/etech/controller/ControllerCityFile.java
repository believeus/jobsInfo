package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 地方相关文件
 * */
@Controller
public class ControllerCityFile {
	private static Log log = LogFactory.getLog(ControllerCityFile.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cityFile", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("data", dataCenter);
		
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> spceilas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		request.setAttribute("spceilas", spceilas);
		
		return "policyAdvice/cityFile";
	}
}
