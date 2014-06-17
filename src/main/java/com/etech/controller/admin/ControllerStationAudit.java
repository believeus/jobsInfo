package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 岗位审核
 * */
@Controller("controllerAdminStationAudit")
@RequestMapping("/admin/stationAudit")
public class ControllerStationAudit {
	private static Log log = LogFactory.getLog(ControllerStationAudit.class);

	/**
	 * 岗位审核列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/list";
	}
	
	/**
	 * 添加岗位审核
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/add";
	}
	/**
	 * 编辑岗位审核
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/edit";
	}
	
	/**
	 * 保存岗位审核
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:/admin/humanResources/list.jhtml";
	}
	/**
	 * 修改岗位审核
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:/admin/humanResources/list.jhtml";
	}
}
