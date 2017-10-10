package org.lf.utils;
/** * @author  wenchen 
 * @date 创建时间：2017年8月29日 下午3:05:05 
 * @version 1.0 
 * @parameter */
public class LayEdit {

	private Integer code;//0表示成功，其他表示失败
	
	private String msg;//上传失败的提示信息
	
	private PicInfo data;//图片的信息（url，以及名称等）

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public PicInfo getData() {
		return data;
	}

	public void setData(PicInfo data) {
		this.data = data;
	}
	
}
