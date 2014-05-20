package com.etech.service;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 下载专区
 * */
@Service
public class DownloadZoneService {
	private static Log log = LogFactory.getLog(DownloadZoneService.class);
	@Resource
	private EtechComDao etechComDao;
}
