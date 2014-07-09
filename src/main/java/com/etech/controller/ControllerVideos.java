package com.etech.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
		
		String[] path = null;
		if (imgVedio.getImgpath() != null) {
			path = imgVedio.getImgpath().split("#");
		}
		List<String> pathList = new ArrayList<String>();
		for (int i = 0; i < path.length; i++) {
			pathList.add(path[i]);
			request.setAttribute("pathList", pathList);
		}
		
		request.setAttribute("imgVedio", imgVedio);
		
		String hql="From TdataCenter dataCenter where dataCenter.type='4' order by dataCenter.editTime desc";
		List<TdataCenter> videolList = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		request.setAttribute("videolList", videolList);
		String host=request.getHeader("Host");
		request.setAttribute("host", host);
		request.setAttribute("random", new Random().nextInt(9999)+1);
		return "infoCenter/videosInfo";
	}
	
	@RequestMapping(value = "/videosList", method = RequestMethod.GET)
	public String videosList(HttpServletRequest request) {

		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		String hql="From TdataCenter dataCenter where dataCenter.type='4' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("videos", page);
		return "infoCenter/videosList";
	}
}
