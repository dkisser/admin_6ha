package org.lf.admin.service.model;

import java.util.Date;

/** * @author  wenchen 
 * @date 创建时间：2017年7月17日 下午3:31:45 
 * @version 1.0 
 * @parameter */
public class Recharge {

	private String userName;
	
	private Integer year;
	
	private Date czsj;
	
	private Integer num;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Date getCzsj() {
		return czsj;
	}

	public void setCzsj(Date czsj) {
		this.czsj = czsj;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	
}
