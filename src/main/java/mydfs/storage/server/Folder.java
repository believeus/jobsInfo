package mydfs.storage.server;

import java.io.File;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Folder {
	private static Log log=LogFactory.getLog(Folder.class);
	private static String[] varchar={
				"0","1","2","3","4",
				"5","6","7","8","9",
				"A","B","C","D","E","F"};
	public static String basepath;
	
	public static void initFolder(String basepath){
		Folder.basepath=basepath;
		//创建失败
		File file=new File(basepath);
		if(!file.exists()&&!file.mkdirs())
		  throw new RuntimeException("folder create error.do you hava authority create folder ?");
		//创建子文件夹
		try{
			createSubFolder(file);
			File[] subFolders = file.listFiles();
			for (int i = 0; i < subFolders.length; i++) {
				createSubFolder(subFolders[i]);
			}
			log.debug("Success:all folder create success");
		}catch(Exception ex){
			log.debug("Error:folder create error.error message:"+ex.getMessage());
		}
	}
	
	//创建子文件夹
	private static void createSubFolder(File file) {
		String subfolder;
		for (int i = 0; i < varchar.length; i++) {
			for(int j=0;j<varchar.length;j++){
				subfolder=file.getAbsolutePath()+"/"+varchar[i]+varchar[j];
				//创建子文件夹
				File dfsFile=new File(subfolder);
				if(!dfsFile.exists()&&dfsFile.mkdirs())
				log.debug("create mydfs subfolder:"+dfsFile.getAbsolutePath());
			}
		}
	}
	public static String getStoragePath(String md5){
    	String subfolder1 = md5.substring(0, 2).toUpperCase();
    	String subfolder2 = md5.substring(2, 4).toUpperCase();
    	String fileName=md5.substring(4);
    	return basepath+"/"+subfolder1+"/"+subfolder2+"/"+fileName;
	}
}
