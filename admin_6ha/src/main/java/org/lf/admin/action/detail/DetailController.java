package org.lf.admin.action.detail;

import java.util.List;

import org.lf.admin.db.pojo.User;
import org.lf.admin.service.HomeService;
import org.lf.admin.service.RoleInfo;
import org.lf.admin.service.system.SystemService;
import org.lf.utils.EasyuiComboBoxItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年7月5日 上午10:27:05 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/detail/")
public class DetailController {
	
	@Autowired
	private HomeService homeService;
	
	@Autowired
	private SystemService systemService;

	private final String ROOT_URL = "admin/detail/";
	
	@RequestMapping("userDetailUI.do")
	public String userDetailUI(Model model) {
		model.addAttribute("role", RoleInfo.普通用户.getValue());
		return ROOT_URL + "userDetail";
	}

	@RequestMapping("adminDetailUI.do")
	public String adminDetailUI(Model model) {
		model.addAttribute("role", RoleInfo.管理员用户.getValue());
		return ROOT_URL + "adminDetail";
	}
	
	@RequestMapping("vipDetailUI.do")
	public String vipDetailUI(Model model) {
		model.addAttribute("role", RoleInfo.VIP用户.getValue());
		return ROOT_URL + "vipDetail";
	}
	
	@RequestMapping("getUserList.do")
	@ResponseBody
	public List<User> getUserList (Integer role) {
		User user = new User();
		user.setRole(role);
		return homeService.getUserList(user);
	}
	
	@RequestMapping("getUserFuzzy.do")
	@ResponseBody
	public List<User> getUserFuzzy(User user) {
		return systemService.getUserFuzzy(user);
	}
	

	@RequestMapping("getRoleCombo.do")
	@ResponseBody
	public List<EasyuiComboBoxItem> getRoleCombo() {
		return systemService.getRoleCombo();
	}
}
