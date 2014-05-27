package com.etech.controller;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.etech.entity.TCommonUser;
import com.etech.entity.EnterpriseUser;
import com.etech.entity.TUser;
import com.etech.service.UserService;
import com.etech.util.EtechGobal;
import com.etech.util.JsonOutToBrower;

/**Begin Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:用户登录业务逻辑 */
@Controller
public class ControllerLogin {
	private static final Log log = LogFactory.getLog(ControllerLogin.class);
	@Resource
	private UserService userService;

	/**Begin Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:根据登录用户的类型,进行ajax登录验证 */
	@RequestMapping(value = "/ajaxLoginValid")
	public void ajaxLoginValid(TUser user, String userType,HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> message=new HashMap<String, Object>();
		//登录用户名为空
		if(user.getLoginName()==null){
			message.put("error", "error");
			message.put("errorLoginName","请填写登录名");
			JsonOutToBrower.out(message, response);
		//登录用户名不为空
		}else {
			TUser sessionUser=null;
			log.debug("current loginName:"+user.getLoginName());
			// 一般用户登录
			if (userType.equals("commonUser")) {
				sessionUser = (TCommonUser) userService.findObjectByProperty(TCommonUser.class, EtechGobal.LoginName, user.getLoginName());
			// 企业级用户
			} else {
				sessionUser = (EnterpriseUser) userService.findObjectByProperty(EnterpriseUser.class, EtechGobal.LoginName,user.getLoginName());
			}
			if (sessionUser == null) {
				message.put("error", "error");
				message.put("errorLoginName", "用户不存在，请注册");
				log.debug("error loginName:" + user.getLoginName());
				JsonOutToBrower.out(message, response);
			}else {
				/*用户名和密码都正确*/
				/*密码使用md5加密*/
				log.debug("origin password:"+user.getPassword());
				String password =DigestUtils.md5Hex(user.getPassword());
				log.debug("db user password:"+sessionUser.getPassword()+" form password:"+password);
				if (sessionUser.getPassword().equals(password)) {
					message.put("success","success");
					session.setAttribute("sessionUser",sessionUser);
					log.debug("current clazz:"+sessionUser.getClass().getName());
					session.setAttribute("clazz", sessionUser.getClass().getName());
					log.debug("login success");
					JsonOutToBrower.out(message, response);
				/*用户名正确密码不正确*/
				}else {
					message.put("error","error");
					message.put("errorPwd","用户密码错误");
					log.debug("error password");
					JsonOutToBrower.out(message, response);
				}
			}
		}
	}
	/**End Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:根据登录用户的类型,进行ajax登录验证 */
}
/**End Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:用户登录业务逻辑 */