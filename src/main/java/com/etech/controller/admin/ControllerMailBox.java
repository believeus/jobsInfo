package com.etech.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TmailBox;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

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
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		List<TmailBox> mailBoxList=(List<TmailBox>)etechService.getListByClass(TmailBox.class, 20);
		request.setAttribute("mailBoxList",mailBoxList);
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
	@RequiresPermissions("mailBox:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TmailBox mailBox=(TmailBox)etechService.findObjectById(TmailBox.class, id);
		request.setAttribute("mailBox", mailBox);
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
	public String updateNewsView(TmailBox mailBox){
		mailBox.setEditTime(System.currentTimeMillis());
		// 设置审核通过
		mailBox.setStatus("1");
		etechService.merge(mailBox);
		return "redirect:/admin/mailBox/list.jhtml";
	}
	@RequestMapping(value="/review")
	public String review(Integer id){
		//更改审核通过状态
		etechService.updata(TmailBox.class, "id", id, "status","1");
		return "redirect:/admin/mailBox/list.jhtml";
	}
}
