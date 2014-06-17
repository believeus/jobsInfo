package com.etech.controller;

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
		return "infoCenter/imageInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/imagesList", method = RequestMethod.GET)
	public String imgsList(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='3'";
		List<TdataCenter> imgs = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("imgs", imgs);
		return "infoCenter/imagesList";
	}
}
