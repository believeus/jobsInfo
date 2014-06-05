package mydfs.storage.client;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mydfs.storage.tracker.StorageTracker;

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
}
