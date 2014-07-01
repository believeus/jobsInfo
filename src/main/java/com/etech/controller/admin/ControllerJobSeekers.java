package com.etech.controller.admin;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomUser;
import com.etech.entity.TentUser;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

/**
 * 求职者
 * */
@Controller
@RequestMapping("/admin/jobSeekersList")
public class ControllerJobSeekers {
	private static Log log = LogFactory.getLog(ControllerJobSeekers.class);
	@Resource
	private EtechService etechService;
	/**
	 * 求职者列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		log.debug("current controller is admin/JobSeekers/list !");
		String hql="FROM TcomUser user where user.disable=0";
		@SuppressWarnings("unchecked")
		List<TcomUser> userList=(List<TcomUser>) etechService.findListByHQL(hql);
		request.setAttribute("userList", userList);
		return "admin/JobSeekers/list";
	}
	
	/**
	 * 删除 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:delete")
	@RequestMapping("/delete")
	public void removeNews(Long[] ids,HttpServletResponse response){
		System.out.println(ids);
		String userIds = Arrays.toString(ids).replace("[","(").replace("]", ")");
		String hql="update from TbaseUser user set user.disable=1 where user.id in "+userIds;
		log.debug(hql);
		etechService.update(hql);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", "success");
		JsonOutToBrower.out(map, response);
	}
	
	/**
	 * 添加求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/JobSeekers/add";
	}
	/**
	 * 编辑求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(int id,HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		TcomUser user=(TcomUser)etechService.findObjectById(TcomUser.class, id);
		request.setAttribute("user", user);
		return "admin/JobSeekers/edit";
	}
	
	/**
	 * 保存求职者
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
	/**
	 * 修改求职者
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(TcomUser formUser){
		log.debug("/admin/jobSeekersList/list.jhtml");
		log.debug(formUser.getWorkspace());
		TcomUser comUser=(TcomUser)etechService.findObjectById(TcomUser.class, formUser.getId());
		if(StringUtils.isEmpty(formUser.getPassword())){
			formUser.setPassword(comUser.getPassword());
		}else {
			formUser.setPassword(DigestUtils.md5Hex(formUser.getPassword()));
		}
		formUser.setRoles(comUser.getRoles());
		formUser.setComInfo(comUser.getComInfo());
		etechService.merge(formUser);
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
}
