package com.etech.controller.admin;

import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.etech.entity.Tauthority;
import com.etech.entity.Trole;
import com.etech.service.EtechService;

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
	@RequiresPermissions("admin:group")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<Trole> roles = (List<Trole>)etechService.findObjectList("from Trole", 1, 15, Trole.class);
		log.debug("role size:"+roles.size());
		request.setAttribute("roles", roles);
		return "admin/power/list";
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
		log.debug("current controller is newsListView !");
		return "admin/power/edit";
	}
	
	/**
	 * 保存权限
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(Trole role){
		Assert.assertNotSame("角色名必须填写","", role.getRoleName().trim());
		Assert.assertNotSame("角色描述名必须填写","", role.getDescription().trim());
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
			role.setAuthorities(authorities);
			etechService.saveOrUpdata(role);
		}
		
		return "redirect:list.jhtml";
	}
}
