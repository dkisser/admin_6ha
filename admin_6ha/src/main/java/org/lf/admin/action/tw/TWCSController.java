package org.lf.admin.action.tw;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.tw.TWCSService;
import org.lf.admin.service.tw.TWSJService;
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
@RequestMapping("/admin/twcs/")
public class TWCSController extends BaseController{

	@Autowired
	private TWCSService twcsService;
	
	@Autowired
	private TWSJService twsjService;
	
	private final String ROOT_URL = "admin/tw/twcs";
	
	
	/**
	 * 大图文初审
	 * @return
	 */
	@RequestMapping("dtwcsUI.do")
	public String dtwcsUI () {
		return ROOT_URL+"/dtw/dtwcsUI";
	}
	
	@RequestMapping("getDtwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getDtwList(HttpSession session,String sqr,String title,int page,int rows) {
		String fzr = getCurUser(session).getUname();
		EasyuiDatagrid<VNews> datagrid = null;
		try {
			datagrid = twcsService.getCSNewsList(sqr, title,fzr,XWLX.大图文, page, rows);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return datagrid;
	}
	
	@RequestMapping("previewDtwUI.do")
	public String previewDtwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/dtw/previewDtwUI";
	}
	
	/**
	 * 提交至终审
	 * @return
	 */
	@RequestMapping("submitDtwZS.do")
	@ResponseBody
	public String submitDtwZS(HttpSession session,String dm) {
		String czr = getUname(session);
		try {
			twcsService.submitDtwZS(dm,czr);
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
	
	@RequestMapping("revertDtw.do")
	@ResponseBody
	public String revertDtw(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			twcsService.revertDtw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	
	
	/**
	 * 小图文初审
	 * @return
	 */
	@RequestMapping("xtwcsUI.do")
	public String xtwcsUI () {
		return ROOT_URL+"/xtw/xtwcsUI";
	}
	
	@RequestMapping("getXtwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getXtwList(HttpSession session,String sqr,String title,int page,int rows) {
		String fzr = getCurUser(session).getUname();
		EasyuiDatagrid<VNews> datagrid = null;
		try {
			datagrid = twcsService.getCSNewsList(sqr, title,fzr,XWLX.小图文, page, rows);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return datagrid;
	}
	
	@RequestMapping("previewXtwUI.do")
	public String previewXtwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("previewNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/xtw/previewXtwUI";
	}
	
	/**
	 * 提交至终审
	 * @return
	 */
	@RequestMapping("submitXtwZS.do")
	@ResponseBody
	public String submitXtwZS(HttpSession session,String dm) {
		String czr = getUname(session);
		try {
			twcsService.submitXtwZS(dm,czr);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 驳回小图文申请
	 * @return
	 */
	@RequestMapping("revertXtwUI.do")
	public String revertXtwUI () {
		return ROOT_URL+"/xtw/revertXtwUI";
	}
	
	@RequestMapping("revertXtw.do")
	@ResponseBody
	public String revertXtw(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			twcsService.revertXtw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
}
