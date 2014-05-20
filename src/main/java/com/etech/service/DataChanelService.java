package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 数据频道
 * */
@Service
public class DataChanelService {
	private static Log log = LogFactory.getLog(DataChanelService.class);
	@Resource
	private EtechComDao etechComDao;
}
