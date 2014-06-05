package mydfs.storage.client;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.tracker.StorageTracker;

/**
 * @author wuqiwei
 * Email 1058633117@qq.com
 * Data   2014-06-05
 * AddReason 文件上传会出现视频和附件这些比较大的文件
 * 			 并且,并且后期tomcat进行集群的时候，访问
 * 			 公共图片数据的时候，常规的方式出现访问
 * 			 上的烦人事,数据迁移的时候变得困难。
 *           故自己写了一个文件管理系统，管理上传的文件
 * */
//负责将文件输出到浏览器
public class StorageClient {
	private StorageTracker storageTracker;
	
	public StorageTracker getStorageTracker() {
		return storageTracker;
	}

	public void setStorageTracker(StorageTracker storageTracker) {
		this.storageTracker = storageTracker;
	}


	public void outData(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("storageTracker:"+storageTracker.hashCode());
		String url = req.getRequestURL().toString();
		InputStream inputStream = storageTracker.receiveData(url);
		BufferedInputStream bis = new BufferedInputStream(inputStream);
		if(url.contains(".swf"))resp.setContentType("application/x-shockwave-flash");
		else resp.setContentType("image/*");
		OutputStream os = resp.getOutputStream();
		BufferedOutputStream out = new BufferedOutputStream(os);
		byte[] buf = new byte[1024];
		int len;
		while((len = bis.read(buf)) > 0){
			out.flush();
			out.write(buf, 0, len);
		}
		out.flush();
		bis.close();
		out.close();
	}
	public String upload(InputStream inputStream,String fileSuffix){
		String storepath = storageTracker.upload(inputStream, fileSuffix);
		return storepath;
	}
}
