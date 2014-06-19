package com.etech.init;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import mydfs.storage.server.MydfsStorageServer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;


@Component
public class DestroyMydfsStoreServer implements ServletContextListener{
	private static final Log log=LogFactory.getLog(DestroyMydfsStoreServer.class);
	@Resource
	private MydfsStorageServer mydfsStorageServer;
	//项目卸载的时停止mydfsStorageServer
	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		mydfsStorageServer.stopServer();
		log.debug("mydfsStorageServer.stopServer()");
	}
	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		
	}

}
