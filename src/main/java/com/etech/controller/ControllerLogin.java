package com.etech.controller;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.etech.entity.TCommonUser;
import com.etech.entity.EnterpriseUser;
import com.etech.service.CommonUserService;
import com.etech.service.EnterpriseUserService;
import com.etech.util.EtechGobal;
import com.etech.util.JsonOutToBrower;

/**Begin Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:用户登录业务逻辑 */
@Controller
public class ControllerLogin {
	private static final Log log = LogFactory.getLog(ControllerLogin.class);
	@Resource
	private CommonUserService commonUserService;
	@Resource
	private EnterpriseUserService enterpriseUserService;

	/**Begin Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:根据登录用户的类型,进行ajax登录验证 */
	@RequestMapping(value = "/ajaxLoginValid")
	public void ajaxLoginValid(String loginName,String userType,String password, HttpServletResponse response) throws Exception {
		log.debug("current loginName:" + loginName);
		if (loginName != null && !"".equals(loginName)) {
			Map<String, String> message=new HashMap<String, String>();
			message.put("error", "error");
			message.put("errorLoginName", "用户不存在，请注册");
			message.put("errorPwd", "用户密码错误");
			message.put("success", "success");
			Map<String, Object> jsonmap = new HashMap<String, Object>();
			Map<String, String> usermap=null;
			// 一般用户登录
			if (userType.equals("commonUser")) {
				TCommonUser commonuser = (TCommonUser) commonUserService.findObjectById(TCommonUser.class, EtechGobal.LoginName, loginName);
				if (commonuser!=null) {
					log.debug("TCommonUser:"+commonuser);
					usermap=new HashMap<String, String>();
					usermap.put("loginName", commonuser.getLoginName());
					usermap.put("password", commonuser.getPassword());
				}
				// 企业级用户
			} else {
				EnterpriseUser enterpriseuser = (EnterpriseUser) enterpriseUserService.findObjectById(TCommonUser.class, EtechGobal.LoginName,loginName);
				if (enterpriseuser!=null) {
					log.debug("EnterpriseUser:"+enterpriseuser);
					usermap=new HashMap<String, String>();
					usermap.put("loginName", enterpriseuser.getLoginName());
					usermap.put("password", enterpriseuser.getPassword());
				}
				
			}
			if (usermap == null) {
				jsonmap.put("error", message.get("error"));
				jsonmap.put("errorLoginName", message.get("errorLoginName"));
				log.debug("error loginName:" + loginName);
				JsonOutToBrower.out(jsonmap, response);
			}else {
				/*用户名和密码都正确*/
				if (usermap.get("password").equals(password)) {
					jsonmap.put("success", message.get("success"));
					log.debug("login success");
					JsonOutToBrower.out(jsonmap, response);
				/*用户名正确密码不正确*/
				}else {
					jsonmap.put("error", message.get("error"));
					jsonmap.put("errorPwd", message.get("errorPwd"));
					log.debug("error password");
					JsonOutToBrower.out(jsonmap, response);
				}
			}
		}
	}
	/**End Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:根据登录用户的类型,进行ajax登录验证 */
}
/**End Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:用户登录业务逻辑 */