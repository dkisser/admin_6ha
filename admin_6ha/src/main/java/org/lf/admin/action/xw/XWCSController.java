package org.lf.admin.action.xw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:11:23 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/xwcs/")
public class XWCSController {

	private final String ROOT_URL = "admin/xw/xwcs";
	
	/**
	 * 滚动新闻初审
	 * @return
	 */
	@RequestMapping("gdxwcsUI.do")
	public String gdxwcsUI () {
		return ROOT_URL+"/gdxw/xwcsUI";
	}
	
	/**
	 * 日看点新闻初审
	 * @return
	 */
	@RequestMapping("rkdxwcsUI.do")
	public String rkdxwcsUI () {
		return ROOT_URL+"/rkdxw/xwcsUI";
	}
	
}
