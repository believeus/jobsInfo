package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomInfo;
import com.etech.entity.TdataCenter;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.util.TimeUtils;

/**
 * 数据频道
 * */
@Controller
public class ControllerDataChannel {
	private static Log log = LogFactory.getLog(ControllerDataChannel.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/dataChannel", method = RequestMethod.GET)
	public String dataChanelView(HttpSession session) {
		
		//公告公示
		String hql="From TdataCenter dataCenter where dataCenter.type='2'";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("notices",notices );
		
		//专题
		hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("subjectReport", subjectReport);
		
		//供求分析报告
		hql="From TdataCenter dataCenter where dataCenter.type='14'";
		List<TdataCenter> analysisreport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("analysisreport", analysisreport);
		
		//工资指导价位
		hql="From TdataCenter dataCenter where dataCenter.type='15'";
		List<TdataCenter> wagePriceGuide = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("wagePriceGuide", wagePriceGuide);
		
		// 获取一个月的毫秒数
		long oneMonthTimeMillis=TimeUtils.getOneMonthTimeMillis();
		// 当前时间
		long endTime=System.currentTimeMillis();
		long beginTime=endTime-oneMonthTimeMillis;
		//需求排行
		hql="from Trecruit recruit left join fetch recruit.workType "
		   + "where recruit.editTime >="+beginTime+" and recruit.editTime <="+endTime +" "
		   + "group by recruit.workType "
		   + "order by recruit.editTime desc";
		log.debug(hql);
		List<Trecruit> demand = (List<Trecruit>)etechService.findListByHQL(hql,8);
		session.setAttribute("demand", demand);
		
		//每月供给排行
		hql="from TcomInfo info left join fetch info.comUser "
		  + "where info.editDate>="+beginTime+" and info.editDate<="+endTime+" group by info.workType";
		log.debug(hql);
		List<TcomInfo> supply = (List<TcomInfo>)etechService.findListByHQL(hql,8);
		session.setAttribute("supply", supply);
		
		//下载
		hql="From TdataCenter dataCenter where dataCenter.type='18'";
		List<TdataCenter> downLoad = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("downLoad", downLoad);
		
		// 每月需求排行榜:查询发布招聘最多的工种
		hql="From Trecruit recruit from";
		log.debug("current controller is dataChanelView !");
		return "dataChannel/dataChannel";
	}
}
