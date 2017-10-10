package org.lf.admin.action.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年8月14日 下午3:12:28 
 * @version 1.0 
 * @parameter */
@Controller()
@RequestMapping("/system/")
public class RoleAuthoryController {
	
	private final String ROOT_URL="admin/system/";
	
	@RequestMapping("roleAuthoryUI.do")
	public String roleAuthoryUI () {
		return ROOT_URL+"roleAuthoryUI";
	}
	
}
