package com.etech.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 职业介绍
 * */
@Service
public class JobIntroduceService {
	private static Log log = LogFactory.getLog(JobIntroduceService.class);
	@Resource
	private EtechComDao etechComDao;
}
