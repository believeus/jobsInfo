package com.etech.controller.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etech.entity.Tadmin;
import com.etech.entity.TbaseUser;
import com.etech.entity.Trole;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

/**
 * Controller - 管理员
 * 
 * @author e3dmall Team
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class ControllerAdmin{
	private static final Log log=LogFactory.getLog(ControllerAdmin.class);
	@Resource
	private EtechService etechService;
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String admin(){
		return "admin/login";
	}

	/**
	 * 检查用户名是否存在
	 */
	@RequestMapping(value = "/check_username")
	public @ResponseBody String checkUsername(String loginName) {
		TbaseUser admin = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class, "loginName", loginName);
		if (!StringUtils.isEmpty(admin)) {
			return "false";
		}
		return "true";
	}

	/**
	 * 添加
	 */
	@RequiresPermissions("admin:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request) {
		String hql="from Trole role where role.disable = 0";
		// 查询有哪些角色
		@SuppressWarnings("unchecked")
		List<?> roles = (List<Trole>)etechService.findListByHQL(hql);
		request.setAttribute("roles", roles);
		return "/admin/admin/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Tadmin admin,int roleId) {
		Assert.assertNotSame("用户名不能为空", "", admin.getLoginName().trim());
		Trole role=(Trole)etechService.findObjectById(Trole.class, roleId);
		Set<Trole> roles=new HashSet<Trole>();
		roles.add(role);
		String password=DigestUtils.md5Hex(admin.getPassword());
		admin.setPassword(password);
		admin.setRoles(roles);
		admin.setCreateDate(System.currentTimeMillis());
		admin.setLastLoginData(System.currentTimeMillis());
		etechService.merge(admin);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequiresPermissions("admin:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(int id,HttpServletRequest request) {
		String hql="from Trole role where role.disable = 0";
		// 查询有哪些角色
		@SuppressWarnings("unchecked")
		List<?> roles = (List<Trole>)etechService.findListByHQL(hql);
		request.setAttribute("roles", roles);
		hql="from Tadmin admin left join fetch admin.roles where admin.id='"+id+"'";
		Tadmin admin=(Tadmin)etechService.findObjectByHql(hql);
		request.setAttribute("admin", admin);
		request.setAttribute("rolelist", new ArrayList<Trole>(admin.getRoles()));
		return "/admin/admin/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@RequiresPermissions("admin:modify")
	public String update(Tadmin editAdmin,int roleId) {
		log.debug("roleId:"+roleId);
		log.debug("loginName:"+editAdmin.getLoginName());
		Trole role=(Trole)etechService.findObjectById(Trole.class, roleId);
		log.debug("role.name:"+role.getRoleName());
		Tadmin dbAdmin =(Tadmin) etechService.findObjectById(Tadmin.class, editAdmin.getId());
		Set<Trole> roles = new HashSet<Trole>();
		roles.add(role);
		log.debug("editAdmin.getPassword():"+editAdmin.getPassword());
		if(StringUtils.isEmpty(editAdmin.getPassword()))
			editAdmin.setPassword(dbAdmin.getPassword());
		else{
			String password=DigestUtils.md5Hex(editAdmin.getPassword());
			editAdmin.setPassword(password);
		}
		dbAdmin.setEditDate(System.currentTimeMillis());
		dbAdmin.setLoginName(editAdmin.getLoginName());
		dbAdmin.setPassword(editAdmin.getPassword());
		dbAdmin.setEmail(editAdmin.getEmail());
		dbAdmin.setRoles(roles);
		etechService.merge(dbAdmin);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request) {
		String hql="FROM Tadmin admin where admin.disable=0 order by admin.editDate desc";
		List<Tadmin> admins = (List<Tadmin>)etechService.findListByHQL(hql);
		request.setAttribute("admins", admins);
		return "/admin/admin/list";
	}
	@RequiresPermissions("admin:delete")
	@RequestMapping("/delete")
	public void delete(Long[] ids,HttpServletResponse response){
		String userIds = Arrays.toString(ids).replace("[","(").replace("]", ")");
		String hql="update from TbaseUser user set user.disable=1 where user.id in "+userIds;
		log.debug(hql);
		etechService.update(hql);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", "success");
		JsonOutToBrower.out(map, response);
	}
}
