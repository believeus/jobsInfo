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
 * "国家法律法规"
 * */
@Controller("controllerAdminCountryLaw")
@RequestMapping("/admin/countryLaw")
public class ControllerCountryLaw extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * "国家法律法规"列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfo(request,10);
		request.setAttribute("dataCenters",dataCenters);
		return "admin/policyAdvice/list";
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
	 * 添加"国家法律法规"
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.countryLaw);
		return "admin/policyAdvice/add";
	}
	/**
	 * 编辑"国家法律法规"
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		return "admin/policyAdvice/edit";
	}
	
	/**
	 * 保存"国家法律法规"
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:list.jhtml";
	}
	/**
	 * 修改"国家法律法规"
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:list.jhtml";
	}
}
