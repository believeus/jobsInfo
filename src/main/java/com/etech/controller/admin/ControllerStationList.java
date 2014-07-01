package com.etech.controller.admin;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TentUser;
import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

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
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<Trecruit> recruitList =(List<Trecruit>)etechService.getListByProperty(Trecruit.class, "status", 1, 20);
		request.setAttribute("recruitList", recruitList);
		log.debug("current controller is newsListView !");
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
	public String updateNewsView(Trecruit formRecruit,Integer workTypeId,Integer majorTypeId,Integer userId){
		Trecruit recruit=(Trecruit) etechService.findObjectById(Trecruit.class, formRecruit.getId());
		TentUser entUser=(TentUser)etechService.findObjectById(TentUser.class, userId);
		if (workTypeId != null) {
			TmajorType workType = (TmajorType) etechService.findObjectById(TmajorType.class, workTypeId);
			formRecruit.setWorkType(workType);
		}
		if (majorTypeId != null) {
			TmajorType majorType = (TmajorType) etechService.findObjectById(TmajorType.class, majorTypeId);
			formRecruit.setMajorType(majorType);
		}
		formRecruit.setEntUser(entUser);
		BeanUtils.copyProperties(formRecruit, recruit);
		etechService.saveOrUpdata(recruit);
		return "redirect:/admin/stationList/list.jhtml";
	}

}
