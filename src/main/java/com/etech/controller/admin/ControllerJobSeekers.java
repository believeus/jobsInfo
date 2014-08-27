package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etech.entity.TcomUser;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 求职者
 * */
@Controller
@RequestMapping("/admin/jobSeekersList")
public class ControllerJobSeekers {
	private static Log log = LogFactory.getLog(ControllerJobSeekers.class);
	@Resource
	private EtechService etechService;
	/**
	 * 求职者列表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/list")
	public String newsListView(HttpServletRequest request) throws UnsupportedEncodingException {
		String hql="";
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		String searchValue = request.getParameter("searchValue");
		if (!StringUtils.isEmpty(searchValue)) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
			log.debug("根据求职者名称查询："+searchValue);
			 hql="FROM TcomUser user where user.disable=0 and user.loginName like '%"+searchValue+"%' order by user.editDate desc";
			request.setAttribute("searchValue", searchValue);
		}else {
			 hql="FROM TcomUser user where user.disable=0 order by user.editDate desc";
		}
		//查询待审核的企业用户
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("userList", page);
		return "admin/JobSeekers/list";
	}
	
	/**
	 * 删除 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:delete")
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
	@RequestMapping(value="/resetUserPassword")
	public @ResponseBody String resetUserPassword(int id){
		TcomUser comUser=(TcomUser)etechService.findObjectById(TcomUser.class, id);
		String password=DigestUtils.md5Hex("123456");
		comUser.setPassword(password);
		etechService.merge(comUser);
		return "success";
	}
	/**
	 * 添加求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/JobSeekers/add";
	}
	/**
	 * 编辑求职者
	 * @return
	 */
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(int id,HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		TcomUser user=(TcomUser)etechService.findObjectById(TcomUser.class, id);
		request.setAttribute("user", user);
		return "admin/JobSeekers/edit";
	}
	
	/**
	 * 保存求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:create")
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
	/**
	 * 修改求职者
	 * @return
	 */
	@RequiresPermissions("jobSeekersList:modify")
	@RequestMapping(value = "/update")
	public String updateNewsView(TcomUser formUser){
		log.debug("/admin/jobSeekersList/list.jhtml");
		log.debug(formUser.getWorkspace());
		TcomUser comUser=(TcomUser)etechService.findObjectById(TcomUser.class, formUser.getId());
		if(StringUtils.isEmpty(formUser.getPassword())){
			formUser.setPassword(comUser.getPassword());
		}else {
			formUser.setPassword(DigestUtils.md5Hex(formUser.getPassword()));
		}
		formUser.setRoles(comUser.getRoles());
		formUser.setComInfo(comUser.getComInfo());
		formUser.setEditDate(System.currentTimeMillis());
		etechService.merge(formUser);
		return "redirect:/admin/jobSeekersList/list.jhtml";
	}
}
