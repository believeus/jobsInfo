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
 * 软件下载
 * */
@Controller
@RequestMapping("/admin/ruanjianDownLoad")
public class ControllerRuanjianDownLoad extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 软件下载列表
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
		Page<?> page = super.pageDataInfo(request,EtechGobal.ruanjian,pageable);
		request.setAttribute("dataCenters",page);
		return "admin/downLoad/list";
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
		return "redirect:/admin/ruanjianDownLoad/list.jhtml";
	}
	
	/**
	 * 添加软件下载
	 * @return
	 */
	@RequiresPermissions("requireAnalyseReport:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.ruanjian);
		return "admin/downLoad/add";
	}
	/**
	 * 编辑软件下载
	 * @return
	 */
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.ruanjian);
		return "admin/downLoad/edit";
	}
	
	/**
	 * 保存软件下载
	 * @return
	 */
	@RequiresPermissions("requireAnalyseReport:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfofordl(request);
		return "redirect:/admin/ruanjianDownLoad/list.jhtml";
	}
	/**
	 * 修改软件下载
	 * @return
	 */
	@RequiresPermissions("requireAnalyseReport:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfofordl(editDataCenter, request);
		return "redirect:/admin/ruanjianDownLoad/list.jhtml";
	}
}
