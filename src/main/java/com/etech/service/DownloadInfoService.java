package com.etech.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

/**
 * 下载详情
 * */
@Service
public class DownloadInfoService {
	private static Log log = LogFactory.getLog(DownloadInfoService.class);
	@Resource
	private EtechComDao etechComDao;
}
