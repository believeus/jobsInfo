package com.etech.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
	public String newsListView(HttpServletRequest request) {
		// 查询新闻动态
		String hql="From TdataCenter center where center.type='"+EtechGobal.newsDinamic+"'";
		@SuppressWarnings("unchecked")
		List<?> dataCenters = (List<TdataCenter>)etechService.findObjectList(hql, 1, 15, TdataCenter.class);
		request.setAttribute("dataCenters",dataCenters);
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
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
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
		center.setCreateTime(System.currentTimeMillis());
		etechService.saveOrUpdate(center);
		return "redirect:/admin/news/newsList.jhtml";
	}

	/**
	 * 修改新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request) {
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
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, editDataCenter.getId());
		
		BeanUtils.copyProperties(editDataCenter, dataCenter);
		System.err.println(editDataCenter.getId());
		return "redirect:/admin/news/newsList.jhtml";
	}
}
