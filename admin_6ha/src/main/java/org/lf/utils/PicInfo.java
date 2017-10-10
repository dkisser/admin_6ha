package org.lf.utils;
/** * @author  wenchen 
 * @date 创建时间：2017年8月29日 下午3:07:02 
 * @version 1.0 
 * @parameter */
public class PicInfo {

	private String src;
	
	private String title;
	
	private String picName;

	public PicInfo (String src){
		this.src = src;
	}
	
	public PicInfo (String src,String title) {
		this(src);
		this.title = title;
	}
	
	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}
	
}
