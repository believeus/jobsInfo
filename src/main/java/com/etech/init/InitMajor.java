package com.etech.init;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.etech.entity.TmajorType;
import com.etech.service.EtechService;

@Component
public class InitMajor implements ApplicationListener<ApplicationEvent> {
	@Resource
	private EtechService etechService;
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextRefreshedEvent) {
			Properties props=new Properties();
			try {
				props.load(new InputStreamReader(InitMajor.class.getClassLoader().getResourceAsStream("major"), "UTF-8"));
				String result = props.getProperty("isInitmajor");
				System.out.println(result);
				if(result.equals("true")){
					String hql="DELETE FROM TmajorType";
					etechService.delete(hql);
					Set<Entry<Object,Object>> entrySet = props.entrySet();
					Iterator<Entry<Object, Object>> iterator = entrySet.iterator();
					while (iterator.hasNext()) {
						Map.Entry<Object,Object> entry = (Map.Entry<Object,Object>) iterator.next();
						String key = (String)entry.getKey();
						String value=(String)entry.getValue();
						if(key.equals("isInitmajor"))continue;
						TmajorType tmajorType=new TmajorType();
						tmajorType.setCodeId(Integer.parseInt(key));
						tmajorType.setName(value);
						etechService.saveOrUpdata(tmajorType);
					}
					props.setProperty("isInitmajor", "false");
					// 文件输出流
					String url=InitIndex.class.getClassLoader().getResource("major").toString().replace("file:", "");
					OutputStream fos = new FileOutputStream(url);
					OutputStreamWriter writer = new OutputStreamWriter(fos, "UTF-8");
					// 将Properties集合保存到流中
					props.store(writer, "");
					fos.close();// 关闭流
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


}
