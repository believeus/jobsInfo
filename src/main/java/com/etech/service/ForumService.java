package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 论坛
 * */
@Service
public class ForumService {
	private static Log log = LogFactory.getLog(ForumService.class);
	@Resource
	private EtechComDao etechComDao;
}
