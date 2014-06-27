package com.etech.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.etech.entity.TbaseUser;
import com.etech.entity.TcomInfo;
import com.etech.entity.TcomUser;
import com.etech.entity.TentImgVedio;
import com.etech.entity.TentUser;
import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.service.CommonUserService;
import com.etech.service.EnterpriseUserService;
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
	private CommonUserService commonUserService;
	@Resource
	private EnterpriseUserService enterpriseUserService;
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	/** 个人中心:该用户需要有personalRole角色才能访问 */
	@SuppressWarnings("unchecked")
	@RequiresAuthentication
	@RequiresRoles("个人用户权限")
	@RequestMapping(value = "/common-user/center", method = RequestMethod.GET)
	public String personalCenter(HttpSession session,HttpServletRequest request) {
		TcomUser sessionUser = (TcomUser) session.getAttribute("sessionUser");
		// 1：查询具备技能
		String hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='1' and user.id='"+sessionUser.getId()+"'";
		List<TcomInfo> skills = (List<TcomInfo>)etechService.findListByHQL(hql);
		//2：查询学习经历
		hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='2' and user.id='"+sessionUser.getId()+"'";;
		List<TcomInfo> learnings = (List<TcomInfo>)etechService.findListByHQL(hql);
		//3 查询工作经验
		hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='3' and user.id='"+sessionUser.getId()+"'";;
		List<TcomInfo> works = (List<TcomInfo>)etechService.findListByHQL(hql);
		//4 查询志愿
		hql="From TcomInfo comInfo left join fetch comInfo.comUser  as user where comInfo.infoType='4' and user.id='"+sessionUser.getId()+"'";;
		List<TcomInfo> volunteers = (List<TcomInfo>)etechService.findListByHQL(hql);
		request.setAttribute("skills", skills);// 具备技能
		request.setAttribute("learnings", learnings);// 学习经历
		request.setAttribute("works", works);// 工作经验
		request.setAttribute("volunteers", volunteers);// 选择志愿
		/*Begin Author:wuqiwei Data:2014-06-18 AddReason:根据填写的志愿信息获取推荐企业*/
		List<Trecruit> recommendTrecruit = commonUserService.enterpriseRecommend(volunteers);
		request.setAttribute("recommendTrecruit", recommendTrecruit);
		/*End Author:wuqiwei Data:2014-06-18 AddReason:根据填写的志愿信息获取推荐企业*/
		return "center/personalCenter";
	}

	/** 进入企业中心:该用户需要有enterpriseRole角色才能访问 */
	@SuppressWarnings("unchecked")
	@RequiresAuthentication
	@RequiresRoles("企业用户权限")
	@RequestMapping(value = "/enterprise-user/center", method = RequestMethod.GET)
	public String enterpriseCenter(HttpServletRequest request) {
		HttpSession session = request.getSession();
		TentUser entUser=(TentUser)session.getAttribute("sessionUser");
		String hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+entUser.getId()+"  and info.type='0'";
		List<TentImgVedio> Imgs=(List<TentImgVedio>)etechService.findListByHQL(hql);
		hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+entUser.getId()+"  and info.type='1'";
		List<TentImgVedio> Vedios=(List<TentImgVedio>)etechService.findListByHQL(hql);
		hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+entUser.getId()+"  and info.type='2'";
		List<TentImgVedio> Maps=(List<TentImgVedio>)etechService.findListByHQL(hql);
		hql="From Trecruit recruit left join fetch recruit.entUser as user where  user.id='"+entUser.getId()+"'";
		List<Trecruit> recruits = (List<Trecruit>)etechService.findListByHQL(hql);
		request.setAttribute("Imgs", Imgs);
		request.setAttribute("Vedios", Vedios);
		System.out.println(Vedios.size()); 
		request.setAttribute("Maps", Maps);
		request.setAttribute("recruits",recruits);
		/*Begin Author:wuqiwei Data:2014-06-18 AddReason:根据填写的求职信息获取推荐人才*/
		List<TcomUser> talentRecommend =(List<TcomUser>)enterpriseUserService.talentRecommend(recruits);
		request.setAttribute("talentRecommend", talentRecommend);
		/*End Author:wuqiwei Data:2014-06-18 AddReason:根据填写的求职信息获取推荐人才*/
		return "center/enterpriseCenter";
	}
	// 编辑招聘信息
	@RequestMapping(value="/editRecruit")
	public String editRecruit(int id,HttpServletRequest request){
		Trecruit recruit=(Trecruit)etechService.findObjectById(Trecruit.class, id);
		request.setAttribute("recruit",recruit);
		return "center/enterpriseCenterEditRecruit";
	}
	public String submitEditRecruit(Trecruit formRecruit){
		etechService.merge(formRecruit);
		return "redirect:/enterprise-user/center";
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
				TmajorType workType = (TmajorType) etechService.findObjectById(TmajorType.class, workTypeId);
				comInfo.setWorkType(workType);
			}
			if (majorTypeId != null) {
				TmajorType majorType = (TmajorType) etechService.findObjectById(TmajorType.class, majorTypeId);
				comInfo.setMajorType(majorType);
			}
			// 设置编辑时间
			comInfo.setEditDate(System.currentTimeMillis());
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
	public void submitEntUserInfo(TentUser entUser,String ids, String vIds,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
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
			entUser.setPassword(password);
			// 得到原来的数据。
			entUser.setRoles(sessionUser.getRoles()); 
			// 将注编辑的数据复制给sessionUser
			BeanUtils.copyProperties(sessionUser, entUser);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// 删除图片
		if (ids!=null&&!ids.equals("")) {
			String[] split = ids.split(",");
			for (String id : split) {
				etechService.deleteObjectById(TentImgVedio.class, Integer.valueOf(id));
			}
		}
		
		// 删除视频
		if (vIds!=null&&!vIds.equals("")) {
			String[] split = vIds.split(",");
			for (String id : split) {
				etechService.deleteObjectById(TentImgVedio.class, Integer.valueOf(id));
			}
		}
		
		etechService.saveOrUpdata(sessionUser);
		session.setAttribute("sessionUser", sessionUser);
		map.put("message", "success");
		JsonOutToBrower.out(map, response);
	}

	@RequestMapping(value="/enterprise-user/center/upload.jhtml")
	public void submitImg(HttpSession session,HttpServletRequest request,HttpServletResponse response,TentImgVedio imgVedio){
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取用户
		TentUser entUser=(TentUser)session.getAttribute("sessionUser");
		entUser=(TentUser) etechService.findObjectById(TentUser.class, entUser.getId());
		// 遍历图片
		String storepath = "";
		Set<TentImgVedio> imgVedios=new HashSet<TentImgVedio>();
		imgVedio.setEntUser(entUser);
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
				storepath = mydfsTrackerServer.upload(inputStream, extention);
				imgVedio.setUrl(storepath);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		imgVedios.add(imgVedio); 
		entUser.setImgVedios(imgVedios); 
		if (storepath!="") {
			etechService.saveOrUpdata(entUser);			
		}
		map.put("message", "success");
		JsonOutToBrower.out(map, response);
		
	}
	@RequestMapping(value="/enterprise-user/center/uploadVedio.jhtml")
	public void submitVedio(HttpSession session,HttpServletRequest request,HttpServletResponse response,TentImgVedio imgVedio){
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取用户
		TentUser entUser=(TentUser)session.getAttribute("sessionUser");
		entUser=(TentUser) etechService.findObjectById(TentUser.class, entUser.getId());
		Set<TentImgVedio> imgVedios=new HashSet<TentImgVedio>();
		imgVedios.add(imgVedio); 
		imgVedio.setEntUser(entUser);
		entUser.setImgVedios(imgVedios); 
		etechService.saveOrUpdata(entUser);
		map.put("message", "success");
		JsonOutToBrower.out(map, response);
		
	}
	
	/** 提交招聘信息 */
	@RequestMapping(value = "/enterprise-user/center/submit-recruit")
	public void submitRecruit(Trecruit recruit,Integer workTypeId,
			Integer majorTypeId,HttpSession session,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		TentUser entUser=(TentUser)session.getAttribute("sessionUser");
		recruit.setEntUser(entUser);
		//创建时间
		recruit.setCreateTime(System.currentTimeMillis());
		//编辑时间
		recruit.setEditTime(System.currentTimeMillis());
		if (workTypeId != null) {
			TmajorType workType = (TmajorType) etechService.findObjectById(TmajorType.class, workTypeId);
			recruit.setWorkType(workType);
		}
		if (majorTypeId != null) {
			TmajorType majorType = (TmajorType) etechService.findObjectById(TmajorType.class, majorTypeId);
			recruit.setMajorType(majorType);
		}
		
		try {
			etechService.saveOrUpdata(recruit);
			map.put("message", "success");
		} catch (Exception ex) {
			ex.printStackTrace();
			map.put("message", "error");
		}
		JsonOutToBrower.out(map, response);
	}
	
	
	@RequestMapping(value = "/enterprise-user/center/change-recruit")
	public void changeRecruit(String id,HttpServletResponse response){
		Trecruit recruit= (Trecruit)etechService.findObjectById(Trecruit.class, Integer.valueOf(id));
		String isview = recruit.getIsview();
		String info="";
		if (isview.equals("发布")) {
			recruit.setIsview("不发布");
			info="不发布";
		}else {
			recruit.setIsview("发布");
			info="发布";
		}
		etechService.saveOrUpdata(recruit);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", info);
		JsonOutToBrower.out(map, response);
	}
	@RequestMapping(value = "/enterprise-user/center/delete-recruit")
	public void deleteRecruit(String id,HttpServletResponse response){
		etechService.deleteObjectById(Trecruit.class, Integer.valueOf(id));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "success");
		JsonOutToBrower.out(map, response);
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
	@RequestMapping(value = "/EUpload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public  void eUpload(HttpServletRequest request,HttpServletResponse response) {
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
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("error", 0);
		map.put("url", "/"+storepath);
		response.setContentType("text/html; charset=UTF-8");
		JsonOutToBrower.out(map, response);
	}
	
	@RequestMapping(value = "/user/center/updatepd", method = RequestMethod.POST)
	public  void updatepd(Integer id,String password,HttpServletResponse response) {
		TbaseUser user = (TbaseUser)etechService.findObjectById(TbaseUser.class, id);
		user.setPassword(DigestUtils.md5Hex(password)); 
		etechService.merge(user); 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("message", "success");
		JsonOutToBrower.out(map, response);
	}
}
