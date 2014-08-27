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
 * 工资指导价位
 * */
@Controller("controllerAdminWagePriceGuide")
@RequestMapping("/admin/wagePriceGuide")
public class ControllerWagePriceGuide extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 工资指导价位列表
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
		Page<?> page = super.pageDataInfo(request,EtechGobal.wagePriceGuide,pageable);
		request.setAttribute("dataCenters",page);
		return "admin/dataChannel/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("salaryGuide:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/wagePriceGuide/list.jhtml";
	}
	
	/**
	 * 添加工资指导价位
	 * @return
	 */
	@RequiresPermissions("salaryGuide:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.wagePriceGuide);
		return "admin/dataChannel/add";
	}
	/**
	 * 编辑工资指导价位
	 * @return
	 */
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.wagePriceGuide);
		return "admin/dataChannel/edit";
	}
	
	/**
	 * 保存工资指导价位
	 * @return
	 */
	@RequiresPermissions("salaryGuide:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/wagePriceGuide/list.jhtml";
	}
	/**
	 * 修改工资指导价位
	 * @return
	 */
	@RequiresPermissions("salaryGuide:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/wagePriceGuide/list.jhtml";
	}
}
