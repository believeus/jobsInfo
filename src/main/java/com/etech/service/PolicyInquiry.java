package com.etech.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 政策查询
 * */
@Service
public class PolicyInquiry {
	private static Log log = LogFactory.getLog(PolicyInquiry.class);

	@Resource
	private EtechComDao etechComDao;
}
