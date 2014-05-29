package com.etech.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomInfo;
import com.etech.entity.Trecruit;
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
	@RequestMapping(value = "/common-user/center", method = RequestMethod.GET)
	public String personalCenter() {
		log.debug("current controller is personalCenter !");
		return "center/personalCenter";
	}
	
	/**企业中心*/
	@RequestMapping(value = "/enterprise-user/center", method = RequestMethod.GET)
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
	
	/**提交普通用户的编辑信息*/
	@RequestMapping(value="/common-user/center/submit-comInfo")
	public void submitComInfo(TcomInfo comInfo,HttpServletResponse response){
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			etechService.saveOrUpdate(comInfo);
			map.put("message", "success");
		}catch(Exception ex){
			map.put("message", "error");
		}
	}
	
	/**提交招聘信息*/
	@RequestMapping(value="/enterprise-user/center/submit-recruit")
	public void submitRecruit(Trecruit recruit){
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			etechService.saveOrUpdate(recruit);
		map.put("message", "success");
		}catch(Exception ex){
			map.put("message", "error");
		}
	}
}
