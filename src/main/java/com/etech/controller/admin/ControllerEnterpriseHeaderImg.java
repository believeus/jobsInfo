package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 企业电子图
 * */
@Controller
@RequestMapping("/admin/enterpriseHeaderImg")
public class ControllerEnterpriseHeaderImg extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 企业电子图列表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/list")
	public String newsListView(HttpServletRequest request) throws UnsupportedEncodingException {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = super.pageDataInfo(request,EtechGobal.enterpriseHeaderImg,pageable);
		request.setAttribute("dataCenters",page);
		return "/admin/enterpriseHeaderImg/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("enterpriseHeaderImg:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/enterpriseHeaderImg/list.jhtml";
	}
	
	/**
	 * 添加企业电子图
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequiresPermissions("enterpriseHeaderImg:create")
	@RequestMapping(value = "/add")
	public String addNewsView(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setAttribute("type",EtechGobal.enterpriseHeaderImg);
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = super.pageDataInfo(request,EtechGobal.enterpriseHeaderImg,pageable);
		request.setAttribute("size",page.getTotal());
		return "admin/enterpriseHeaderImg/add";
	}
	/**
	 * 编辑企业电子图
	 * @return
	 */
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.enterpriseHeaderImg);
		return "admin/enterpriseHeaderImg/edit";
	}
	
	/**
	 * 保存企业电子图
	 * @return
	 */
	@RequiresPermissions("enterpriseHeaderImg:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/enterpriseHeaderImg/list.jhtml";
	}
	/**
	 * 修改企业电子图
	 * @return
	 */
	@RequiresPermissions("enterpriseHeaderImg:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/enterpriseHeaderImg/list.jhtml";
	}
}
