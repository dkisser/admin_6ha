package org.lf.admin.action.tpsj;

import org.lf.admin.action.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年8月23日 下午2:29:37 
 * 动态图片Controller
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/dttp/")
public class DTTPController extends BaseController{

	private final String ROOT_URL = "admin/tpsj/dttp/";
	
	/**
	 * 动态图片上架
	 * @return
	 */
	@RequestMapping("dttpsjUI.do")
	public String dttpsjUI() {
		return ROOT_URL+"dttpsjUI";
	}
	/**
	 * 动态图片审批
	 * @return
	 */
	@RequestMapping("dttpspUI.do")
	public String dttpspUI () {
		return ROOT_URL+"dttpspUI";
	}
}
