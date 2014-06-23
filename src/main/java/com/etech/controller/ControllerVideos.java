package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.entity.TentImgVedio;
import com.etech.service.EtechService;

/**
 * 视频新闻
 * */
@Controller
public class ControllerVideos {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/videosInfo", method = RequestMethod.GET)
	public String videoList(HttpServletRequest request,Integer id) {
		
		TdataCenter imgVedio=(TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("imgVedio", imgVedio);
		
		String hql="From TdataCenter dataCenter where dataCenter.type='4'";
		List<TdataCenter> videos = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		request.setAttribute("videos", videos);
		
		return "infoCenter/videosInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/videosList", method = RequestMethod.GET)
	public String videosList(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='4'";
		List<TdataCenter> videos = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("videos", videos);
		return "infoCenter/videosList";
	}
}
