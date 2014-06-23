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
import com.etech.entity.TmailBox;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 局长信箱
 * */
@Controller("controllerAdminMailBox")
@RequestMapping("/admin/mailBox")
public class ControllerMailBox extends ControllerCRUD{
	private static final Log log=LogFactory.getLog(ControllerMailBox.class);
	@Resource
	private EtechService etechService;
	/**
	 * 局长信箱列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<TmailBox> mailBoxList=(List<TmailBox>)etechService.getListByProperty(TmailBox.class, "status", "0", 20);
		log.debug("time:"+mailBoxList.get(0).getEditTime());
		request.setAttribute("mailBoxList",mailBoxList);
		return "admin/mailBox/list";
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
	@RequiresPermissions("mailBox:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.mailBox);
		return "admin/mailBox/edit";
	}
	
	/**
	 * 保存局长信箱
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/mailBox/list.jhtml";
	}
	/**
	 * 修改局长信箱
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/mailBox/list.jhtml";
	}
}
