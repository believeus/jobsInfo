package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TentUser;
import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 岗位
 * */
@Controller
@RequestMapping("/admin/stationList")
public class ControllerStationList {
	private static Log log = LogFactory.getLog(ControllerStationList.class);
	@Resource
	private EtechService etechService;
	/**
	 * 岗位列表
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
			searchValue=searchValue.trim();
			log.debug("根据工种名称查询："+searchValue);
			hql="From Trecruit trecruit  where trecruit.status=1 and trecruit.entUser.disable='0' and trecruit.workType.name like '%"+searchValue+"%'  order by trecruit.editTime desc";
			request.setAttribute("searchValue", searchValue);
		}else {
			hql="From Trecruit trecruit where trecruit.status=1 and trecruit.entUser.disable='0' order by trecruit.editTime desc";
		}
		//查询待审核的企业用户
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("recruitList", page);
		return "admin/stations/list";
	}
	
	/**
	 * 删除 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("stationList:delete")
	@RequestMapping("/delete")
	public void removeNews(Long[] ids,HttpServletResponse response){
		System.out.println(ids);
		String userIds = Arrays.toString(ids).replace("[","(").replace("]", ")");
		//delete from Trecruit trecruit where trecruit.id in userIds;
		String hql="delete from Trecruit trecruit where trecruit.id in "+userIds;
		log.debug(hql);
		etechService.delete(hql);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", "success");
		JsonOutToBrower.out(map, response);
	}
	
	/**
	 * 编辑岗位
	 * @return
	 */
	// 编辑审核通过的招聘岗位列表
	@RequiresPermissions("stationList:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(int id,HttpServletRequest request) {
		Trecruit recruit=(Trecruit)etechService.findObjectById(Trecruit.class, id);
		request.setAttribute("recruit", recruit);
		log.debug("current controller is newsListView !");
		return "admin/stations/edit";
	}
	
	/**
	 * 保存岗位
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(){
		
		return "redirect:/admin/stationList/list.jhtml";
	}
	/**
	 * 修改岗位
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String updateNewsView(Trecruit recruit,Integer workTypeId,Integer majorTypeId,Integer userId){
		TentUser entUser=(TentUser)etechService.findObjectById(TentUser.class, userId);
		if (workTypeId != null) {
			TmajorType workType = (TmajorType) etechService.findObjectById(TmajorType.class, workTypeId);
			recruit.setWorkType(workType);
		}
		if (majorTypeId != null) {
			TmajorType majorType = (TmajorType) etechService.findObjectById(TmajorType.class, majorTypeId);
			recruit.setMajorType(majorType);
		}
		recruit.setEntUser(entUser);
		recruit.setEditTime(System.currentTimeMillis());
		etechService.merge(recruit);
		return "redirect:/admin/stationList/list.jhtml";
	}

}
