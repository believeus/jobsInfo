package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 幻灯片
 * */
@Controller("controllerAdminSlide")
@RequestMapping("/admin/slide")
public class ControllerSlide {
	private static Log log = LogFactory.getLog(ControllerSlide.class);

	/**
	 * 幻灯片列表
	 * @return
	 */
	@RequestMapping(value = "/slideList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/slide/list";
	}
	
	/**
	 * 添加幻灯片
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/slide/add";
	}
	/**
	 * 编辑幻灯片
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/slide/edit";
	}
	
	/**
	 * 保存幻灯片
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:list.jhtml";
	}
	/**
	 * 修改幻灯片
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:list.jhtml";
	}
}
