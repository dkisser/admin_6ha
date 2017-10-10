package org.lf.admin.action.xw;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.tw.TWSJService;
import org.lf.admin.service.xw.XWSJService;
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
@RequestMapping("/admin/xwsj/")
public class XWSJController extends BaseController{

	private final String ROOT_URL = "admin/xw/xwsj";
	
	@Autowired
	private TWSJService twsjService;
	
	@Autowired
	private XWSJService xwsjService;
	
	/**
	 * 滚动新闻上架
	 * @return
	 */
	@RequestMapping("gdxwsjUI.do")
	public String gdxwsjUI () {
		return ROOT_URL+"/gdxw/xwsjUI";
	}
	
	@RequestMapping("getGdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getGdxwList(HttpSession session,int page,int rows) {
		VNews news = new VNews();
		news.setLx(XWLX.滚动新闻.getValue());
		news.setSqr(getUname(session));
		return twsjService.newsList(news, rows, page);
	}
	
	/**
	 * 滚动新闻上架-删除
	 * @param twdm
	 * @return
	 */
	@RequestMapping("delGdxw.do")
	@ResponseBody
	public String delDtw(String dm) {
		try {
			xwsjService.delGdxw(dm);
		} catch (OperException e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("addGdxwUI.do")
	public String addGdxwUI(){
		return ROOT_URL+"/gdxw/addGdxwUI";
	}
	
	/**
	 * 滚动新闻上架-新增
	 * @param session
	 * @param id
	 * @param title
	 * @param content
	 * @param pic
	 * @param file
	 * @return
	 */
	@RequestMapping("addGdxw.do")
	@ResponseBody
	public String addDtw(HttpSession session,Integer id,String title,String content) {
		String czr = getUname(session);
		try {
			xwsjService.addGdxw(session, czr, title, content);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	

	/**
	 * 滚动新闻上架-编辑
	 * @param session
	 * @param twdm
	 * @param title
	 * @param content
	 * @param pic
	 * @param file
	 * @return
	 */
	@RequestMapping("editGdxwUI.do")
	public String editGdxwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("editNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/gdxw/editGdxwUI";
	}
	
	@RequestMapping("editGdxw.do")
	@ResponseBody
	public String editGdxw(HttpSession session,String dm,String title,String content) {
		String czr = getUname(session);
		try {
			xwsjService.editGdxw(session, dm,title, czr, content);
			
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 日看点新闻上架
	 * @return
	 */
	@RequestMapping("rkdxwsjUI.do")
	public String rkdxwsjUI () {
		return ROOT_URL+"/rkdxw/xwsjUI";
	}
	
	@RequestMapping("getRkdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getRkdxwList(HttpSession session,int page,int rows) {
		VNews news = new VNews();
		news.setLx(XWLX.日看点左侧新闻.getValue());
		news.setSqr(getUname(session));
		return twsjService.newsList(news, rows, page);
	}

}
