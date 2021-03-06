package com.etech.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.etech.entity.TentImgVedio;
import com.etech.entity.TentUser;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 企业列表
 * */
@Controller
@RequestMapping("/admin/enterpriseList")
public class ControllerEnterpriseList {
	private static Log log = LogFactory.getLog(ControllerEnterpriseList.class);
	
	@Resource
	private EtechService etechService;
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	/**
	 * 企业列表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/list")
	public String newsListView(HttpServletRequest request) throws UnsupportedEncodingException {
		//查询已审核的企业用户
		String hql="";
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		String searchValue = request.getParameter("searchValue");
		if (!StringUtils.isEmpty(searchValue)) {
			searchValue=searchValue.trim();
			log.debug("根据公司名称查询："+searchValue);
			hql="FROM TentUser user where user.status=1 and user.disable=0 and user.fullName like '%"+searchValue+"%' order by user.editDate desc";
			request.setAttribute("searchValue", searchValue);
		}else {
			hql="FROM TentUser user where user.status=1 and user.disable=0 order by user.editDate desc";
		}
		
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("enterpriseTentUsers", page);
		return "admin/humanResources/list";
	}
	/**
	 * 删除 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("enterpriseList:delete")
	@RequestMapping("/delete")
	public void removeNews(Long[] ids,HttpServletResponse response){
		System.out.println(ids);
		String userIds = Arrays.toString(ids).replace("[","(").replace("]", ")");
		String hql="update from TbaseUser user set user.disable=1 where user.id in "+userIds;
		log.debug(hql);
		etechService.update(hql);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", "success");
		JsonOutToBrower.out(map, response);
	}
	/**
	 * 添加企业
	 * @return
	 */
	@RequiresPermissions("enterpriseList:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/humanResources/add";
	}
	/**
	 * 编辑企业
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		
		String id=request.getParameter("id");
		System.out.println(etechService+"=etechService");
		TentUser tentUsers=(TentUser)etechService.findObjectById(TentUser.class, Integer.parseInt(id));
		request.setAttribute("tentUsers", tentUsers);
		String hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+tentUsers.getId()+"  and info.type='0'";
		List<TentImgVedio> Imgs=(List<TentImgVedio>)etechService.findListByHQL(hql);
		hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+tentUsers.getId()+"  and info.type='1'";
		List<TentImgVedio> Vedios=(List<TentImgVedio>)etechService.findListByHQL(hql);
		hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+tentUsers.getId()+"  and info.type='2'";
		List<TentImgVedio> Maps=(List<TentImgVedio>)etechService.findListByHQL(hql);
		request.setAttribute("Imgs", Imgs);
		request.setAttribute("Vedios", Vedios);
		request.setAttribute("Maps", Maps);
		log.debug("current controller is editNewsView !");
		
		return "admin/humanResources/edit";
	}
	
	@RequestMapping(value="/resetPassword")
	public @ResponseBody String resetPassword(int id){
		TentUser entuser = (TentUser)etechService.findObjectById(TentUser.class, id);
		String password=DigestUtils.md5Hex("123456");
		entuser.setPassword(password);
		etechService.saveOrUpdata(entuser);
		log.debug("reset password success");
		return "success";
	}
	/**
	 * 保存企业
	 * @return
	 */
	@RequiresPermissions("enterpriseList:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(){
		
		return "redirect:/admin/enterpriseList/list.jhtml";
	}
	/**
	 * 修改企业
	 * @return
	 */
	@RequiresPermissions("enterpriseList:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TentUser formUser,HttpServletRequest request,Integer MapId){
		
		TentUser entUser=(TentUser) etechService.findObjectById(TentUser.class,formUser.getId());
		TentImgVedio map=null;
		if (!StringUtils.isEmpty(MapId)) {
			 map = (TentImgVedio)etechService.findObjectById(TentImgVedio.class, MapId);
		}
		
		String storepath = "";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0)break;
				org.junit.Assert.assertNotNull("upload file InputStream is null", inputStream);
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix:"+extention);
				storepath = mydfsTrackerServer.upload(inputStream, extention);
				if (map!=null) {
					map.setUrl(storepath);
				}else {
					map=new TentImgVedio();
					map.setEntUser(entUser);
					map.setType(2);
					map.setUrl(storepath); 
				}
				entUser.getImgVedios().add(map);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		formUser.setEditDate(System.currentTimeMillis());
		formUser.setRoles(entUser.getRoles());
		formUser.setRecruit(entUser.getRecruit());
		formUser.setImgVedios(entUser.getImgVedios());
		BeanUtils.copyProperties(formUser, entUser);
		etechService.saveOrUpdata(entUser);
		return "redirect:/admin/enterpriseList/list.jhtml";
	}
}
