package com.etech.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 视频新闻
 * */
@Controller("controllerAdminVedioNews")
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
		List<?> dataCenters = super.listDataInfo(request,4);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/vedioNews/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 添加视频新闻
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.newsVideo);
		return "admin/news/add";
	}
	/**
	 * 编辑视频新闻
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		return "admin/news/edit";
	}
	
	/**
	 * 保存视频新闻
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:list.jhtml";
	}
	/**
	 * 修改视频新闻
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:list.jhtml";
	}
}
