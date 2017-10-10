package org.lf.admin.action.count;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.service.count.CountService;
import org.lf.admin.service.model.Recharge;
import org.lf.utils.EasyuiComboBoxItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年7月5日 上午10:27:05 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/count/")
public class CountController extends BaseController{

	private final String ROOT_URL = "admin/count/";
	
	@Autowired
	private CountService countService;
	
	@RequestMapping("countRechargeUI.do")
	public String countRechargeUI () {
		return ROOT_URL+"countRechargeUI";
	}
	
	@RequestMapping("getRechargeInfo.do")
	@ResponseBody
	public List<Recharge> getRechargeInfo (HttpSession session,Recharge recharge) {
		String uname = getUname(session);
		recharge.setUserName(uname);
		return countService.getRechargeInfo(recharge);
	}
	
	@RequestMapping("getRechargeYearMC.do")
	@ResponseBody
	public List<EasyuiComboBoxItem> getRechargeYearMC (HttpSession session) {
		String uname = getUname(session);
		return countService.getRechargeYearMC(uname);
	}
	
}
