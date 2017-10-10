package org.lf.admin.action.xwsj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年8月23日 下午2:28:03 
 * 滚动新闻Controller
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/gdxw/")
public class GDXWController {
	
	private final String ROOT_URL="admin/xwsj/gdxw/";
	
	/**
	 * 滚动新闻上架
	 * @return
	 */
	@RequestMapping("gdxwsjUI.do")
	public String gdxwsjUI () {
		return ROOT_URL+"gdxwsjUI";
	}
	
	/**
	 * 滚动新闻审批
	 * @return
	 */
	@RequestMapping("gdxwspUI.do")
	public String gdxwspUI () {
		return ROOT_URL+"gdxwspUI";
	}

}
