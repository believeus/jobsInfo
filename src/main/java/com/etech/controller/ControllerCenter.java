package com.etech.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mydfs.storage.client.StorageClient;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.etech.entity.TcomInfo;
import com.etech.entity.TcomUser;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 中心
 * */
@Controller
public class ControllerCenter {
	private static Log log = LogFactory.getLog(ControllerCenter.class);
	
	@Resource
	private EtechService etechService;
	@Resource
	private StorageClient storageClient;
	/**个人中心*/
	@RequestMapping(value = "/common-user/center", method = RequestMethod.GET)
	public String personalCenter() {
		log.debug("current controller is personalCenter !");
		return "center/personalCenter";
	}
	
	/**企业中心*/
	@RequestMapping(value = "/enterprise-user/center", method = RequestMethod.GET)
	public String enterpriseCenter() {
		log.debug("current controller is enterpriseCenter !");
		return "center/enterpriseCenter";
	}
	/**信息中心*/
	@RequestMapping(value = "/infoCenter", method = RequestMethod.GET)
	public String infoCenter() {
		log.debug("current controller is infoCenterView !");
		return "infoCenter/infoCenter";
	}
	
	/**提交普通用户的编辑信息*/
	@RequestMapping(value="/common-user/center/submit-comInfo")
	public void submitComInfo(TcomInfo comInfo,HttpServletResponse response,HttpSession session){
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			TcomUser sessionUser = (TcomUser)session.getAttribute("sessionUser");
			comInfo.setComUser(sessionUser);
			etechService.saveOrUpdate(comInfo);
			map.put("message", "success");
		}catch(Exception ex){
			map.put("message", "error");
		}
	}
	
	/**提交招聘信息*/
	@RequestMapping(value="/enterprise-user/center/submit-recruit")
	public void submitRecruit(Trecruit recruit){
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			etechService.saveOrUpdate(recruit);
		map.put("message", "success");
		}catch(Exception ex){
			map.put("message", "error");
		}
	}
	@RequestMapping(value = "/upload", method = RequestMethod.POST,produces = "text/html; charset=UTF-8")
	public @ResponseBody String upload(HttpServletRequest request) {
		// 遍历有二进制文件的form表单
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				String fileName = file.getName();
				String fileSuffix=fileName.substring(fileName.lastIndexOf(".")+1);
				storepath=storageClient.upload(inputStream, fileSuffix);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return storepath;
	}
	
}
