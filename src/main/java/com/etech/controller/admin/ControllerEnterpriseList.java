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

import com.etech.entity.TentImgVedio;
import com.etech.entity.TentUser;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 企业列表
 * */
@Controller
@RequestMapping("/admin/enterpriseList")
public class ControllerEnterpriseList {
	private static Log log = LogFactory.getLog(ControllerEnterpriseList.class);
	
	@Resource
	private EtechService etechService;
	/**
	 * 企业列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		//查找审核列表
		List<Trecruit> userList=(List<Trecruit>) etechService.getListByProperty(TentUser.class, "status","1" , 20);
		request.setAttribute("enterpriseTentUsers",userList);
		return "admin/humanResources/list";
	}
	/**
	 * 删除 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("enterpriseList:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		return "redirect:/admin/enterpriseList/list.jhtml";
	}
	/**
	 * 添加企业
	 * @return
	 */
	@RequiresPermissions("enterpriseList:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/add";
	}
	/**
	 * 编辑企业
	 * @return
	 */
	@RequiresPermissions("enterpriseList:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		
		String id=request.getParameter("id");
		System.out.println(etechService+"=etechService");
		TentUser tentUsers=(TentUser)etechService.findObjectById(TentUser.class, Integer.parseInt(id));
		request.setAttribute("tentUsers", tentUsers);
		String hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+tentUsers.getId()+"  and info.type='2'";
		@SuppressWarnings("unchecked")
		List<TentImgVedio> Maps=(List<TentImgVedio>)etechService.findListByHQL(hql);
		request.setAttribute("Maps", Maps);
		log.debug("current controller is editNewsView !");
		
		return "admin/humanResources/edit";
	}
	
	/**
	 * 保存企业
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(){
		
		return "redirect:/admin/enterpriseList/list.jhtml";
	}
	/**
	 * 修改企业
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:/admin/enterpriseList/list.jhtml";
	}
}
