package mydfs.storage.httpclient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.client.StorageClient;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

/*图片或视频数据输出*/
public class HttpStorageClient extends HttpServlet{

	private static final long serialVersionUID = -2163900148319741678L;
	WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		StorageClient storageClient=(StorageClient)context.getBean("storageClient");
		storageClient.outData(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
