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
 * 月供给排行
 * */
@Controller("controllerAdminMonthSupplyList")
@RequestMapping("/admin/monthSupplyList")
public class ControllerMonthSupplyList extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 月供给排行列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.monthSupplyList);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/rankList/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("thisMonApply:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/monthSupplyList/list.jhtml";
	}
	
	/**
	 * 添加月供给排行
	 * @return
	 */
	@RequiresPermissions("thisMonApply:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.monthSupplyList);
		return "admin/rankList/add";
	}
	/**
	 * 编辑月供给排行
	 * @return
	 */
	@RequiresPermissions("thisMonApply:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.monthSupplyList);
		return "admin/rankList/edit";
	}
	
	/**
	 * 保存月供给排行
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/monthSupplyList/list.jhtml";
	}
	/**
	 * 修改月供给排行
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/monthSupplyList/list.jhtml";
	}
}
