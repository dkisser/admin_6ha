package org.lf.admin.action.tp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:07:43 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/tpsj/")
public class TPSJController {
	
	private final String ROOT_URL = "admin/tp/tpsj";
	
	/**
	 * 动态图片上架
	 * @return
	 */
	@RequestMapping("dttpsjUI.do")
	public String dttpsjUI() {
		return ROOT_URL+"/dttp/tpsjUI";
	}
	
	/**
	 * 普通图片上架
	 * @return
	 */
	@RequestMapping("pttpsjUI.do")
	public String pttpsjUI() {
		return ROOT_URL+"/pttp/tpsjUI";
	}
	
}
