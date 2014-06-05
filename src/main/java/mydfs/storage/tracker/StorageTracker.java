package mydfs.storage.tracker;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import mydfs.storage.server.StorageServer;

public class StorageTracker {
	private StorageServer storageServer;
	private String host;
	private int port;

	public String getHost() {
		return host;
	}

	public StorageServer getStorageServer() {
		return storageServer;
	}

	public void setStorageServer(StorageServer storageServer) {
		this.storageServer = storageServer;
	}

	public StorageTracker() {
	}

	public StorageTracker(String host, int port) {
		super();
		this.host = host;
		this.port = port;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	// 发送数据到服务端
	public String upload(final InputStream inputStream) {
		String storepath = new String();
		Socket socket;
		try {
			socket = new Socket(host, port);
			// 得到socket发送数据的输出流
			OutputStream out = socket.getOutputStream();
			DataOutputStream ps = new DataOutputStream(out);
			ps.writeUTF("upload");
			final BufferedOutputStream bos = new BufferedOutputStream(out);
			try {
				byte[] buf = new byte[1024];
				int len = 0;
				BufferedInputStream bis = new BufferedInputStream(inputStream);
				while ((len = bis.read(buf)) != -1) {
					bos.write(buf, 0, len);
					bos.flush();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			InputStream in = socket.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			storepath = br.readLine();
			System.out.println("file store path:" + storepath);
			socket.close();
			bos.close();
			ps.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return storepath;
	}

	public InputStream receiveData(String currenturl) {
		InputStream inputStream = null;
		try {
			Socket socket = receive(currenturl);
			inputStream = socket.getInputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return inputStream;
	}

	private Socket receive(String currenturl) {
		Socket socket = null;
		try {
			socket = new Socket(host, port);
			// 得到socket发送数据的输出流
			OutputStream out = socket.getOutputStream();
			DataOutputStream ps = new DataOutputStream(out);
			ps.writeUTF("receive");
			ps.flush();
			ps.writeUTF(currenturl);
			ps.flush();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return socket;
	}
}