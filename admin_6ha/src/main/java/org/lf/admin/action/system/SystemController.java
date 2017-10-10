package org.lf.admin.action.system;

import java.math.BigDecimal;
import java.util.List;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.dao.UserMapper;
import org.lf.admin.db.pojo.User;
import org.lf.admin.service.HomeService;
import org.lf.admin.service.OperException;
import org.lf.admin.service.RoleInfo;
import org.lf.admin.service.system.SystemService;
import org.lf.utils.EasyuiComboBoxItem;
import org.lf.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * * @author wenchen
 * 
 * @date 创建时间：2017年7月5日 上午10:27:05
 * @version 1.0
 * @parameter
 */
@Controller
@RequestMapping("/admin/system/")
public class SystemController extends BaseController {

	private final String ROOT_URL = "admin/system/";

	@Autowired
	private HomeService homeService;

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private UserMapper userDao;

	
	@RequestMapping("userCUI.do")
	public String userCUI(Model model) {
		model.addAttribute("role", RoleInfo.普通用户.getValue());
		return ROOT_URL + "userC";
	}

	@RequestMapping("getUserFuzzy.do")
	@ResponseBody
	public List<User> getUserFuzzy(User user) {
		return systemService.getUserFuzzy(user);
	}
	
	@RequestMapping("getUserList.do")
	@ResponseBody
	public List<User> getUserList () {
		return homeService.getUserList(null);
	}
	
	@RequestMapping("addUserInfoCUI.do")
	public String addUserInfoCUI(Integer role, Model model) {
		model.addAttribute("role", role);
		return ROOT_URL + "insertUserC";
	}

	@RequestMapping("getRoleCombo.do")
	@ResponseBody
	public List<EasyuiComboBoxItem> getRoleCombo() {
		return systemService.getRoleCombo();
	}
	
	@RequestMapping("getRoleComboWithAll.do")
	@ResponseBody
	public List<EasyuiComboBoxItem> getRoleComboWithAll() {
		return systemService.getRoleComboWithAll();
	}

	@RequestMapping("checkUserByUname.do")
	@ResponseBody
	public String checkUserByUname(String uname,Integer role) {

		String resultStr = SUCCESS;
		if (StringUtils.isEmpty(uname)) {
			resultStr = "用户名不能为空!";
			return resultStr;
		}
		User user = new User();
		user.setUname(uname.trim());
		user.setRole(role);
		if (homeService.countUserList(user) > 0) {
			resultStr = "该用户名已存在，请换一个!";
		}

		return resultStr;
	}

	@RequestMapping("checkUserAge.do")
	@ResponseBody
	public String checkUserAge(String age) {

		String resultStr = SUCCESS;
		BigDecimal compareAge;
		try {
			compareAge = new BigDecimal(age);
		} catch (Exception e) {
			return resultStr;
		}
		BigDecimal compareNum = new BigDecimal("0");
		if (compareAge.compareTo(compareNum) == 1) {
			return resultStr;
		} else {
			resultStr = "年龄必须大于0!";
			return resultStr;
		}

	}

	@RequestMapping("addUserInfoC.do")
	@ResponseBody
	public String addUserInfoC(String uname, String petname, String sex,
			String age, String email, String phone, Integer role) {
		
		String resultStr = checkUserByUname(uname,role);
		if (!resultStr.equals(SUCCESS)) {
			return resultStr;
		}
		resultStr = checkUserAge(age);
		if (!resultStr.equals(SUCCESS)) {
			return resultStr;
		}
		User user = new User ();
		user.setUname(uname);
		user.setPetname(petname);
		user.setSex(sex);
		user.setAge(Integer.parseInt(age));
		user.setEmail(email);
		user.setPhone(phone);
		user.setRole(role);
		try {
			systemService.insertUser(user);
			return SUCCESS;
		} catch (OperException e) {
			resultStr = e.getMessage();
			return resultStr;
		}

	}

	@RequestMapping("editUserInfoCUI.do")
	public String editUserInfoCUI(Integer role, String uname, Model model) {
		model.addAttribute("role", role);
		model.addAttribute("editUser", homeService.getUserByUname(uname));
		return ROOT_URL + "editUserC";
	}
	
	@RequestMapping("editUserInfoC.do")
	@ResponseBody
	public String editUserInfoC(String uname,String sex, String email,Integer age, String phone,Integer role) {
		
		String resultStr = SUCCESS;
		User user = new User();
		user.setUname(uname);
		user.setSex(sex);
		user.setEmail(email);
		user.setPhone(phone);
		user.setRole(role);
		user.setAge(age);
		resultStr = checkUserAge(age.toString());
		try {
			userDao.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			return e.getMessage();
		}
		return resultStr;
	}

	@RequestMapping("delUserInfo.do")
	@ResponseBody
	public String delUserInfo(String uname) {
		userDao.deleteByPrimaryKey(uname);
		return SUCCESS;
	}

}
