package org.lf.admin.action.xw;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.tw.TWCSService;
import org.lf.admin.service.tw.TWSJService;
import org.lf.admin.service.xw.XWCSService;
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
@RequestMapping("/admin/xwcs/")
public class XWCSController extends BaseController{

	@Autowired
	private XWCSService xwcsService;
	
	@Autowired
	private TWCSService twcsService;
	
	@Autowired
	private TWSJService twsjService;
	
	private final String ROOT_URL = "admin/xw/xwcs";
	
	/**
	 * 滚动新闻初审
	 * @return
	 */
	@RequestMapping("gdxwcsUI.do")
	public String gdxwcsUI () {
		return ROOT_URL+"/gdxw/xwcsUI";
	}
	
	@RequestMapping("getGdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getGdxwList(HttpSession session,String sqr,String title,int page,int rows) {
		String fzr = getCurUser(session).getUname();
		EasyuiDatagrid<VNews> datagrid = null;
		try {
			datagrid = twcsService.getCSNewsList(sqr, title,fzr,XWLX.滚动新闻, page, rows);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return datagrid;
	}
	
	@RequestMapping("previewGdxwUI.do")
	public String previewGdxwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/gdxw/previewUI";
	}
	
	/**
	 * 提交至终审
	 * @return
	 */
	@RequestMapping("submitGdxwZS.do")
	@ResponseBody
	public String submitGdxwZS(HttpSession session,String dm) {
		String czr = getUname(session);
		try {
			xwcsService.submitGdxwZS(dm, czr);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 驳回大图文申请
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
			xwcsService.revertGdxw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 日看点新闻初审
	 * @return
	 */
	@RequestMapping("rkdxwcsUI.do")
	public String rkdxwcsUI () {
		return ROOT_URL+"/rkdxw/xwcsUI";
	}
	
	@RequestMapping("getRkdxwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getRkdxwList(HttpSession session,String sqr,String title,int page,int rows) {
		String fzr = getCurUser(session).getUname();
		EasyuiDatagrid<VNews> datagrid = null;
		try {
			datagrid = twcsService.getCSNewsList(sqr, title,fzr,XWLX.日看点左侧新闻, page, rows);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return datagrid;
	}
	
	@RequestMapping("previewRkdxwUI.do")
	public String previewRkdxwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/rkdxw/previewUI";
	}
	
	/**
	 * 提交至终审
	 * @return
	 */
	@RequestMapping("submitRkdxwZS.do")
	@ResponseBody
	public String submitRkdxwZS(HttpSession session,String dm) {
		String czr = getUname(session);
		try {
			xwcsService.submitRkdxwZS(dm, czr);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 驳回大图文申请
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
			xwcsService.revertRkdxw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
}
