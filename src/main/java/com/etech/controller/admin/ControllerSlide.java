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
		Page<?> page = super.pageDataInfo(request,EtechGobal.slide,pageable);
		request.setAttribute("dataCenters",page);
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
	 * @throws UnsupportedEncodingException 
	 */
	@RequiresPermissions("slide:create")
	@RequestMapping(value = "/add")
	public String addNewsView(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setAttribute("type",EtechGobal.slide);
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = super.pageDataInfo(request,EtechGobal.slide,pageable);
		request.setAttribute("size",page.getTotal());
		return "admin/slide/add";
	}
	/**
	 * 编辑幻灯片
	 * @return
	 */

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
	@RequiresPermissions("slide:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfoforsd(request);
		return "redirect:/admin/slide/list.jhtml";
	}
	/**
	 * 修改幻灯片
	 * @return
	 */
	@RequiresPermissions("slide:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfoforsd(editDataCenter, request);
		return "redirect:/admin/slide/list.jhtml";
	}
}
