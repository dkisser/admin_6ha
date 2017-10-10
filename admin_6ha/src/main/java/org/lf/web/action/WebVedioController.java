package org.lf.web.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** * @author  wenchen 
 * @date 创建时间：2017年8月9日 上午11:53:20 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/web/vedio/")
public class WebVedioController {
	
	private final String WEB_URL="6ha/vedio/";
	
	@RequestMapping("vedioUI.do")
	public String vedioUI(){
		return WEB_URL+"vedioUI";
	}

}
