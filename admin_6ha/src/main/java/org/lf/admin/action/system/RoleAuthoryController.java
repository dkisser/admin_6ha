package org.lf.admin.action.system;

import org.lf.admin.db.pojo.CGroup;
import org.lf.admin.service.system.RoleService;
import org.lf.utils.EasyuiDatagrid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年8月14日 下午3:12:28 
 * @version 1.0 
 * @parameter */
@Controller()
@RequestMapping("/admin/system/")
public class RoleAuthoryController {
	
	private final String ROOT_URL="admin/system";
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("roleAuthoryUI.do")
	public String roleAuthoryUI () {
		return ROOT_URL+"/roleAuthory/roleAuthoryUI";
	}
	
	@RequestMapping("dutyUI.do")
	public String dutyUI () {
		return ROOT_URL+"/duty/dutyUI";
	}
	
	@RequestMapping("getDutyList.do")
	@ResponseBody
	public EasyuiDatagrid<CGroup> getDutyList (int page,int rows) {
		return roleService.getDutyList(page, rows);
	}
	
	
	
}
