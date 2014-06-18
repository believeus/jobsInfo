package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 企业审核
 * */
@Controller
@RequestMapping("/admin/enterpriseAudit")
public class ControllerEnterpriseAudit {
	private static Log log = LogFactory.getLog(ControllerEnterpriseAudit.class);

	/**
	 * 企业审核列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/enterpriseAudit/list";
	}
	
	@RequiresPermissions("enterpriseAudit:delete")
	@RequestMapping("/delete")
	public String delete(){
		return "";
	}
	/**
	 * 添加企业审核
	 * @return
	 */
	@RequiresPermissions("enterpriseAudit:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/enterpriseAudit/add";
	}
	/**
	 * 编辑企业审核
	 * @return
	 */
	//@RequiresPermissions("enterpriseAudit:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/enterpriseAudit/edit";
	}
	
	/**
	 * 保存企业审核
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(){
		
		return "redirect:/admin/enterpriseAudit/list.jhtml";
	}
	/**
	 * 修改企业审核
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:/admin/enterpriseAudit/list.jhtml";
	}
}
