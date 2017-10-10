package org.lf.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

/** * @author  wenchen 
 * @date 创建时间：2017年8月29日 下午3:08:25 
 * @version 1.0 
 * @parameter */
public class AdminUtils {
	
	/**
	 * 上传图片
	 * @param filePath 上传图片的路径
	 * @param fileName 上传图片的名字
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static Boolean uploadMedia(String filePath,String fileName,MultipartFile file) throws IllegalStateException, IOException {
		File dir = new File(filePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		file.transferTo(new File(dir,fileName));
		File newFile = new File(filePath+"/"+fileName);
		if (!newFile.exists()) {
			return false;
		}
		return true;
	}
	/**
	 * 根据传入的bodyStr生成相应的html文件
	 * @param bodyStr html的body部分
	 * @param title	html的title部分
	 * @param filePath	html的存放位置
	 * @param fileName	html的名字
	 * @return	返回html在服务器上的相对路径
	 * @throws IOException
	 */
	public static void genHtml(String bodyStr,String title,String filePath,String fileName) throws IOException {
		StringBuilder resultSb = new StringBuilder();
		resultSb.append("<!DOCTYPE html><html><head><meta charset='utf-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'><title>");
		resultSb.append(title);
		resultSb.append("</title></head><body>");
		resultSb.append(bodyStr);
		resultSb.append("</body></html>");
		File dir = new File(filePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File file = new File(dir, fileName);
		file.createNewFile();
		FileOutputStream out = new FileOutputStream(file);
		out.write(resultSb.toString().getBytes("utf-8"));
		if (out != null) {
			out.flush();
			out.close();
		}
	}
}
