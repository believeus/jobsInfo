package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 局领导
 * */
@Service
public class LeaderService {
	private static Log log = LogFactory.getLog(LeaderService.class);

	@Resource
	private EtechComDao etechComDao;
}
