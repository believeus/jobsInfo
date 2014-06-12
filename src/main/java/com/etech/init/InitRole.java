package com.etech.init;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.etech.entity.Tadmin;
import com.etech.entity.Tauthority;
import com.etech.entity.Trole;
import com.etech.service.EtechService;

/**
 * @author wuqiwei 当程序启动时调用onApplicationEvent方法并且注入servletContext对象
 */
@Component
public class InitRole implements ApplicationListener<ApplicationEvent> {
	private static final Log log = LogFactory.getLog(InitRole.class);
	@Resource
	private EtechService etechService;

	public EtechService getEtechService() {
		return etechService;
	}

	public void setEtechService(EtechService etechService) {
		this.etechService = etechService;
	}

	/* Begin Author:wuqiwei Date:2014-03-28 AddReason:初始化后台最高权限管理员 */

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		//监听程序启动事件
		if(event instanceof ContextRefreshedEvent){
			Trole role = (Trole) etechService.findObjectByProperty(Trole.class,"roleName", "personal-role");
			// 创建个人用户角色
			if (StringUtils.isEmpty(role)) {
				role = new Trole();
				role.setRoleName("personal-role");
				role.setDescription("该角色可以访问个人相关信息");
				//给该用户初始化相关默认权限
				initAuthority(role);
				etechService.saveOrUpdate(role);
				log.debug("init personalRole");
			}
			// 创建企业用户角色
			role = (Trole) etechService.findObjectByProperty(Trole.class,"roleName", "enterprise-role");
			if (StringUtils.isEmpty(role)) {
				role = new Trole();
				role.setRoleName("enterprise-role");
				role.setDescription("该角色可以访问企业相关信息");
				//给该用户初始化相关默认权限
				initAuthority(role);
				etechService.saveOrUpdate(role);
				log.debug("init enterpriseRole");
			}
			// 创建匿名用户角色
			role = (Trole) etechService.findObjectByProperty(Trole.class,"roleName", "anonymous-role");
			if (StringUtils.isEmpty(role)) {
				role = new Trole();
				role.setRoleName("anonymous-role");
				role.setDescription("该角色没有任何权限");
				//给该用户初始化相关默认权限
				initAuthority(role);
				etechService.saveOrUpdate(role);
				log.debug("init anonymousRole");
			}
			// 创建超级管理员角色
			role = (Trole) etechService.findObjectByProperty(Trole.class,"roleName", "super-role");
			if (StringUtils.isEmpty(role)) {
				role = new Trole();
				role.setRoleName("super-role");
				role.setDescription("该角色拥有所有权限");
				Set<Tauthority> authorities = new HashSet<Tauthority>();
				// 给管理员设置所有权限
				Tauthority authority = new Tauthority();
				authority.setAuthName("*");
				etechService.saveOrUpdate(authority);
				authorities.add(authority);
				role.setAuthorities(authorities);
				etechService.saveOrUpdate(role);
				log.debug("init superAdminRole");
			}
			// 初始化一个后台管理员
			Tadmin admin = (Tadmin) etechService.findObjectByProperty(Tadmin.class,"loginName", "admin");
			if(StringUtils.isEmpty(admin)){
				admin=new Tadmin();
				admin.setLoginName("admin");
				String password="admin!@#";
				password=DigestUtils.md5Hex(password);
				admin.setPassword(password);
				admin.setCreateDate(System.currentTimeMillis());
				admin.setDescription("最高权限管理员,拥有管理网站的所有权限");
				role = (Trole) etechService.findObjectByProperty(Trole.class,"roleName", "super-role");
				Set<Trole> roles=new HashSet<Trole>();
				roles.add(role);
				admin.setRoles(roles);
				etechService.saveOrUpdate(admin);
			}
		}

	}

	private void initAuthority(Trole role) {
		// 给该角色设置权限
		Set<Tauthority> authorities = new HashSet<Tauthority>();
		// 该企业用户具有查看信息中心的权限
		Tauthority infocenter = new Tauthority();
		infocenter.setAuthName("infocenter:view");
		etechService.saveOrUpdate(infocenter);
		// 该用户具有查看工作指南的查看权限
		Tauthority workguide = new Tauthority();
		workguide.setAuthName("workguide:view");
		etechService.saveOrUpdate(workguide);
		// 该用户具有查看就业服务的查看权限
		Tauthority workservice = new Tauthority();
		workservice.setAuthName("workservice:view");
		etechService.saveOrUpdate(workservice);
		// 该用户具有政策咨询的查看权限
		Tauthority policyAdvice = new Tauthority();
		policyAdvice.setAuthName("policyAdvice:view");
		etechService.saveOrUpdate(policyAdvice);
		// 该用户具有查看数据频道的权限
		Tauthority dataChannel = new Tauthority();
		dataChannel.setAuthName("dataChannel:view");
		etechService.saveOrUpdate(dataChannel);
		// 该用户具有网上展示厅的权限
		Tauthority networkShow = new Tauthority();
		networkShow.setAuthName("networkShow:view");
		etechService.saveOrUpdate(networkShow);

		authorities.add(networkShow);
		authorities.add(dataChannel);
		authorities.add(policyAdvice);
		authorities.add(workservice);
		authorities.add(workguide);
		authorities.add(infocenter);
		role.setAuthorities(authorities);
	}

	/* End Author:wuqiwei Date:2014-03-28 AddReason:初始化后台最高权限管理员 */
}
