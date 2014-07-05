package com.etech.controller.admin;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 月需求排行
 * */
@Controller("controllerAdminMonthlyDemandList")
@RequestMapping("/admin/monthlyDemandList")
public class ControllerMonthlyDemandList extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 月需求排行列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		
		return "admin/rankList/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("thisMonRequire:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/monthlyDemandList/list.jhtml";
	}
	
	/**
	 * 添加月需求排行
	 * @return
	 */
	@RequiresPermissions("thisMonRequire:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.monthlyDemandList);
		return "admin/rankList/add";
	}
	/**
	 * 编辑月需求排行
	 * @return
	 */
	@RequiresPermissions("thisMonRequire:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.monthlyDemandList);
		return "admin/rankList/edit";
	}
	
	/**
	 * 保存月需求排行
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/monthlyDemandList/list.jhtml";
	}
	/**
	 * 修改月需求排行
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/monthlyDemandList/list.jhtml";
	}
}
