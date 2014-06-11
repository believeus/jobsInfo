package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 上传文件管理
 * */
@Controller("controllerAdminUploadFile")
@RequestMapping("/admin/uploadFile")
public class ControllerUploadFile {
	private static Log log = LogFactory.getLog(ControllerUploadFile.class);

	/**
	 * 上传文件列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/uploadFile/list";
	}
	
	/**
	 * 保存上传文件
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:list.jhtml";
	}
}
