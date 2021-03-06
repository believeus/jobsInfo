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
 * 局长信箱
 * */
@Controller("controllerAdminMailBox")
@RequestMapping("/admin/mailBox")
public class ControllerMailBox extends ControllerCRUD{
	@Resource
	private EtechService etechService;
	/**
	 * 局长信箱列表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) throws UnsupportedEncodingException {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = super.pageDataInfo(request,EtechGobal.mailBox,pageable);
		request.setAttribute("mailBoxList",page);
		request.setAttribute("size",page.getContent().size());
		return "/admin/mailBox/list";
	}
	
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("mailBox:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/mailBox/list.jhtml";
	}
	
	/**
	 * 添加局长信箱
	 * @return
	 */
	@RequiresPermissions("mailBox:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		request.setAttribute("type",EtechGobal.mailBox);
		return "admin/mailBox/add";
	}
	/**
	 * 编辑局长信箱
	 * @return
	 */
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter mailBox=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("mailBox", mailBox);
		request.setAttribute("type",EtechGobal.mailBox);
		return "admin/mailBox/edit";
	}
	
	/**
	 * 保存局长信箱
	 * @return
	 */
	@RequiresPermissions("mailBox:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/mailBox/list.jhtml";
	}
	/**
	 * 修改局长信箱
	 * @return
	 */
	@RequiresPermissions("mailBox:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter mailBox,HttpServletRequest request){
		super.updataDataInfo(mailBox, request);
		return "redirect:/admin/mailBox/list.jhtml";
	}
}
