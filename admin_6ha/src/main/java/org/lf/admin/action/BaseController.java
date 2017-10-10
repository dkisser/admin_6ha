package org.lf.admin.action;

import javax.servlet.http.HttpSession;

import org.lf.admin.db.pojo.User;
import org.lf.admin.service.sorcket.Constants;

/** * @author  wenchen 
 * @date 创建时间：2017年7月7日 下午2:41:33 
 * @version 1.0 
 * @parameter */
public class BaseController {
	
	public final String SUCCESS = "success";
	
	public String getUname (HttpSession session) {
		User preUser = getCurUser(session);
		return preUser == null ? null : preUser.getUname();
	}
	
	public User getCurUser (HttpSession session) {
		return (User) session.getAttribute(Constants.ADMIN_LOGIN_INFO);
	}
	
}
