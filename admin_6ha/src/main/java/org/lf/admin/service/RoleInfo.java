package org.lf.admin.service;


/** * @author  wenchen 
 * @date 创建时间：2017年7月6日 下午1:44:10 
 * @version 1.0 
 * @parameter */
public enum RoleInfo {
	
	普通用户(1),VIP用户(2),管理员用户(3),超级管理员(4);
	
	private int value;
	
	private RoleInfo(int value) {
		this.value = value;
	}
	
	public int getValue() {
		return value;
	}
	
	public static RoleInfo valueOf(int value) {
		return RoleInfo.values()[value];
	}
}
