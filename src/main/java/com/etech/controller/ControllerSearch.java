package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 搜索
 * */
@Controller
public class ControllerSearch {
	private static Log log = LogFactory.getLog(ControllerSearch.class);
	@Resource
	private EtechService etechService;
	/**简单搜索*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search")
	public String searchView(HttpServletRequest request) {
		String key = request.getParameter("key");
		int currentpage=Integer.parseInt(request.getParameter("currentpage"));
		int perCount=Integer.parseInt(request.getParameter("perCount"));
		log.debug("search key:"+key);
		Assert.assertNotNull(key);
		List<TdataCenter> tdataCenterList = (List<TdataCenter>) etechService.search(TdataCenter.class, key, new String[]{"title","content"},currentpage,perCount);
		request.setAttribute("tdataCenterList", tdataCenterList);
		return "occupationIntroduction/search";
	}
	/**高级搜索*/
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearchView(String data,String keyword,Integer majorTypeId,Integer workTypeId,
			Integer area,String type,HttpSession session) {
		
		System.out.println(data);
		System.out.println(keyword);
		System.out.println(majorTypeId);
		System.out.println(workTypeId);
		System.out.println(area); 
		System.out.println(type);
		
		if (data!=null) {
			String[] split = data.split("-");
			for (String string : split) {
				String[] str = string.split("_");
				System.out.println(str[0]);
			}
		}
		session.setAttribute("data", data);
		return "occupationIntroduction/advancedSearch";			
	}
	
}
