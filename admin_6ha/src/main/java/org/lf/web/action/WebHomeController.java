package org.lf.web.action;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.WebUser;
import org.lf.admin.service.sorcket.Constants;
import org.lf.utils.StringUtils;
import org.lf.web.service.WebHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年8月7日 下午3:20:05 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/web/")
public class WebHomeController extends BaseController{
	
	@Autowired
	private WebHomeService webHomeService;
	
	private final String LOGIN_FAILED = "login_failed";

	private final String WEB_URL="6ha/home/";
	
	@RequestMapping("loginUI.do")
	public String loginUI() {
		return WEB_URL+"login";
	}
	
	@RequestMapping("main.do")
	public String main (Model model) {
		model.addAttribute("leftList", webHomeService.getLeftVrNews());
		model.addAttribute("middleList", webHomeService.getMiddleVrNews());
		model.addAttribute("rightList", webHomeService.getRightVrNews());
		model.addAttribute("newsList", webHomeService.getNewsList());
		model.addAttribute("bdyxList", webHomeService.getBDYXList());
		model.addAttribute("sgmvList", webHomeService.getSGMVList());
		model.addAttribute("dtkzList", webHomeService.getDTKZList());
		return WEB_URL+"loginUI";
	}
	
	/**
	 * true表示根据这个uname和password在数据库中可以查到一条记录
	 * @param uname
	 * @param password
	 * @return
	 */
	@RequestMapping("checkUpw.do")
	@ResponseBody
	public Boolean checkUpw(String uname,String password,HttpSession session) {
		Boolean is=false;
		password = StringUtils.toMD5(uname+password);
		WebUser u = new WebUser();
		u.setUname(uname);
		u.setPassword(password);
		WebUser user = webHomeService.getWebUser(u);
		if (user!=null) {
			is=true;
			session.setAttribute(Constants.USER_LOGIN_INFO, user);
		}
		return is;
	}
	
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String uname,String password,HttpSession session) {
		String result = SUCCESS;
		if (!checkUpw(uname, password,session)) {
			result=LOGIN_FAILED;
			return result;
		}
		return result;
	}
	
	@RequestMapping("/registUI.do")
	public String registUI(){
		return WEB_URL+"registUI";
	}
	
	/**
	 * true表示在数据库中已经存在该用户名
	 * @param uname
	 * @return
	 */
	@RequestMapping("checkUname.do")
	@ResponseBody
	public Boolean checkUname (String uname) {
		Boolean is = true;
		WebUser u = new WebUser();
		u.setUname(uname);
		WebUser user = webHomeService.getWebUser(u);
		if (user == null) {
			is = false;
		}
		return is;
	}
	
	@RequestMapping("regist.do")
	@ResponseBody
	public Boolean regist(WebUser user,HttpSession session){
		Boolean is = false;
		if (!checkUname(user.getUname())) {
			user.setPassword(StringUtils.toMD5(user.getUname()+user.getPassword()));
			is = webHomeService.insertWebUser(user);
			session.setAttribute(Constants.USER_LOGIN_INFO, user);
		}
		return is;
	}
}
