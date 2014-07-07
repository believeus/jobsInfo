package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 工作动态
 * */
@Controller("adminControllerWroks")
@RequestMapping("/admin/work")
public class ControllerWork extends ControllerCRUD {
	@Resource
	private EtechService etechService;

	/**
	 * 工作列表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/list")
	public String newsListView(HttpServletRequest request) throws UnsupportedEncodingException {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = super.pageDataInfo(request,EtechGobal.workDinamic,pageable);
		request.setAttribute("dataCenters",page);
		return "admin/work/list";
	}
	
	/**
	 * 删除工作
	 * @param request
	 * @return
	 */
	@RequiresPermissions("workDinamic:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/work/list.jhtml";
	}
	
	/**
	 * 添加工作
	 * @return
	 */
	@RequiresPermissions("workDinamic:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfoByTop(request,EtechGobal.workDinamic);
		request.setAttribute("size",dataCenters.size());
		request.setAttribute("type",EtechGobal.workDinamic);
		return "admin/work/add";
	}
	/**
	 * 编辑工作
	 * @return
	 */
	@RequiresPermissions("workDinamic:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type", EtechGobal.workDinamic);
		return "admin/work/edit";
	}
	
	/**
	 * 保存工作
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/work/list.jhtml";
	}
	/**
	 * 修改工作
	 * @return
	 */
	
	@RequestMapping(value = "/update")
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request){
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/work/list.jhtml";
	}
	
	@RequestMapping(value="/workTop")
	public String newsTop(int id){
		super.top(id);
		etechService.updata(TdataCenter.class, "id", id, "editTime", System.currentTimeMillis());
		return "redirect:/admin/work/list.jhtml";
	}
	@RequestMapping(value="/unWorkTop")
	public String unNewsTop(int id){
		super.unTop(id);
		etechService.updata(TdataCenter.class, "id", id, "editTime", System.currentTimeMillis());
		return "redirect:/admin/work/list.jhtml";
	}
}
