package com.etech.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 供求分析报告
 * */
@Controller("controllerAdminAnalysisReport")
@RequestMapping("/admin/analysisreport")
public class ControllerAnalysisReport extends ControllerCRUD{
	private static Log log = LogFactory.getLog(ControllerAnalysisReport.class);

	@Resource
	private EtechService etechService;
	/**
	 * 供求分析报告列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,EtechGobal.analysisreport);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/dataChannel/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("requireAnalyseReport:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/dataChannel/list.jhtml";
	}
	
	/**
	 * 添加供求分析报告
	 * @return
	 */
	@RequiresPermissions("requireAnalyseReport:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.analysisreport);
		return "admin/dataChannel/add";
	}
	/**
	 * 编辑供求分析报告
	 * @return
	 */
	@RequiresPermissions("requireAnalyseReport:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.analysisreport);
		return "admin/dataChannel/edit";
	}
	
	/**
	 * 保存供求分析报告
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/dataChannel/list.jhtml";
	}
	/**
	 * 修改供求分析报告
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/dataChannel/list.jhtml";
	}
}
