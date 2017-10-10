package org.lf.admin.action.tpsj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年8月23日 下午2:29:03 
 * 普通图片Controller
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/pttp/")
public class PTTPController {

	private final String ROOT_URL = "admin/tpsj/pttp/";
	
	/**
	 * 普通图片上架
	 * @return
	 */
	@RequestMapping("pttpsjUI.do")
	public String pttpsjUI() {
		return ROOT_URL+"pttpsjUI";
	}
	/**
	 * 普通图片审批
	 * @return
	 */
	@RequestMapping("pttpspUI.do")
	public String pttpspUI () {
		return ROOT_URL+"pttpspUI";
	}
	
}
