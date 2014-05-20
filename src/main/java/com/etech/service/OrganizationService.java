package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 内设机构
 * */
@Service
public class OrganizationService {
	private static Log log = LogFactory.getLog(OrganizationService.class);

	@Resource
	private EtechComDao etechComDao;
}
