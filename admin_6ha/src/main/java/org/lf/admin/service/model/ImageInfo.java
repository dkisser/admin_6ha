package org.lf.admin.service.model;
/** * @author  wenchen 
 * @date 创建时间：2017年8月16日 下午5:09:35 
 * @version 1.0 
 * @parameter */
public class ImageInfo {
	
	private String name;
	
	private String imgUrl;
	
	private String href;
	
	private String date;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "ImageInfo [name=" + name + ", imgUrl=" + imgUrl
				+ ", href=" + href + ", date=" + date + "]";
	}
	
}
