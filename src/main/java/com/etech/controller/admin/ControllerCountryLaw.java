package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 国家法律法规
 * */
@Controller("controllerAdminCountryLaw")
@RequestMapping("/admin/countryLaw")
public class ControllerCountryLaw {
	private static Log log = LogFactory.getLog(ControllerCountryLaw.class);

	/**
	 * 国家法律法规列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/policyAdvice/list";
	}
	
	/**
	 * 添加国家法律法规
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/policyAdvice/add";
	}
	/**
	 * 编辑国家法律法规
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/policyAdvice/edit";
	}
	
	/**
	 * 保存国家法律法规
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:list.jhtml";
	}
	/**
	 * 修改国家法律法规
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:list.jhtml";
	}
}
