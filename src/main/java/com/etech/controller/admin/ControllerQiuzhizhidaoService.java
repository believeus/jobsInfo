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
 * 求职指导
 * */
@Controller
@RequestMapping("/admin/qiuzhizhidaoService")
public class ControllerQiuzhizhidaoService extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 求职指导列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.qiuzhizhidaoService);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/service/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("jobGuide:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/qiuzhizhidaoService/list.jhtml";
	}
	
	/**
	 * 添加求职指导
	 * @return
	 */
	@RequiresPermissions("jobGuide:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.qiuzhizhidaoService);
		return "admin/service/add";
	}
	/**
	 * 编辑求职指导
	 * @return
	 */
	@RequiresPermissions("jobGuide:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.qiuzhizhidaoService);
		return "admin/service/edit";
	}
	
	/**
	 * 保存求职指导
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/qiuzhizhidaoService/list.jhtml";
	}
	/**
	 * 修改求职指导
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/qiuzhizhidaoService/list.jhtml";
	}
}
