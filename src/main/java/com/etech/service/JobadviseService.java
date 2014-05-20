package com.etech.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 职业咨询
 * */
@Service
public class JobadviseService {
	private static Log log = LogFactory.getLog(JobadviseService.class);
	@Resource
	private EtechComDao etechComDao;
}
