package org.lf.admin.action.xw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:11:23 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/xwzs/")
public class XWZSController {

	private final String ROOT_URL = "admin/xw/xwzs";
	
	/**
	 * 滚动新闻终审
	 * @return
	 */
	@RequestMapping("gdxwzsUI.do")
	public String gdxwzsUI () {
		return ROOT_URL+"/gdxw/xwzsUI";
	}
	
	/**
	 * 日看点新闻终审
	 * @return
	 */
	@RequestMapping("rkdxwzsUI.do")
	public String rkdxwzsUI () {
		return ROOT_URL+"/rkdxw/xwzsUI";
	}
	
}
