package com.etech.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

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
		
		return "infoCenter/imageInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/imagesList", method = RequestMethod.GET)
	public String imgsList(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='3'";
		List<TdataCenter> imgs = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("imgs", imgs);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("subjectReport", subjectReport);
		
		return "infoCenter/imagesList";
	}
}
