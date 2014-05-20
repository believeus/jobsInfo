package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 网上展示厅
 * */
@Service
public class OnlineShowService {
	private static Log log = LogFactory.getLog(OnlineShowService.class);

	@Resource
	private EtechComDao etechComDao;
}
