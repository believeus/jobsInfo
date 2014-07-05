package com.etech.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

@Controller
public class ControllerInfoCenter {
	@Resource
	private EtechService etechService;
	
	/** 信息中心 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/infoCenter", method = RequestMethod.GET)
	public String infoCenter(HttpServletRequest request) {
		String hql="From TdataCenter dataCenter where dataCenter.type='0' order by id desc";
		List<TdataCenter> news = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		//置顶内容 ：新闻动态、工作动态、图片新闻、视频新闻
		hql="From TdataCenter dataCenter where dataCenter.top='1' order by editTime desc";
		List<TdataCenter> dataCenters = (List<TdataCenter>)etechService.findListByHQL(hql);
		List<TdataCenter> dataCenterList=new ArrayList<TdataCenter>();
		/**Begin Author:wuqiwei Data:2014:07-13 AddReason:去除html标签*/
		for (TdataCenter tdataCenter : dataCenters) {
			try {
				TdataCenter dataCenter=(TdataCenter) tdataCenter.clone();
				if(!StringUtils.isEmpty(dataCenter.getContent())){
					dataCenter.setContent(dataCenter.getContent().replaceAll("<[^>]+>", ""));
					dataCenterList.add(dataCenter);
				}
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
		}
		/**End Author:wuqiwei Data:2014:07-13 AddReason:去除html标签*/
		request.setAttribute("newsTop", dataCenterList);
		
		hql="From TdataCenter dataCenter where dataCenter.type='1' order by id desc";
		List<TdataCenter> works = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='2' order by id desc";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='3' order by id desc";
		List<TdataCenter> imgs = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='4' order by id desc";
		List<TdataCenter> vedios = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5' order by id desc";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		
		request.setAttribute("news", news);// 新闻动态
		request.setAttribute("works", works);// 工作动态
		request.setAttribute("notices",notices ); // 公告公示
		request.setAttribute("imgs", imgs); // 图片新闻
		request.setAttribute("vedios", vedios);  // 视频新闻
		request.setAttribute("subjectReport", subjectReport); // 专题报道
		return "infoCenter/infoCenter"; 
	}
	
}
