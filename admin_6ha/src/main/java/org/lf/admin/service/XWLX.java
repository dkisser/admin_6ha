package org.lf.admin.service;
/** * @author  wenchen 
 * @date 创建时间：2017年8月18日 下午1:18:09 
 * @version 1.0 
 * @parameter */
public enum XWLX {
	日看点左侧新闻(1001),小图文(1002),大图文(1003),滚动新闻(2001);
	
	private int value;
	
	private XWLX (int value) {
		this.value = value;
	}

	public int getValue(){
		return value;
	}
	public static XWZT valueOf(int value) {
		return XWZT.values()[value];
	}
}
