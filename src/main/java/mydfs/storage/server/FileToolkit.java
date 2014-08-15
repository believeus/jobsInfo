package mydfs.storage.server;
import java.io.*;

/**
* 纯Java文件操作工具，支持文件、文件夹的复制、删除、移动操作。
*
* @author leizhimin 2010-6-2 16:12:14
*/
public class FileToolkit {
        public FileToolkit() {
        }

        /**文件重命名*/
        public static boolean reName(File srcFile, File desFile) {  
            try {
            	String fileFrom=srcFile.getAbsolutePath();
            	String fileTo=desFile.getAbsolutePath();
                FileInputStream in = new java.io.FileInputStream(fileFrom);  
                FileOutputStream out = new FileOutputStream(fileTo);  
                byte[] buf = new byte[1024];  
                int count;  
                while ((count = in.read(buf)) > 0) {  
                    out.write(buf, 0, count);  
                }  
                in.close();
                out.close(); 
                srcFile.setWritable(true);
                srcFile.delete();
                return true;  
            } catch (IOException ex) {  
                return false;  
            }  
        } 

}