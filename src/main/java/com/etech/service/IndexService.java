package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 首页面
 * */
@Service
public class IndexService {
	private static Log log = LogFactory.getLog(IndexService.class);

	@Resource
	private EtechComDao etechComDao;
}
