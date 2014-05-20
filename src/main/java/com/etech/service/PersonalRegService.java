package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 个人注册页
 * */
@Service
public class PersonalRegService {
	private static Log log = LogFactory.getLog(PersonalRegService.class);
	@Resource
	private EtechComDao etechComDao;
}
