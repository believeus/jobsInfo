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
 * 地方相关文件
 * */
@Controller("controllerAdminCityFile")
@RequestMapping("/admin/cityFile")
public class ControllerCityFile extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 地方相关文件列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.cityFile);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/policyAdvice/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("localPolicyFile:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/cityFile/list.jhtml";
	}
	
	/**
	 * 添加地方相关文件
	 * @return
	 */
	@RequiresPermissions("localPolicyFile:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.cityFile);
		return "admin/policyAdvice/add";
	}
	/**
	 * 编辑地方相关文件
	 * @return
	 */
	@RequiresPermissions("localPolicyFile:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.cityFile);
		return "admin/policyAdvice/edit";
	}
	
	/**
	 * 保存地方相关文件
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/cityFile/list.jhtml";
	}
	/**
	 * 修改地方相关文件
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/cityFile/list.jhtml";
	}
}
