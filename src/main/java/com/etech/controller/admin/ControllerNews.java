package com.etech.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 新闻动态
 * */
@Controller("controllerAdminNews")
@RequestMapping("/admin/news")
public class ControllerNews {
	private static Log log = LogFactory.getLog(ControllerNews.class);

	/**
	 * 新闻列表
	 * @return
	 */
	@RequestMapping(value = "/newsList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "admin/news/list";
	}
	
	/**
	 * 添加新闻
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/news/add";
	}
	/**
	 * 编辑新闻
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/news/edit";
	}
	
	/**
	 * 保存新闻
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		
		return "redirect:list.jhtml";
	}
	/**
	 * 修改新闻
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView(){
		
		return "redirect:list.jhtml";
	}
}
