package org.lf.admin.service;
/** * @author  wenchen 
 * @date 创建时间：2017年8月21日 下午4:09:43 
 * @version 1.0 
 * @parameter */
public enum TPLX {
	
	正经逛展会_大图(2),正经逛展会_小图(3),ShowGirl美女(4);
	
	private int value;

	private TPLX(int value) {
		this.value = value;
	}
	
	public int getValue(){
		return value;
	}
	

}
