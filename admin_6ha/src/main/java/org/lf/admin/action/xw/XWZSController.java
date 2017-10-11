package org.lf.admin.action.xw;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.tw.TWSJService;
import org.lf.admin.service.tw.TWZSService;
import org.lf.admin.service.xw.XWZSService;
import org.lf.utils.EasyuiDatagrid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:11:23 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/xwzs/")
public class XWZSController extends BaseController{

	private final String ROOT_URL = "admin/xw/xwzs";
	
	@Autowired
	private TWZSService twzsService;
	
	@Autowired
	private TWSJService twsjService;
	
	@Autowired
	private XWZSService xwzsService;
	
	/**
	 * 滚动新闻终审
	 * @return
	 */
	@RequestMapping("gdxwzsUI.do")
	public String gdxwzsUI () {
		return ROOT_URL+"/gdxw/xwzsUI";
	}
	
	@RequestMapping("getGdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getGdxwList(HttpSession session,String sqr,String title,int page,int rows) {
		String glr = getUname(session);
		EasyuiDatagrid<VNews> newsList = null;
		try {
			newsList = twzsService.getZSnewsList(glr, sqr, title,XWLX.滚动新闻, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}
	
	@RequestMapping("previewGdxwUI.do")
	public String previewGdxwUI (Model model,Integer id) {
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/gdxw/previewUI";
	}
	

	/**
	 * 选择一个现有的滚动新闻替换下来
	 * @return
	 */
	@RequestMapping("chooseGdxwUI.do")
	public String chooseGdxwUI () {
		return ROOT_URL+"/gdxw/chooseUI";
	}
	
	/**
	 * 得到当前所有的正在上架中的滚动新闻
	 * @return
	 */
	@RequestMapping("chooseGdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> chooseGdxwList (int page,int rows) {
		return xwzsService.chooseGdxwList(page, rows);
	}
	
	/**
	 * 上架新闻
	 * @return
	 */
	@RequestMapping("groundGdxwNews.do")
	@ResponseBody
	public String groundGdxwNews(HttpSession session,String dm,String replaceDm) {
		String czr = getUname(session);
		try {
			xwzsService.groundGdxwNews(dm, czr, replaceDm);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 驳回滚动新闻申请
	 * @return
	 */
	@RequestMapping("revertGdxwUI.do")
	public String revertGdxwUI () {
		return ROOT_URL+"/gdxw/revertUI";
	}
	
	@RequestMapping("revertGdxw.do")
	@ResponseBody
	public String revertGdxw(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			xwzsService.revertGdxw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 日看点新闻终审
	 * @return
	 */
	@RequestMapping("rkdxwzsUI.do")
	public String rkdxwzsUI () {
		return ROOT_URL+"/rkdxw/xwzsUI";
	}
	
	@RequestMapping("getRkdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getRkdxwList(HttpSession session,String sqr,String title,int page,int rows) {
		String glr = getUname(session);
		EasyuiDatagrid<VNews> newsList = null;
		try {
			newsList = twzsService.getZSnewsList(glr, sqr, title,XWLX.日看点左侧新闻, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}
	
	@RequestMapping("previewRkdxwUI.do")
	public String previewRkdxwUI (Model model,Integer id) {
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/rkdxw/previewUI";
	}
	

	/**
	 * 选择一个现有的滚动新闻替换下来
	 * @return
	 */
	@RequestMapping("chooseRkdxwUI.do")
	public String chooseRkdxwUI () {
		return ROOT_URL+"/rkdxw/chooseUI";
	}
	
	/**
	 * 得到当前所有的正在上架中的滚动新闻
	 * @return
	 */
	@RequestMapping("chooseRkdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> chooseRkdxwList (int page,int rows) {
		return xwzsService.chooseRkdxwList(page, rows);
	}
	
	/**
	 * 上架新闻
	 * @return
	 */
	@RequestMapping("groundRkdxwNews.do")
	@ResponseBody
	public String groundRkdxwNews(HttpSession session,String dm,String replaceDm) {
		String czr = getUname(session);
		try {
			xwzsService.groundRkdxwNews(dm, czr, replaceDm);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 驳回滚动新闻申请
	 * @return
	 */
	@RequestMapping("revertRkdxwUI.do")
	public String revertRkdxwUI () {
		return ROOT_URL+"/rkdxw/revertUI";
	}
	
	@RequestMapping("revertRkdxw.do")
	@ResponseBody
	public String revertRkdxw(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			xwzsService.revertRkdxw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
}
