package org.lf.admin.action.twsj;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.tw.TWSJService;
import org.lf.admin.service.tw.TWZSService;
import org.lf.utils.EasyuiDatagrid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年9月1日 上午11:04:08 
 * @version 1.0 
 * @parameter */
@Controller()
@RequestMapping("/admin/twzs/")
public class TWZSController extends BaseController{

	private final String ROOT_URL = "admin/tw/twzs";
	
	@Autowired
	private TWZSService twzsService;
	
	@Autowired
	private TWSJService twsjService;
	
	/**
	 * 大图文终审
	 * @return
	 */
	@RequestMapping("dtwzsUI.do")
	public String dtwzsUI () {
		return ROOT_URL+"/dtw/dtwzsUI";
	}
	
	@RequestMapping("getDtwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getDtwList(HttpSession session,String sqr,String title,int page,int rows) {
		String glr = getUname(session);
		EasyuiDatagrid<VNews> newsList = null;
		try {
			newsList = twzsService.getZSnewsList(glr, sqr, title,XWLX.大图文, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}
	
	@RequestMapping("previewDtwUI.do")
	public String previewDtwUI (Model model,Integer id) {
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/dtw/previewDtwUI";
	}
	
	/**
	 * 提交至终审
	 * @return
	 */
	@RequestMapping("groundNews.do")
	@ResponseBody
	public String groundNews(HttpSession session,String dm) {
		String czr = getUname(session);
		try {
			twzsService.groundNews(dm,czr);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 驳回大图文申请
	 * @return
	 */
	@RequestMapping("revertDtwUI.do")
	public String revertDtwUI () {
		return ROOT_URL+"/dtw/revertDtwUI";
	}
	
	@RequestMapping("revert.do")
	@ResponseBody
	public String revert(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			twzsService.revert(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	
	/**
	 * 小图文终审
	 * @return
	 */
	@RequestMapping("xtwzsUI.do")
	public String xtwzsUI () {
		return ROOT_URL+"/xtw/xtwzsUI";
	}
	
	@RequestMapping("getXtwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getXtwList(HttpSession session,String sqr,String title,int page,int rows) {
		String glr = getUname(session);
		EasyuiDatagrid<VNews> newsList = null;
		try {
			newsList = twzsService.getZSnewsList(glr, sqr, title,XWLX.小图文, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}
}
