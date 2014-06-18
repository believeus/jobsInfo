package com.etech.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 岗位
 * */
@Controller("controllerAdminStationList")
@RequestMapping("/admin/stationList")
public class ControllerStationList {
	private static Log log = LogFactory.getLog(ControllerStationList.class);

	/**
	 * 岗位列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/list";
	}
	@RequiresPermissions("stationList:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		return "redirect:/admin/jianlizhinanService/list.jhtml";
	}
	/**
	 * 添加岗位
	 * @return
	 */
	@RequiresPermissions("stationList:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/add";
	}
	/**
	 * 编辑岗位
	 * @return
	 */
	@RequiresPermissions("stationList:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/edit";
	}
	
	/**
	 * 保存岗位
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:/admin/humanResources/list.jhtml";
	}
	/**
	 * 修改岗位
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		return "redirect:/admin/humanResources/list.jhtml";
	}
}
