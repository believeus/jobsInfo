package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 求职者
 * */
@Controller("controllerAdminJobSeekersList")
@RequestMapping("/admin/jobSeekersList")
public class ControllerJobSeekers {
	private static Log log = LogFactory.getLog(ControllerJobSeekers.class);

	/**
	 * 求职者列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/list";
	}
	
	/**
	 * 添加求职者
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/add";
	}
	/**
	 * 编辑求职者
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/edit";
	}
	
	/**
	 * 保存求职者
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:/admin/humanResources/list.jhtml";
	}
	/**
	 * 修改求职者
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:/admin/humanResources/list.jhtml";
	}
}
