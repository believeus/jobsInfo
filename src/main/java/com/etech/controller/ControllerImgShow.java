package com.etech.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 图片展示详情
 * */
@Controller
public class ControllerImgShow {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/imgShow", method = RequestMethod.GET)
	public String imgShow(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		
		String path = dataCenter.getImgpath();
		String[] date = path.split("#");
		List<String> pathList = new ArrayList<String>();
		for (int i = 0; i < date.length; i++) {
			pathList.add(date[i]);
		}
		session.setAttribute("pathList", pathList);
		session.setAttribute("size", pathList.size());
		
		System.out.println(dataCenter.getWidth()+"---"+dataCenter.getHeight());
		
		return "infoCenter/imageInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/imagesList", method = RequestMethod.GET)
	public String imgsList(HttpServletRequest request) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		String hql="From TdataCenter dataCenter where dataCenter.type='3' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("imgs", page);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5' order by id desc";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("subjectReport", subjectReport);
		
		return "infoCenter/imagesList";
	}
}
