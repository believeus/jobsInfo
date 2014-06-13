package com.etech.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;

/**
 * 新闻动态
 * */
@Controller
@RequestMapping("/admin/news")
public class ControllerNews {
	private static Log log = LogFactory.getLog(ControllerNews.class);
	@Resource
	private EtechService etechService;
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	/**
	 * 新闻列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/newsList", method = RequestMethod.GET)
	public String newsListView() {
		
		return "admin/news/list";
	}

	/**
	 * 添加新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		//新闻动态
		request.setAttribute("type",EtechGobal.newsDinamic);
		return "admin/news/add";
	}

	/**
	 * 编辑新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/news/edit";
	}

	/**
	 * 保存新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				Assert.assertNotNull("upload file InputStream is null", inputStream);
				String fileName = file.getName();
				String extention = fileName.substring(fileName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix"+extention);
				storepath = mydfsTrackerServer.upload(inputStream, extention);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		TdataCenter center=new TdataCenter();
		int type=Integer.parseInt(request.getParameter("type"));
		String title=request.getParameter("title");
		String author=request.getParameter("author");
		String content=request.getParameter("content");
		center.setType(type);
		center.setTitle(title);
		center.setAuthor(author);
		center.setContent(content);
		center.setImgpath(storepath);
		etechService.saveOrUpdate(center);
		return "redirect:/admin/news/newsList.jhtml";
	}

	/**
	 * 修改新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateNewsView() {

		return "redirect:/admin/news/newsList.jhtml";
	}
}
