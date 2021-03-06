package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import javax.servlet.http.HttpSession;

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
import com.etech.util.Page;
import com.etech.util.Pageable;

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
	@RequiresPermissions("admin:create")
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
		admin.setEditDate(System.currentTimeMillis());
		admin.setLastLoginData(System.currentTimeMillis());
		etechService.merge(admin);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
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
	@RequiresPermissions("admin:modify")
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
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		Tadmin admin=(Tadmin)session.getAttribute("sessionUser");
		String hql="";
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		String searchValue = request.getParameter("searchValue");
		if (!StringUtils.isEmpty(searchValue)) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
			log.debug("------------------根据管理员名称查询："+searchValue);
			if(admin.getLoginName().equals("admin")){
			 hql="FROM Tadmin admin where admin.disable=0 and admin.loginName like '%"+searchValue+"%' order by admin.editDate desc";
			 //request.setAttribute("searchValue", searchValue);
			}else {
			  hql="FROM Tadmin admin where admin.disable=0 and admin.id='"+ admin.getId()+"'";
			 // request.setAttribute("searchValue", searchValue);
			}
		}else {
			// 只有管理员能看到其他管理员
			if(admin.getLoginName().equals("admin")){
				hql="FROM Tadmin admin where admin.disable=0  order by admin.editDate desc";
			// 其他管理员只能看到自己
			}else {
				hql="FROM Tadmin admin where admin.disable=0 and admin.id='"+admin.getId()+"'";
			}
		}
		//查询待审核的企业用户
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("admins", page);
		request.setAttribute("searchValue", searchValue);
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
