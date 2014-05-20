package com.etech.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 政策咨询
 * */
@Service
public class PolicyAdviceService {
	private static Log log = LogFactory.getLog(PolicyAdviceService.class);

	@Resource
	private EtechComDao etechComDao;
}
