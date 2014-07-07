package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.server.MydfsTrackerServer;

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
 * 新闻动态
 * */
@Controller("admimControllerNews")
@RequestMapping("/admin/news")
public class ControllerNews extends ControllerCRUD{
	@Resource
	private EtechService etechService;
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	/**
	 * 新闻列表
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
 	 */
	@RequestMapping(value = "/newsList")
	public String newsListView(HttpServletRequest request) throws UnsupportedEncodingException {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = super.pageDataInfo(request,EtechGobal.newsDinamic,pageable);
		request.setAttribute("dataCenters",page);
		return "admin/news/list";
	}


	//删除新闻
	@RequiresPermissions("newsDinamic:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/news/newsList.jhtml";
	}

	/**
	 * 添加新闻
	 * 
	 * @return
	 */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		//新闻动态
		List<?> dataCenters = super.listDataInfoByTop(request,EtechGobal.newsDinamic);
		request.setAttribute("size",dataCenters.size());
		request.setAttribute("type",EtechGobal.newsDinamic);
		return "admin/news/add";
	}

	/**
	 * 编辑新闻
	 * 
	 * @return
	 */
	@RequiresPermissions("newsDinamic:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.newsDinamic);
		return "admin/news/edit";
	}

	/**
	 * 保存新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request) {
		super.savaDataInfo(request);
		return "redirect:/admin/news/newsList.jhtml";
	}


	/**
	 * 修改新闻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNewsView(TdataCenter editDataCenter,HttpServletRequest request) {
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/news/newsList.jhtml";
	}

	@RequestMapping(value="/newsTop")
	public String newsTop(int id){
		super.top(id);
		etechService.updata(TdataCenter.class, "id", id, "editTime", System.currentTimeMillis());
		return "redirect:/admin/news/newsList.jhtml";
	}
	@RequestMapping(value="/unNewsTop")
	public String unNewsTop(int id){
		super.unTop(id);
		etechService.updata(TdataCenter.class, "id", id, "editTime", System.currentTimeMillis());
		return "redirect:/admin/news/newsList.jhtml";
	}
}
