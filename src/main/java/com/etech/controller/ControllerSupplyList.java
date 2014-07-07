package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomInfo;
import com.etech.service.EtechService;
import com.etech.util.TimeUtils;

/**
 * 职业供给排行列表
 * */
@Controller
public class ControllerSupplyList {

	@Resource
	private EtechService etechService;
	private static final Log log = LogFactory.getLog(ControllerSupplyList.class);

	// 每月供给排行,求职者发送的求职信息
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gongjipaihangList", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		//当前页
		int pageNo=0;
		// 每页多少行数据
		int pageSize=15;
		if(!StringUtils.isEmpty(request.getParameter("pageNo"))){
			pageNo=Integer.parseInt(request.getParameter("pageNo"));
		}
		if(!StringUtils.isEmpty(request.getParameter("pageSize"))){
			pageSize=Integer.parseInt(request.getParameter("pageSize"));
		}
		// 每月供给排行
		String hql="from TcomInfo info left join fetch info.comUser "
				 + "where info.infoType=4 group by FROM_UNIXTIME(info.editDate/1000, '%Y-%m') order by FROM_UNIXTIME(info.editDate/1000, '%Y-%m') desc";
		log.debug(hql);
		List<TcomInfo> supply = (List<TcomInfo>) etechService.findObjectList(hql, pageNo, pageSize, TcomInfo.class);
		request.setAttribute("monthSupplyList", supply);

		return "dataChannel/gongjipaihangList";
	}
}
