package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 新闻列表
 * */
@Service
public class NewsListService {
	private static Log log = LogFactory.getLog(NewsListService.class);

	@Resource
	private EtechComDao etechComDao;
}
