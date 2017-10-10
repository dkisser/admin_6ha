package org.lf.admin.action.tp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:07:43 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/tpcs/")
public class TPCSController {
	
	private final String ROOT_URL = "admin/tp/tpcs";
	
	/**
	 * 动态图片初审
	 * @return
	 */
	@RequestMapping("dttpcsUI.do")
	public String dttpcsUI() {
		return ROOT_URL+"/dttp/tpcsUI";
	}
	
	/**
	 * 普通图片初审
	 * @return
	 */
	@RequestMapping("pttpcsUI.do")
	public String pttpcsUI() {
		return ROOT_URL+"/pttp/tpcsUI";
	}
	
	
}