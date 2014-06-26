package com.etech.init;

import java.io.FileOutputStream;
import java.util.Properties;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;


@Component
public class InitIndex implements ApplicationListener<ApplicationEvent>{
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if(event instanceof ContextRefreshedEvent){
			try {
				Properties props = PropertiesLoaderUtils.loadAllProperties("jobs.properties");
				String result = props.getProperty("isInitIndex");
				if(result.equals("true")){
					FullTextSession fullTextSession = Search.getFullTextSession(sessionFactory.getCurrentSession());  
					fullTextSession.createIndexer().startAndWait();
					props.setProperty("isInitIndex", "false");
					// 文件输出流
					String url=InitIndex.class.getClassLoader().getResource("jobs.properties").toString().replace("file:", "");
					FileOutputStream fos = new FileOutputStream(url);
					// 将Properties集合保存到流中
					props.store(fos, "");
					fos.close();// 关闭流 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}  
		}
	}

}
