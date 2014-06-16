package com.etech.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.etech.entity.TcomInfo;
import com.etech.entity.TcomUser;
import com.etech.entity.TentUser;
import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

/**
 * 中心
 * */
@Controller
public class ControllerCenter {
	private static Log log = LogFactory.getLog(ControllerCenter.class);

	@Resource
	private EtechService etechService;
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	/** 个人中心:该用户需要有personalRole角色才能访问 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/common-user/center", method = RequestMethod.GET)
	public String personalCenter(HttpSession session) {
		TcomUser sessionUser = (TcomUser) session.getAttribute("sessionUser");
		String hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='1' and user.id='"+sessionUser.getId()+"'";
		List<TcomUser> skills = (List<TcomUser>)etechService.findObjectByList(hql);
		hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='2' and user.id='"+sessionUser.getId()+"'";;
		List<TcomUser> learnings = (List<TcomUser>)etechService.findObjectByList(hql);
		hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='3' and user.id='"+sessionUser.getId()+"'";;
		List<TcomUser> works = (List<TcomUser>)etechService.findObjectByList(hql);
		hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='4' and user.id='"+sessionUser.getId()+"'";;
		List<TcomUser> volunteers = (List<TcomUser>)etechService.findObjectByList(hql);
		session.setAttribute("skills", skills);// 具备技能
		session.setAttribute("learnings", learnings);// 学习经历
		session.setAttribute("works", works);// 工作经验
		session.setAttribute("volunteers", volunteers);// 选择志愿
		return "center/personalCenter";
	}

	/** 进入企业中心:该用户需要有enterpriseRole角色才能访问 */
	@RequestMapping(value = "/enterprise-user/center", method = RequestMethod.GET)
	public String enterpriseCenter() {
		log.debug("current controller is enterpriseCenter !");
		return "center/enterpriseCenter";
	}


	/** 一般用户信息提交 */
	@RequestMapping(value = "/common-user/submit-account-Info")
	public void submitComUserInfo(TcomUser comUser, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			etechService.merge(comUser);
			map.put("message", "success");
		} catch (Exception ex) {
			map.put("message", "error");
			JsonOutToBrower.out(map, response);
		}
	}

	/** 提交普通用户的编辑信息 */
	@RequestMapping(value = "/common-user/center/submit-comInfo")
	public void submitComInfo(TcomInfo comInfo, Integer workTypeId,
			Integer majorTypeId,HttpServletResponse response,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			TcomUser sessionUser = (TcomUser) session.getAttribute("sessionUser");
			comInfo.setComUser(sessionUser);
			if (workTypeId != null) {
				TmajorType workType = (TmajorType) etechService.findObjectById(TmajorType.class, 1);
				comInfo.setWorkType(workType);
			}
			if (majorTypeId != null) {
				TmajorType majorType = (TmajorType) etechService.findObjectById(TmajorType.class, 2);
				comInfo.setMajorType(majorType);
			}
			etechService.merge(comInfo);
			map.put("message", "success");
		} catch (Exception ex) {
			ex.printStackTrace();
			map.put("message", "error");
		}
	}
	
	/** 一般用户信息删除 */
	@RequestMapping(value = "/common-user/submit-deleteids")
	public void submitDeleteIds(String ids, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String[]  splitIds= ids.split(",");
			for (String id : splitIds) {
				etechService.deleteObjectById(TcomInfo.class, Integer.valueOf(id));
			}
			map.put("message", "success");
		} catch (Exception ex) {
			ex.printStackTrace();
			map.put("message", "error");
			JsonOutToBrower.out(map, response);
		}
	}

	/** 企业用户信息提交 */
	@RequestMapping(value = "/enterprise/submit-account-Info")
	public void submitEntUserInfo(TentUser entUser, HttpServletRequest request,HttpSession session) {
		// 遍历图片
		String storepath = "xxxx";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0)break;
				org.junit.Assert.assertNotNull("upload file InputStream is null", inputStream);
				String fileName = file.getName();
				String extention = fileName.substring(fileName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix"+extention);
				//storepath = mydfsTrackerServer.upload(inputStream, extention);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("     finish!");
		
		TentUser sessionUser = null;
		try {
			// 如果为空就报错
			Assert.notNull(entUser.getId(), "user.id is not null");
			sessionUser = (TentUser) etechService.findObjectById(
					TentUser.class, entUser.getId());
			String password = entUser.getPassword();
			// 如果没有输入密码,使用原密码
			password = StringUtils.isEmpty(password) ? sessionUser
					.getPassword() : DigestUtils.md5Hex(password);
			System.out.println(password);
			entUser.setPassword(password);
			// 将注编辑的数据复制给sessionUser
			BeanUtils.copyProperties(sessionUser, entUser);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		etechService.merge(sessionUser);
		session.setAttribute("sessionUser", sessionUser);
	}

	/** 提交招聘信息 */
	@RequestMapping(value = "/enterprise-user/center/submit-recruit")
	public void submitRecruit(Trecruit recruit) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			etechService.merge(recruit);
			map.put("message", "success");
		} catch (Exception ex) {
			map.put("message", "error");
		}
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public @ResponseBody
	String upload(HttpServletRequest request) {
		// 遍历有二进制文件的form表单
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				String fileName = file.getName();
				String fileSuffix = fileName.substring(fileName
						.lastIndexOf(".") + 1);
				storepath = mydfsTrackerServer.upload(inputStream, fileSuffix);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return storepath;
	}
}
