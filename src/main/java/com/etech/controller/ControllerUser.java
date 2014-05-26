package com.etech.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.etech.entity.TCommonUser;
import com.etech.entity.EnterpriseUser;
import com.etech.service.CommonUserService;
import com.etech.service.EnterpriseUserService;

@Controller
public class ControllerUser {
	private static final Log log=LogFactory.getLog(ControllerUser.class);
	@Resource
	private CommonUserService commonUserService;
	@Resource
	private EnterpriseUserService enterpriseUserService;
	/**普通用户登录验证*/
	public String ajaxLoginValidComUser(){
		String result="";
		return result;
	}
	/**普通用户注册验证 */
	@RequestMapping(value="/ajaxRegValidComUser")
	public void ajaxRegValidComUser(String propertyValue,HttpServletResponse response) throws IOException{
		//技巧：将map转换成json避免字符拼接成json带来的麻烦
		Map<String,Object> map = new HashMap<String,Object>();
		JSONObject json=null;
		response.setContentType("text/html;charset=UTF-8");
		OutputStream out = response.getOutputStream();
		log.debug("current propertyValue:"+propertyValue);
		TCommonUser comUser=null;
		/*根据注册名查询该用户是否存在*/
		if (propertyValue!=null&&!"".equals(propertyValue)) {
			if (propertyValue.equalsIgnoreCase(TCommonUser.LoginName)) {
				// 用户登录名只能是英文
				propertyValue = propertyValue.trim();
				comUser= (TCommonUser) commonUserService.findObjectById(TCommonUser.class, TCommonUser.LoginName, propertyValue);
				if(comUser!=null){
					map.put("result", "用户名已经存在");
					json = JSONObject.fromObject(map);
					outToBrowser(out,json.toString());
					return;
				}else {
					map.put("result", "用户名可以使用");
					json = JSONObject.fromObject(map);
					outToBrowser(out,json.toString());
					return;
				}
			}
			/*根据注册身份证号查询该用户是否存在*/
			comUser = (TCommonUser) commonUserService.findObjectById(TCommonUser.class, "idcard", propertyValue);
			if (comUser!=null) {
				map.put("result", "iscardExist");
				json = JSONObject.fromObject(map);
				outToBrowser(out,json.toString());
				return;
			}
		}
		
		
	}
	/*关闭流*/
	private void outToBrowser(OutputStream out,String json) throws IOException{
		PrintWriter writer = new PrintWriter(out);
		writer.println(json.toString());
		writer.flush();
		writer.close();
		out.close();
	}
	/**企业用户注册验证*/
	public String ajaxRegEnterpriseComUser(){
		String result="";
		return result;
	}
	/**企业用户登录验证*/
	public void ajaxLoginValidEnterpriseUser(String propertyValue,String type,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		JSONObject json=null;
		response.setContentType("text/html;charset=UTF-8");
		OutputStream out = response.getOutputStream();
		log.debug("current propertyValue:"+propertyValue);
		TCommonUser comUser=null;
		if(propertyValue!=null&&!"".equals(propertyValue)){
			propertyValue=propertyValue.trim();
			// 用户名判断是否存在
			if(propertyValue.equalsIgnoreCase(TCommonUser.LoginName)){
				if (propertyValue.equalsIgnoreCase(TCommonUser.LoginName)) {
					// 用户登录名只能是英文
					propertyValue = propertyValue.trim();
					comUser= (TCommonUser) commonUserService.findObjectById(TCommonUser.class, TCommonUser.LoginName, propertyValue);
					if(comUser!=null){
						map.put("result", "可以登录");
						json = JSONObject.fromObject(map);
						outToBrowser(out,json.toString());
						return;
					}else {
						map.put("result", "用户名不存在,请注册");
						json = JSONObject.fromObject(map);
						outToBrowser(out,json.toString());
						return;
					}
			}
		}
	}
	/**一般用户注册*/
	@RenderMapping(value="/commonregister")
	public String commonuserReg(TCommonUser commonUser){
		commonUserService.saveOrUpdate(commonUser);
		String result="";
		return result;
	}
	/**企业用户注册*/
	@RenderMapping(value="/enterpriseregister")
	public String enterpriseReg(EnterpriseUser enterpriseUser){
		enterpriseUserService.saveOrUpdate(enterpriseUser);
		String result="";
		return result;
	}
}
