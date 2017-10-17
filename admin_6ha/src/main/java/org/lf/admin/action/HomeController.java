package org.lf.admin.action;

import javax.servlet.http.HttpSession;

import org.lf.admin.db.pojo.User;
import org.lf.admin.service.HomeService;
import org.lf.admin.service.sorcket.Constants;
import org.lf.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/** * @author  wenchen 
 * @date 创建时间：2017年7月5日 上午10:27:05 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/")
public class HomeController extends BaseController{
	
	private final String ADMIN_URL = "admin/home/"; 
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping("main.do")
	public String main () {
		return "main";
	}
	
	@RequestMapping("loginUI.do")
	public String loginUI () {
		return ADMIN_URL + "login";
	}
	
	@RequestMapping("welcome.do")
	public String welcome () {
		return ADMIN_URL+"welcome";
	}

	@RequestMapping("loginAction.do")
	@ResponseBody
	public JSONObject loginAction (String uname,String upw,HttpSession session) {
		JSONObject resutlObj = new JSONObject();
		User user = new User();
		user.setUname(uname);
		User preUser = homeService.getUser(user);
		if (preUser != null) {
			String checkUpw = StringUtils.toMD5(preUser.getUname()+upw);
			if (checkUpw.equals(preUser.getPassword())) {
				session.setAttribute(Constants.ADMIN_LOGIN_INFO, preUser);
				resutlObj.put(SUCCESS, true);
			}else{
				resutlObj.put(SUCCESS, false);
			}
		} else {
			resutlObj.put(SUCCESS, false);
		}
		return resutlObj;
	}
	
	@RequestMapping("getMenuByUname.do")
	@ResponseBody
	public JSONArray getMenuByUname (String uname) {
		return homeService.getMenuByUname(uname);
	}
	
	@RequestMapping("quit.do")
	public String quit (HttpSession session) {
		session.setAttribute(Constants.ADMIN_LOGIN_INFO, null);
		return loginUI();
	}
	
	@RequestMapping("currUser.do")
	public String currUser (HttpSession session) {
		return ADMIN_URL+"currUser";
	}
	
	@RequestMapping("updatePwdUI.do")
	public String updatePwdUI (HttpSession session) {
		return ADMIN_URL+"updatePwd";
	}
	
	@RequestMapping("updateUpwAction.do")
	@ResponseBody
	public JSONObject updateUpwAction(String uname,String old_upw,String new_upw) {
		JSONObject obj = new JSONObject();
		User user = new User();
		user.setUname(uname);
		User preUser = homeService.getUser(user);
		String checkUpw =StringUtils.toMD5(uname+old_upw);
		if (checkUpw.equals(preUser.getPassword())) {
			preUser.setPassword(StringUtils.toMD5(uname+new_upw));
			homeService.updateUser(preUser);
			obj.put(SUCCESS, true);
		} else {
			obj.put(SUCCESS, false);
		}
		return obj;
	}
	
	@RequestMapping("resetUpw.do")
	@ResponseBody
	public String resetUpw (String uname) {
		User curUser = homeService.getUserByUname(uname);
		String resultStr = SUCCESS;
		if (curUser==null) {
			resultStr = "该用户不存在！";
			return resultStr;
		} else {
			curUser.setPassword(StringUtils.toMD5(curUser.getUname()+"123456"));
			homeService.updateUser(curUser);
			return resultStr;
		}
		
	}

	@RequestMapping("getTestJson.do")
	@ResponseBody
	public String getTestJson (String callback) {
		JSONArray arr = (JSONArray) JSONArray.toJSON(homeService.getTestJson());
		return callback + "("+arr+")";
	}
	
}
