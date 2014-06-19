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
 * 求职者
 * */
@Controller
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
		return "admin/JobSeekers/list";
	}
	
	/**
	 * 删除
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
	/**
	 * 添加求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/JobSeekers/add";
	}
	/**
	 * 编辑求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/JobSeekers/edit";
	}
	
	/**
	 * 保存求职者
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
	/**
	 * 修改求职者
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
}
