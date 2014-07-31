package com.etech.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.Tadmin;
import com.etech.entity.TbaseUser;
import com.etech.entity.TcomInfo;
import com.etech.entity.TdataCenter;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 首页面
 * */
@Controller
public class ControllerIndex {
	private static Log log = LogFactory.getLog(ControllerIndex.class);

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/index")
	public String defaultIndex(HttpServletRequest request) {
		/*Begin Author:wuqiwei Data:2014-06-11 AddReason:shiro登录成功之后会跳转到主页面,此处控制后台登录后进入后台主页面*/
		HttpSession session = request.getSession();
		String refer=request.getHeader("Referer");
		TbaseUser sessionUser = (TbaseUser)session.getAttribute("sessionUser");
		if(!StringUtils.isEmpty(sessionUser)){
			if(sessionUser instanceof Tadmin){
				if(!StringUtils.isEmpty(refer)&&refer.contains("/admin/login.jhtml")){
					return "redirect:/admin/common/main.jhtml";
				}
			}
		}
		//工作动态
		String hql="From TdataCenter dataCenter where dataCenter.type='1' order by id desc";
		List<TdataCenter> works = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("works",works ); 
		
		//新闻动态
		hql="From TdataCenter dataCenter where dataCenter.type='0' order by editTime desc";
		List<TdataCenter> news = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("news",news ); 
		
		// 公告公示
		hql="From TdataCenter dataCenter where dataCenter.type='2' order by id desc";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("notices",notices ); 
		
		//国家法律法规
		hql="From TdataCenter dataCenter where dataCenter.type='10' or dataCenter.type='11' or dataCenter.type='12' or dataCenter.type='13' order by editTime desc";
		List<TdataCenter> countryLawDataList = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("countryLawDataList",countryLawDataList ); 
		
		// 专题报道
		hql="From TdataCenter dataCenter where dataCenter.type='5' order by id desc";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("subjectReport", subjectReport); 
		
		// 幻灯片
		hql="From TdataCenter dataCenter where dataCenter.type='19'";
		List<TdataCenter> slide = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("slide", slide); 
		
		// 友情链接
		hql="From TdataCenter dataCenter where dataCenter.type='24' order by id desc";
		List<TdataCenter> links = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("links", links); 
		
		//招聘信息
		hql = "From Trecruit trecruit where trecruit.status='1' and  trecruit.isview='发布' and trecruit.entUser.disable='0' order by trecruit.editTime desc";
		List<Trecruit> zhaopList = (List<Trecruit>)etechService.findListByHQL(hql);
		session.setAttribute("zhaopList", zhaopList); 
		
		//求职信息
		hql	= "From TcomInfo tcomInfo where tcomInfo.comUser.disable='0' and tcomInfo.infoType='4' order by tcomInfo.editDate desc";
		List<TcomInfo> qiuzhiList = (List<TcomInfo>)etechService.findListByHQL(hql,4);
		session.setAttribute("qiuzhiList", qiuzhiList); 
		
		//图片新闻
		hql = "From TdataCenter tdataCenter where tdataCenter.type='3' order by id desc";
		List<TdataCenter> imgs = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("imgs", imgs); 
		
		//业务办理
		hql = "From TdataCenter tdataCenter where tdataCenter.type='21' order by id desc";
		List<TdataCenter> busHandles = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("busHandles", busHandles); 
		
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
		
		/*End Author:wuqiwei Data:2014-06-11 AddReason:shiro登录成功之后会跳转到主页面,此处控制后台登录后进入后台主页面*/
		log.debug("current controller is defaultIndex !");
		return "index";
	}
}
