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
 * 视频新闻
 * */
@Controller
@RequestMapping("/admin/vedioNews")
public class ControllerVedioNews extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 视频新闻列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.newsVideo);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/vedioNews/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("newsVideo:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/vedioNews/list.jhtml";
	}
	
	/**
	 * 添加视频新闻
	 * @return
	 */
	@RequiresPermissions("newsVideo:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfoByTop(request,EtechGobal.newsVideo);
		request.setAttribute("size",dataCenters.size());
		request.setAttribute("type",EtechGobal.newsVideo);
		return "admin/vedioNews/add";
	}
	/**
	 * 编辑视频新闻
	 * @return
	 */
	@RequiresPermissions("newsVideo:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.newsVideo);
		return "admin/vedioNews/edit";
	}
	
	/**
	 * 保存视频新闻
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/vedioNews/list.jhtml";
	}
	/**
	 * 修改视频新闻
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/vedioNews/list.jhtml";
	}
	
	@RequestMapping(value="/vedioNewsTop")
	public String newsTop(int id){
		super.top(id);
		return "redirect:/admin/vedioNews/list.jhtml";
	}
	@RequestMapping(value="/unVedioNewsTop")
	public String unNewsTop(int id){
		super.unTop(id);
		return "redirect:/admin/vedioNews/list.jhtml";
	}
}
