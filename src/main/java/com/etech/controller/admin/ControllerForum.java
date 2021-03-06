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
 * 网站论坛
 * */
@Controller("controllerAdminForum")
@RequestMapping("/admin/forum")
public class ControllerForum extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 网站论坛列表
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = null;//super.listDataInfo(request,EtechGobal.forum);
		request.setAttribute("dataCenters",dataCenters);
		String searchValue = request.getParameter("searchValue");
		request.setAttribute("searchValue", searchValue);
		return "admin/forum/list";   
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("forum:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/forum/list.jhtml";
	}
	
	/**
	 * 添加网站论坛
	 * @return
	 */
	@RequiresPermissions("forum:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.forum);
		return "admin/forum/add";
	}
	/**
	 * 编辑网站论坛
	 * @return
	 */
	@RequiresPermissions("forum:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.forum);
		return "admin/forum/edit";
	}
	
	/**
	 * 保存网站论坛
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/forum/list.jhtml";
	}
	/**
	 * 修改网站论坛
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/forum/list.jhtml";
	}
}
