package org.lf.admin.service.sorcket.ws;

import org.lf.admin.service.sorcket.message.ServerMsgType;
import org.lf.utils.socket.annotation.Param;
import org.lf.utils.socket.message.MessageHelper;

import com.alibaba.fastjson.JSONObject;

/** * @author  wenchen 
 * @date 创建时间：2017年7月26日 下午4:34:09 
 * @version 1.0 
 * @parameter */
public class WebSocketService {

	public void sayHello (@Param("pid")Integer id,@Param("id")Integer pid) {
		System.out.println("hello!");
	}
	
	public JSONObject toBaidu () {
		return MessageHelper.parseURL("/MyJsp.jsp", ServerMsgType.页面跳转.getValue());
	}
	
}
