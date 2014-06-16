package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/search")
	public String searchView(HttpServletRequest request) {
		String key = request.getParameter("key");
		int currentpage=Integer.parseInt(request.getParameter("currentpage"));
		int perCount=Integer.parseInt(request.getParameter("perCount"));
		log.debug("search key:"+key);
		Assert.assertNotNull(key);
		@SuppressWarnings("unchecked")
		List<TdataCenter> tdataCenterList = (List<TdataCenter>) etechService.search(TdataCenter.class, key, new String[]{"title","content"},currentpage,perCount);
		request.setAttribute("tdataCenterList", tdataCenterList);
		return "occupationIntroduction/search";
	}
	/**高级搜索*/
	@RequestMapping(value = "/advancedSearch", method = RequestMethod.GET)
	public String advancedSearchView() {
		log.debug("current controller is searchView !");
		return "occupationIntroduction/advancedSearch";
	}
}
