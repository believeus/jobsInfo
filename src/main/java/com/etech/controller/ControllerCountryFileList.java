package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 国家相关文件列表
 * */
@Controller
public class ControllerCountryFileList {
	@Resource
	private EtechService etechService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/countryFileList", method = RequestMethod.GET)
	public String policyAdviceView(HttpServletRequest request) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		String hql="from TdataCenter as dataCenter where dataCenter.type='"+EtechGobal.countryFile+"' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("dataCenterList", page);
		
		hql="From TdataCenter dataCenter where dataCenter.type='5' order by dataCenter.editTime desc";
		List<TdataCenter> spceilas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		request.setAttribute("spceilas", spceilas);
		
		return "policyAdvice/countryFileList";
	}
}
