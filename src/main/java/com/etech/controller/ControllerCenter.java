package com.etech.controller;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomInfo;
import com.etech.service.EtechService;

/**
 * 中心
 * */
@Controller
public class ControllerCenter {
	private static Log log = LogFactory.getLog(ControllerCenter.class);
	
	@Resource
	private EtechService etechService;
	/**个人中心*/
	@RequestMapping(value = "/personalCenter", method = RequestMethod.GET)
	public String personalCenter() {
		log.debug("current controller is personalCenter !");
		return "center/personalCenter";
	}
	/**企业中心*/
	@RequestMapping(value = "/enterpriseCenter", method = RequestMethod.GET)
	public String enterpriseCenter() {
		log.debug("current controller is enterpriseCenter !");
		return "center/enterpriseCenter";
	}
	/**信息中心*/
	@RequestMapping(value = "/infoCenter", method = RequestMethod.GET)
	public String infoCenter() {
		log.debug("current controller is infoCenterView !");
		return "infoCenter/infoCenter";
	}
	/*提交普通用户的编辑信息*/
	@RequestMapping(value="/submitTcomInfo")
	public void submitTcomInfo(TcomInfo comInfo){
		etechService.saveOrUpdate(comInfo);
	}
}
