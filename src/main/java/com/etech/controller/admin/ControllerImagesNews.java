package com.etech.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
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
 * 图片新闻
 * */
@Controller
@RequestMapping("/admin/imagesNews")
public class ControllerImagesNews extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 图片新闻列表
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
		Page<?> page = super.pageDataInfo(request,EtechGobal.newsImg,pageable);
		request.setAttribute("dataCenters",page);
		return "admin/imagesNews/list";
	}
	
	/**
	 * 删除图片新闻
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("newsImg:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/imagesNews/list.jhtml";
	}
	
	/**
	 * 添加图片新闻
	 * @return
	 */
	@RequiresPermissions("newsImg:create")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addNewsView(HttpServletRequest request) {
		List<?> dataCenters = super.listDataInfoByTop(request,EtechGobal.newsImg);
		request.setAttribute("size",dataCenters.size());
		request.setAttribute("type",EtechGobal.newsImg);
		return "admin/imagesNews/add";
	}
	/**
	 * 编辑图片新闻
	 * @return
	 */
	//@RequiresPermissions("newsImg:modify")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editNewsView(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("dataCenter", dataCenter);
		request.setAttribute("type",EtechGobal.newsImg);
		return "admin/imagesNews/edit";
	}
	
	/**
	 * 保存图片新闻
	 * @return
	 */
	@RequiresPermissions("newsImg:create")
	@RequestMapping(value = "/save")
	public String saveNewsView(HttpServletRequest request){
		super.savaDataInfo(request);
		return "redirect:/admin/imagesNews/list.jhtml";
	}
	/**
	 * 修改图片新闻
	 * @return
	 */
	@RequiresPermissions("newsImg:modify")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNewsView(TdataCenter editDataCenter,String ids,HttpServletRequest request) {
		if (!StringUtils.isEmpty(ids)) {
			TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, editDataCenter.getId());
			List<String> oldlist = new ArrayList<String>(Arrays.asList(dataCenter.getImgpath().split("#")));
			List<String> newList = new ArrayList<String>(Arrays.asList(ids.split("#")));
			oldlist.removeAll(newList);
			String imgpath="";
			for (String string : oldlist) {
				imgpath+=string+"#"; 
			}
			dataCenter.setImgpath(imgpath);
			etechService.merge(dataCenter); 
		}
		super.updataDataInfo(editDataCenter, request);
		return "redirect:/admin/imagesNews/list.jhtml";
	}
	
	@RequestMapping(value="/imagesNewsTop")
	public String newsTop(int id){
		super.top(id);
		etechService.updata(TdataCenter.class, "id", id, "editTime", System.currentTimeMillis());
		return "redirect:/admin/imagesNews/list.jhtml";
	}
	@RequestMapping(value="/unImagesNewsTop")
	public String unNewsTop(int id){
		super.unTop(id);
		etechService.updata(TdataCenter.class, "id", id, "editTime", System.currentTimeMillis());
		return "redirect:/admin/imagesNews/list.jhtml";
	}
}
