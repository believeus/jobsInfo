package com.etech.controller.admin;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etech.entity.Tadmin;
import com.etech.entity.Tauthority;
import com.etech.entity.Trole;
import com.etech.service.EtechService;

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
	@RequestMapping(value = "/check_username", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUsername(String username) {
		return true;
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request) {
		String hql="from Trole";
		// 查询有哪些角色
		@SuppressWarnings("unchecked")
		List<?> roles = (List<Trole>)etechService.findObjectByList(hql);
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
		etechService.saveOrUpdate(admin);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(int id,HttpServletRequest request) {
		String hql="from Trole";
		// 查询有哪些角色
		@SuppressWarnings("unchecked")
		List<?> roles = (List<Trole>)etechService.findObjectByList(hql);
		request.setAttribute("roles", roles);
		Tadmin admin=(Tadmin)etechService.findObjectById(Tadmin.class, id);
		request.setAttribute("admin", admin);
		return "/admin/admin/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
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
		
		dbAdmin.setLoginName(editAdmin.getLoginName());
		dbAdmin.setPassword(editAdmin.getPassword());
		dbAdmin.setEmail(editAdmin.getEmail());
		dbAdmin.setRoles(roles);
		etechService.saveOrUpdate(dbAdmin);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<Tadmin> admins = (List<Tadmin>)etechService.findObjectList("From Tadmin", 1, 15, Tadmin.class);
		request.setAttribute("admins", admins);
		return "/admin/admin/list";
	}
	
}
