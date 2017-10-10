package org.lf.admin.action.xwsj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年8月23日 下午2:27:32 
 * 日看点新闻Controller
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/rkdxw/")
public class RKDXWController {
	
	private final String ROOT_URL="admin/xwsj/rkdxw/";
	/**
	 * 日看点新闻上架
	 * @return
	 */
	@RequestMapping("rkdxwsjUI.do")
	public String gdxwsjUI () {
		return ROOT_URL+"rkdxwsjUI";
	}
	/**
	 * 日看点新闻审批
	 * @return
	 */
	@RequestMapping("rkdxwspUI.do")
	public String gdxwspUI () {
		return ROOT_URL+"rkdxwspUI";
	}
}
