package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
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
	
	@RequestMapping(value = "/videosInfo", method = RequestMethod.GET)
	public String videoList(HttpSession session,Integer id) {
		TentImgVedio imgVedio = (TentImgVedio)etechService.findObjectById(TentImgVedio.class, id);
		session.setAttribute("imgVedio", imgVedio);
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
