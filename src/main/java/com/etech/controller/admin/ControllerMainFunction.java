package com.etech.controller.admin;

import java.util.List;

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
 * 主要职能
 * */
@Controller("controllerAdminMainFunction")
@RequestMapping("/admin/mainFunction")
public class ControllerMainFunction extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 主要职能列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.mainFunction);
		request.setAttribute("dataCenters",dataCenters);
		request.setAttribute("size",dataCenters.size());
		return "admin/guide/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("mainDuty:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/mainFunction/list.jhtml";
	}
	
	/**
	 * 添加主要职能
	 * @return
	 */
	@RequiresPermissions("mainDuty:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.mainFunction);
		return "admin/guide/add";
	}
	/**
	 * 编辑主要职能
	 * @return
	 */
	@RequiresPermissions("mainDuty:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.mainFunction);
		return "admin/guide/edit";
	}
	
	/**
	 * 保存主要职能
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/mainFunction/list.jhtml";
	}
	/**
	 * 修改主要职能
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/mainFunction/list.jhtml";
	}
}
