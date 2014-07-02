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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TentUser;
import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

/**
 * 岗位审核
 * */
@Controller
@RequestMapping("/admin/stationAudit")
public class ControllerStationAudit {
	private static Log log = LogFactory.getLog(ControllerStationAudit.class);
	@Resource
	private EtechService etechService;
	/**
	 * 岗位审核列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		List<Trecruit> recruitList=(List<Trecruit>)etechService.getListByProperty(Trecruit.class, "status", 0,15);
		request.setAttribute("recruitList", recruitList);
		return "admin/stationsAudit/list";
	}
	
	/**
	 * 编辑岗位审核
	 * @return
	 */
	// 待审核列表编辑页
	@RequiresPermissions("stationAudit:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(Integer id,HttpServletRequest request) {
		Trecruit recruit=(Trecruit)etechService.findObjectById(Trecruit.class, id);
		request.setAttribute("recruit", recruit);
		log.debug("current controller is newsListView !");
		return "admin/stationsAudit/edit";
	}
	
	/**
	 * 删除 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("stationAudit:delete")
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
	 * 保存岗位审核
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveNewsView(){
		return "redirect:/admin/stationAudit/list.jhtml";
	}
	/**
	 * 修改岗位审核
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
		return "redirect:/admin/stationAudit/list.jhtml";
	}
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(HttpServletRequest request){
		String id=request.getParameter("id");
		int review=1;
		etechService.updata(Trecruit.class, "id", Integer.parseInt(id), "status", review);
		return "redirect:/admin/stationAudit/list.jhtml";
	}
}
