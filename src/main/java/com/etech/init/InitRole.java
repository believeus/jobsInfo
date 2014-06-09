package com.etech.init;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.ServletContextAware;

import com.etech.entity.Trole;
import com.etech.service.EtechService;

/**
 * @author wuqiwei 当程序启动时调用onApplicationEvent方法并且注入servletContext对象
 */
@Component
public class InitRole implements ApplicationListener<ApplicationEvent>,
		ServletContextAware {
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
		Trole role = (Trole)etechService.findObjectByProperty(Trole.class, "roleName", "personalRole");
		if(StringUtils.isEmpty(role)){
			Trole personalRole=new Trole();
			personalRole.setRoleName("personalRole");
			etechService.saveOrUpdate(personalRole);
			log.debug("init personalRole");
		}
		role = (Trole)etechService.findObjectByProperty(Trole.class, "roleName", "enterpriseRole");
		if(StringUtils.isEmpty(role)){
			Trole enterpriseRole=new Trole();
			enterpriseRole.setRoleName("enterpriseRole");
			etechService.saveOrUpdate(enterpriseRole);
			log.debug("init enterpriseRole");
		}
		role = (Trole)etechService.findObjectByProperty(Trole.class, "roleName", "anonymousRole");
		if(StringUtils.isEmpty(role)){
			Trole anonymousRole=new Trole();
			anonymousRole.setRoleName("anonymousRole");
			etechService.saveOrUpdate(anonymousRole);
			log.debug("init anonymousRole");
		}
		
	
	
	}

	/* End Author:wuqiwei Date:2014-03-28 AddReason:初始化后台最高权限管理员 */
	@Override
	public void setServletContext(ServletContext servletContext) {
	}

}
