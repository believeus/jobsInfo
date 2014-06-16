package com.etech.controller.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.server.MydfsTrackerServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 新闻动态
 * */
@Controller
@RequestMapping("/admin/news")
public class ControllerNews extends ControllerCRUD{
	@Resource
	private EtechService etechService;
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	/**
	 * 新闻列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/newsList", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,0);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/news/list";
	}


	//删除新闻
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/news/newsList.jhtml";
	}

	/**
	 * 添加新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		//新闻动态
		request.setAttribute("type",EtechGobal.newsDinamic);
		return "admin/news/add";
	}

	/**
	 * 编辑新闻
	 * 
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
	 * 保存新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request) {
		super.savaDataInfo(request);
		return "redirect:/admin/news/newsList.jhtml";
	}


	/**
	 * 修改新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request) {
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/news/newsList.jhtml";
	}

	
}
