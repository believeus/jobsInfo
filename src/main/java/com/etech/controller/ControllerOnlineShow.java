package com.etech.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 网上展示厅
 * */
@Controller
public class ControllerOnlineShow {
	private static Log log = LogFactory.getLog(ControllerOnlineShow.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/onlineShow", method = RequestMethod.GET)
	public String onlineShowView(HttpServletRequest request) {
		log.debug("current controller is imgShowView !");
		
		//视频新闻
		String hql="From TdataCenter dataCenter where dataCenter.type='4' order by id desc";
		List<String> pathList = new ArrayList<String>();
		List<TdataCenter> vedios = (List<TdataCenter>)etechService.findListByHQL(hql);
		log.debug(hql);
		for (TdataCenter tdataCenter : vedios) {
			String[] paths = tdataCenter.getImgpath().split("#");
			String vpath = paths[1];
			pathList.add(vpath);
			request.setAttribute("pathList", pathList);//把视频路径放在集合里
		}
		request.setAttribute("vedios", vedios);
		
		//图片新闻
		hql = "From TdataCenter tdataCenter where tdataCenter.type='3' order by id desc";
		List<TdataCenter> imgs = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("imgs", imgs); 
		String host=request.getHeader("Host");
		request.setAttribute("host", host);
		return "onlineShow/onlineShow";
	}
}
