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
 * 幻灯片
 * */
@Controller("controllerAdminSlide")
@RequestMapping("/admin/slide")
public class ControllerSlide extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 幻灯片列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.slide);
		request.setAttribute("dataCenters",dataCenters);
		request.setAttribute("size",dataCenters.size());
		return "admin/slide/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("slide:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/slide/list.jhtml";
	}
	
	/**
	 * 添加幻灯片
	 * @return
	 */
	@RequiresPermissions("slide:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.slide);
		request.setAttribute("size",super.listDataInfo(request,EtechGobal.slide).size());
		return "admin/slide/add";
	}
	/**
	 * 编辑幻灯片
	 * @return
	 */
	@RequiresPermissions("slide:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.slide);
		return "admin/slide/edit";
	}
	
	/**
	 * 保存幻灯片
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/slide/list.jhtml";
	}
	/**
	 * 修改幻灯片
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/slide/list.jhtml";
	}
}
