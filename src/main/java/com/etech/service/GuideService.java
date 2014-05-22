package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 工作指南
 * */
@Service
public class GuideService extends BaseService{
	private static Log log = LogFactory.getLog(GuideService.class);
	@Resource
	private EtechComDao etechComDao;
}
