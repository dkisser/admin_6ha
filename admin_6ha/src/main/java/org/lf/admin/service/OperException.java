package org.lf.admin.service;

import com.alibaba.fastjson.JSONObject;

/**
 * * @author wenchen
 * 
 * @date 创建时间：2017年7月10日 下午1:19:59
 * @version 1.0
 * @parameter
 */
public class OperException extends Exception {

	private static final long serialVersionUID = -5359029302884840656L;
	
	private OperErrCode errCode;
	
	public OperException (OperErrCode errCode) {
		super(errCode.getCode()+":"+errCode.getMsg());
		this.errCode = errCode;
	}
	
	public OperException(String code, String msg) {
		super(code + ": " + msg);
		this.errCode = new OperErrCode(code, msg);
	}
	
	public OperException (JSONObject json) {
		this(json.get(OperErrCode.ERR_CODE).toString(),json.get(OperErrCode.ERR_MSG).toString());
	}
	
	@Override
	public String getMessage() {
		return errCode.getMsg();
	}

}
