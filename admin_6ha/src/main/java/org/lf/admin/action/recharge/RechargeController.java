package org.lf.admin.action.recharge;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年7月18日 上午11:39:31 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/recharge/")
public class RechargeController {

	private final String ROOT_RUL = "admin/recharge/";
	
	@RequestMapping("rechargeUI.do")
	public String rechargeUI () {
		return ROOT_RUL + "rechargeUI";
	}
	
}
