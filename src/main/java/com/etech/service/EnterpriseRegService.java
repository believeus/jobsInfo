package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 企业注册页
 * */
@Service
public class EnterpriseRegService {
	private static Log log = LogFactory.getLog(EnterpriseRegService.class);
	@Resource
	private EtechComDao etechComDao;
}
