package mydfs.storage.server;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StorageServer {

	private ServerSocket serverSocket;
	private ExecutorService executorService;
	// 本地监听端口
	private int port;
	private int workers;
	// 文件存放的基目录
	private String basepath;
	// 返回路径的前缀
	private String pathPrefix;

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getBasepath() {
		return basepath;
	}

	public void setBasepath(String basepath) {
		this.basepath = basepath;
	}

	public int getWorkers() {
		return workers;
	}

	public void setWorkers(int workers) {
		this.workers = workers;
	}

	public String getPathPrefix() {
		return pathPrefix;
	}

	public void setPathPrefix(String pathPrefix) {
		this.pathPrefix = pathPrefix;
	}

	public StorageServer() {
		this.pathPrefix = "group/M00";
	}

	public StorageServer(int port, String basepath, int workers) {
		this.port = port;
		this.workers = workers;
		this.basepath = basepath;
		// 指定前缀方便访问之用
		this.pathPrefix = "group/M00";
	}

	@SuppressWarnings("resource")
	public void startServer() throws IOException {
		// 初始化存储文件文件夹
		Folder.initFolder(basepath);
		serverSocket = new ServerSocket(port);
		executorService = Executors.newFixedThreadPool(workers);
		System.out.print("Storage Server start!");
		new Thread(new Runnable() {

			@Override
			public void run() {
				while (true) {
					try {
						final Socket socket = serverSocket.accept();
						//保存客户端上传的文件,并返回文件存储的路径给客户端
						// 每次接受一个客户端连接都执行一个线程
						executorService.execute(new Runnable() {

							@Override
							public void run() {
								try {
									InputStream in = socket.getInputStream();
									DataInputStream datais=new DataInputStream(in);
									String status = datais.readUTF();
									//获取文件数据
									if(status.equals("receive")){
										// 读取到请求的url
										String url = datais.readUTF();
										Pattern regex = Pattern.compile("/[A-Z0-9]{2}/[A-Z0-9]{2}/[A-Za-z0-9-]+\\.[a-z]+");
										Matcher matcher = regex.matcher(url);
										if(matcher.find()){
											String storepath=basepath+matcher.group();
											System.out.println("storepath:"+storepath);
											OutputStream outputStream = socket.getOutputStream();
											BufferedOutputStream bos=new BufferedOutputStream(outputStream);
											
											byte[] buf=new byte[1024];
											int len=0;
											File file=new File(storepath);
											InputStream inputStream=new FileInputStream(file);
											BufferedInputStream bis=new BufferedInputStream(inputStream);
											while ((len=bis.read(buf))!=-1) {
												bos.write(buf, 0, len);
												bos.flush();
											}
											System.out.println(url+" output success");
											bos.close();
										}
										return;
									}
									// 文件上传
									if(status.equals("upload")){
										String uuid = UUID.randomUUID().toString().toUpperCase();
										// 得到存储路径
										String storepath = Folder.getStoragePath(uuid);
										// 文件存储路径
										File file = new File(storepath);
										OutputStream out = new FileOutputStream(file);
										BufferedOutputStream bos = new BufferedOutputStream(out);
										// 获取文件流的大小
										int size = in.available();
										System.out.println("file size:" + size);
										// InputStreamReader将字节流转化为字符流
										BufferedInputStream br = new BufferedInputStream(in);
										// 读取客户端数据
										int len = 0;
										byte[] buf = new byte[1024];
										//客户端不关闭,br.read(buf);会一直等待,所以必须
										//手动判断退出循环
										switch (size % buf.length) {
										case 0:
											//文件是buf的整数
											int times = size / buf.length;
											for (int i = 0; i < times; i++) {
												len = br.read(buf);
												bos.write(buf, 0, len);
												bos.flush();
											}
											break;
										default:
											while ((len = br.read(buf)) != -1) {
												bos.write(buf, 0, len);
												bos.flush();
												// 客户端不关闭,永远读不到流的结尾
												////手动判断退出循环
												if (len < buf.length) {
													break;
												}
											}
											break;
										}
										// 获取文件的类型
										String fileType = FileType.getTypeByFile(file);
										if(fileType==null){
											fileType="txt";
										}
										storepath = storepath + "."+fileType ;
										System.out.println("disk path:"+storepath);
										// 将文件改名
										file.renameTo(new File(storepath));
										System.out.println("pathPrefix:"+pathPrefix);
										storepath=storepath.replaceAll(basepath, pathPrefix);
										System.out.println("access path:"+storepath);
										out = socket.getOutputStream();
										BufferedWriter pw = new BufferedWriter(new OutputStreamWriter(out));
										pw.write(storepath);
										pw.flush();
										bos.close();
										br.close();
										return;
									}
									// 删除StoreServer中的数据
									if(status.equals("remove")){
										boolean success=false;
										OutputStream out = socket.getOutputStream();
										DataOutputStream dataos = new DataOutputStream(out);
										// 读取到请求的url
										String url = datais.readUTF();
										Pattern regex = Pattern.compile("/[A-Z0-9]{2}/[A-Z0-9]{2}/[A-Za-z0-9-]+\\.[a-z]+");
										Matcher matcher = regex.matcher(url);
										if(matcher.find()){
											String storepath=basepath+matcher.group();
											System.out.println("file disk store path:"+storepath);
											File file=new File(storepath);
											if(file.exists()){
												success= file.delete();
											}
										}
										dataos.writeBoolean(success);
										dataos.flush();
										dataos.close();
										return;
									}
									
								} catch (IOException e) {
									e.printStackTrace();
								}
							}
						});
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			}
		}).start();

	}

	public void stopServer() {
		try {
			if (serverSocket != null) {
				serverSocket.close();
			}
			if (executorService != null) {
				executorService.shutdown();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}