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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.TcomUser;
import com.etech.entity.TentUser;
import com.etech.entity.TbaseUser;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;
import com.etech.util.JsonOutToBrower;

/**Begin Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:用户登录业务逻辑 */
@Controller
public class ControllerLogin {
	private static final Log log = LogFactory.getLog(ControllerLogin.class);
	@Resource
	private EtechService userService;

	/**Begin Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:根据登录用户的类型,进行ajax登录验证 */
	@RequestMapping(value = "/ajaxLoginValid")
	public void ajaxLoginValid(TbaseUser user, String userType,HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> message=new HashMap<String, Object>();
		//登录用户名为空
		if(StringUtils.isEmpty(user.getLoginName())){
			message.put("message","请填写登录名");
			JsonOutToBrower.out(message, response);
		//登录用户名不为空
		}else {
			TbaseUser sessionUser=null;
			log.debug("current loginName:"+user.getLoginName());
			// 一般用户登录
			if (userType.equals("commonUser")) {
				sessionUser = (TcomUser) userService.findObjectByProperty(TcomUser.class, EtechGobal.loginName, user.getLoginName());
			// 企业级用户
			} else {
				sessionUser = (TentUser) userService.findObjectByProperty(TentUser.class, EtechGobal.loginName,user.getLoginName());
			}
			if (StringUtils.isEmpty(sessionUser)) {
				message.put("message", "用户不存在，请注册");
				log.debug("error loginName:" + user.getLoginName());
				JsonOutToBrower.out(message, response);
			}else if (sessionUser.getDisable()==1) { // 判断该用户是否被删除。
				message.put("message", "该用户已被删除，如有疑问请联系管理员");
				log.debug("error loginName:" + user.getLoginName());
				JsonOutToBrower.out(message, response);
			}else {
				/*用户名和密码都正确*/
				/*密码使用md5加密*/
				log.debug("origin password:"+user.getPassword());
				String password =DigestUtils.md5Hex(user.getPassword());
				log.debug("db user password:"+sessionUser.getPassword()+" form password:"+password);
				if (sessionUser.getPassword().equals(password)) {
					message.put("message","success");
					log.debug("login success");
					JsonOutToBrower.out(message, response);
				/*用户名正确密码不正确*/
				}else {
					log.debug("password unmatch !");
					if (StringUtils.isEmpty(user.getPassword())) {
						message.put("message", "请输入密码");
						JsonOutToBrower.out(message, response);
						return;
					}
					message.put("message", "用户密码错误");
					log.debug("error password");
					JsonOutToBrower.out(message, response);
				}
			}
		}
	}
	/**End Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:根据登录用户的类型,进行ajax登录验证 */
}
/**End Author:wuqiwei Data:2014-05-26 Email:1058633117@qq.com AddReason:用户登录业务逻辑 */