package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etech.entity.Tauthority;
import com.etech.entity.Trole;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

/**
 * 权限分组
 * */
@Controller("controllerAdminPower")
@RequestMapping("/admin/power")
public class ControllerPower {
	private static Log log = LogFactory.getLog(ControllerPower.class);
	@Resource
	private EtechService etechService;
	
	/**
	 * 权限列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("admin:group")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		String hql="FROM Trole role where role.disable=0 order by role.editDate desc";
		List<Trole> roles = (List<Trole>)etechService.findListByHQL(hql);
		log.debug("role size:"+roles.size());
		request.setAttribute("roles", roles);
		return "admin/power/list";
	}
	
	/**
	 * 检查用户名是否存在
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/check_rolename")
	public @ResponseBody String checkUsername(String roleName) throws UnsupportedEncodingException {
		roleName = URLDecoder.decode(roleName, "utf-8");
		Trole role = (Trole)etechService.findObjectByProperty(Trole.class, "roleName", roleName);
		if (!StringUtils.isEmpty(role)) {
			return "false";
		}
		return "true";
	}
	
	/**
	 * 添加权限
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/power/add";
	}
	/**
	 * 编辑权限
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(int id,HttpServletRequest request) {
		request.setAttribute("roleId", id);
		Trole role=(Trole)etechService.findObjectById(Trole.class, id);
		Set<Tauthority> authorities = role.getAuthorities(); 
		request.setAttribute("authorities",authorities );
		return "admin/power/edit";
	}
	
	/**
	 * 保存角色
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(Trole role){
		Assert.assertNotSame("角色名必须填写","", role.getRoleName().trim());
		Assert.assertNotSame("角色描述名必须填写","", role.getDescription().trim());
		role.setCreateDate(System.currentTimeMillis());
		role.setEditDate(System.currentTimeMillis());
		etechService.merge(role);
		return "redirect:list.jhtml";
	}
	/**
	 * 修改权限
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(HttpServletRequest request){
		String roleId = request.getParameter("roleId");	
		log.debug("roleId:"+roleId);
		Trole role=(Trole)etechService.findObjectById(Trole.class, Integer.parseInt(roleId));
		Assert.assertNotNull(role);
		etechService.delete(Tauthority.class, "role.id", Integer.parseInt(roleId));
		Set<Tauthority> authorities = role.getAuthorities();
		String[] authoritys = request.getParameterValues("authority");
		if(!StringUtils.isEmpty(authoritys)){
			for(String authName : authoritys){
				Tauthority auth=new Tauthority();
				log.debug("Tauthority:"+authName);
				auth.setAuthName(authName);
				// 保存关联关系
				auth.setRole(role);
				authorities.add(auth);
			}
			role.setEditDate(System.currentTimeMillis());
			role.setAuthorities(authorities);
			etechService.saveOrUpdata(role);
		}
		
		return "redirect:list.jhtml";
	}
	
	@RequiresPermissions("admin:groupDelete")
	@RequestMapping("/delete")
	public void delete(Long[] ids,HttpServletResponse response){
		String roleIds = Arrays.toString(ids).replace("[","(").replace("]", ")");
		String hql="update from Trole role set role.disable=1 where role.id in "+roleIds;
		log.debug(hql);
		//etechService.update(hql);
		hql="update from TbaseUser admin set admin.disable=1 where admin.roles.id in "+roleIds;
		log.debug(hql);
		etechService.update(hql);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", "success");
		JsonOutToBrower.out(map, response);
	}
}
