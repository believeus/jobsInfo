package com.etech.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 高级搜索页
 * */
@Service
public class AdvancedSearch {
	private static Log log = LogFactory.getLog(AdvancedSearch.class);
	@Resource
	private EtechComDao etechComDao;
}
