package com.etech.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TentUser;
import com.etech.service.EtechService;

/**
 * 企业审核
 * */
@Controller
@RequestMapping("/admin/enterpriseAudit")
public class ControllerEnterpriseAudit {
	private static Log log = LogFactory.getLog(ControllerEnterpriseAudit.class);
	@Resource
	private EtechService etechService;
	/**
	 * 企业审核列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		//查询待审核的企业用户
		@SuppressWarnings("unchecked")
		List<TentUser> enterpriseTentUsers=(List<TentUser>)etechService.getListByProperty(TentUser.class, "status", "0");
		request.setAttribute("enterpriseTentUsers", enterpriseTentUsers);
		return "admin/enterpriseAudit/list";
	}
	
	@RequiresPermissions("enterpriseAudit:delete")
	@RequestMapping("/delete")
	public String delete(){
		return "";
	}
	/**
	 * 添加企业审核
	 * @return
	 */
	@RequiresPermissions("enterpriseAudit:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/enterpriseAudit/add";
	}
	/**
	 * 编辑企业审核
	 * @return
	 */
	@RequiresPermissions("enterpriseAudit:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		String id=request.getParameter("id");
		TentUser tentUsers=(TentUser)etechService.findObjectById(TentUser.class, Integer.parseInt(id));
		request.setAttribute("tentUsers", tentUsers);
		log.debug("current controller is editNewsView !");
		return "admin/enterpriseAudit/edit";
	}
	
	/**
	 * 保存企业审核
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(){
		
		return "redirect:/admin/enterpriseAudit/list.jhtml";
	}
	/**
	 * 修改企业审核
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TentUser formUser){
		TentUser entUser=(TentUser) etechService.findObjectById(TentUser.class,formUser.getId());
		formUser.setEditDate(System.currentTimeMillis());
		formUser.setRoles(entUser.getRoles());
		formUser.setRecruit(entUser.getRecruit());
		formUser.setImgVedios(entUser.getImgVedios());
		BeanUtils.copyProperties(formUser, entUser);
		etechService.saveOrUpdata(entUser);
		return "redirect:/admin/enterpriseAudit/list.jhtml";
	}
}
