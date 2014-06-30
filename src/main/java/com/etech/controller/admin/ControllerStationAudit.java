package com.etech.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequiresPermissions("stationAudit:delete")
	@RequestMapping("/delete")
	public String delete(){
		return "";
	}
	/**
	 * 添加岗位审核
	 * @return
	 */
	@RequiresPermissions("stationAudit:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView() {
		log.debug("current controller is newsListView !");
		return "admin/stationsAudit/add";
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
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(HttpServletRequest request){
		String id=request.getParameter("id");
		int review=1;
		etechService.updata(Trecruit.class, "id", Integer.parseInt(id), "status", review);
		return "redirect:/admin/stationAudit/list.jhtml";
	}
}
