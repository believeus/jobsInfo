package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 专栏
 * */
@Service
public class SpecialSubjectService extends EtechBaseService{
	private static Log log = LogFactory.getLog(SpecialSubjectService.class);
	@Resource
	private EtechComDao etechComDao;
}
