package org.lf.admin.service;


/** * @author  wenchen 
 * @date 创建时间：2017年8月22日 下午2:54:51 
 * @version 1.0 
 * @parameter */
public enum XWZT {

	一审中(1),二审中(2),上架中(3),已过期(4),一审未通过(5),二审未通过(6),编辑中(7);
	
	private int value;

	private XWZT(int value) {
		this.value = value;
	}
	
	public int getValue() {
		return value;
	}
	
	public static XWZT valueOf(int value) {
		return XWZT.values()[value];
	}
}
