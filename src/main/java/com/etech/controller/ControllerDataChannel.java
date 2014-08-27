package com.etech.controller;

import java.util.Calendar;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.etech.entity.TcomInfo;
import com.etech.entity.TdataCenter;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

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
	public String dataChanelView(HttpServletRequest request) {
		
		//公告公示
		String hql="From TdataCenter dataCenter where dataCenter.type='2' order by id desc";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("notices",notices );
		
		//专题
		hql="From TdataCenter dataCenter where dataCenter.type='5' order by id desc";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("subjectReport", subjectReport);
		
		//供求分析报告
		hql="From TdataCenter dataCenter where dataCenter.type='14' order by id desc";
		List<TdataCenter> analysisreport = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("analysisreport", analysisreport);
		
		//工资指导价位
		hql="From TdataCenter dataCenter where dataCenter.type='15' order by id desc";
		List<TdataCenter> wagePriceGuide = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("wagePriceGuide", wagePriceGuide);
		
		 //获取当前月第一天：
        Calendar c = Calendar.getInstance();   
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
        long beginTime=c.getTimeInMillis();
        System.out.println("beginTime:"+beginTime);
        //获取当前月最后一天
        Calendar ca = Calendar.getInstance();   
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH)); 
        long endTime=ca.getTimeInMillis();
        System.out.println("endTime:"+endTime);
       //招聘信息 审核通过的recruit.status='1'  所属企业没有被删除的recruit.entUser.disable='0' 该企业审核通过trecruit.entUser.status=1
		hql="from Trecruit recruit left join fetch recruit.workType "
		   + "where recruit.editTime >="+beginTime+" and recruit.editTime <="+endTime +" and  recruit.workType!=null "
		   + "and recruit.status=1 and recruit.entUser.status=1 and recruit.entUser.disable=0  and recruit.isview='发布' "
		   + "group by recruit.workType "
		   + "order by count(recruit.workType) desc";
		log.debug(hql);
		List<Trecruit> demand = (List<Trecruit>)etechService.findListByHQL(hql,10);
		request.setAttribute("demand", demand);
		
		//每月供给排行
		hql="from TcomInfo info left join fetch info.comUser "
		  + "where info.editDate>="+beginTime+" and info.editDate<="+endTime+" and info.comUser.disable=0  and info.infoType='4'"
		  + "and info.workType!=null group by info.workType order by count(info.workType) desc";
		log.debug(hql);
		List<TcomInfo> supply = (List<TcomInfo>)etechService.findListByHQL(hql,10);
		request.setAttribute("supply", supply);
		
		//下载
		hql="From TdataCenter dataCenter where dataCenter.type='18' order by id desc";
		List<TdataCenter> downLoad = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("downLoad", downLoad);
		
		// 每月需求排行榜:查询发布招聘最多的工种
		hql="From Trecruit recruit from";
		log.debug("current controller is dataChanelView !");
		return "dataChannel/dataChannel";
	}
}
