package org.lf.admin.action.tp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VTp;
import org.lf.admin.service.OperException;
import org.lf.admin.service.TPLX;
import org.lf.admin.service.tp.TPCSService;
import org.lf.admin.service.tp.TPZSService;
import org.lf.utils.EasyuiDatagrid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:07:43 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/tpzs/")
public class TPZSController extends BaseController{
	
	private final String ROOT_URL = "admin/tp/tpzs";
	
	@Autowired
	private TPZSService tpzsService;
	
	@Autowired
	private TPCSService tpcsService;
	
	/**
	 * 动态图片终审
	 * @return
	 */
	@RequestMapping("dttpzsUI.do")
	public String dttpcsUI() {
		return ROOT_URL+"/dttp/tpzsUI";
	}
	
	@RequestMapping("getDttpList.do")
	@ResponseBody
	public EasyuiDatagrid<VTp> getDttpList(HttpSession session,String sqr,int page,int rows) {
		String glr = getUname(session);
		EasyuiDatagrid<VTp> tpList = null;
		List<Integer> lxList = new ArrayList<Integer>();
		lxList.add(TPLX.正经逛展会_大图.getValue());
		lxList.add(TPLX.正经逛展会_小图.getValue());
		try {
			tpList = tpzsService.getTPZSList(sqr, glr, lxList, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tpList;
	}
	
	@RequestMapping("previewDttpUI.do")
	public String previewDttpUI (Model model,Integer id){
		VTp tp = new VTp();
		tp.setId(id);
		model.addAttribute("previewNews", tpcsService.getVTp(tp));
		return ROOT_URL+"/dttp/previewUI";
	}
	
	/**
	 * 驳回动态图片申请
	 * @return
	 */
	@RequestMapping("revertDttpUI.do")
	public String revertDttpUI () {
		return ROOT_URL+"/dttp/revertUI";
	}
	
	@RequestMapping("revertDttp.do")
	@ResponseBody
	public String revertDttp(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			tpzsService.revertDttp(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 上架
	 * @return
	 */
	@RequestMapping("groundDttpNews.do")
	@ResponseBody
	public String groundDttpNews(HttpSession session,String dm,String replaceDm) {
		String czr = getUname(session);
		try {
			tpzsService.groundDttpNews(dm, czr, replaceDm);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 选择一个现有的新闻替换下来
	 * @return
	 */
	@RequestMapping("chooseDttpUI.do")
	public String chooseDttpUI () {
		return ROOT_URL+"/dttp/chooseUI";
	}
	
	/**
	 * 得到当前所有的正在上架中的动态图片
	 * @return
	 */
	@RequestMapping("chooseDttpList.do")
	@ResponseBody
	public EasyuiDatagrid<VTp> chooseDttpList (Integer lx,int page,int rows) {
		return tpzsService.chooseTPList(lx, page, rows);
	}
	
	/**
	 * 普通图片终审
	 * @return
	 */
	@RequestMapping("pttpzsUI.do")
	public String pttpcsUI() {
		return ROOT_URL+"/pttp/tpzsUI";
	}
	
	@RequestMapping("getPttpList.do")
	@ResponseBody
	public EasyuiDatagrid<VTp> getPttpList(HttpSession session,String sqr,int page,int rows) {
		String glr = getUname(session);
		EasyuiDatagrid<VTp> tpList = null;
		List<Integer> lxList = new ArrayList<Integer>();
		lxList.add(TPLX.ShowGirl美女.getValue());
		try {
			tpList = tpzsService.getTPZSList(sqr, glr, lxList, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tpList;
	}
	
	@RequestMapping("previewPttpUI.do")
	public String previewPttpUI (Model model,Integer id){
		VTp tp = new VTp();
		tp.setId(id);
		model.addAttribute("previewNews", tpcsService.getVTp(tp));
		return ROOT_URL+"/pttp/previewUI";
	}
	
	/**
	 * 驳回动态图片申请
	 * @return
	 */
	@RequestMapping("revertPttpUI.do")
	public String revertPttpUI () {
		return ROOT_URL+"/pttp/revertUI";
	}
	
	@RequestMapping("revertPttp.do")
	@ResponseBody
	public String revertPttp(HttpSession session,String dm,String remark) {
		String czr = getUname(session);
		try {
			tpzsService.revertDttp(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 上架
	 * @return
	 */
	@RequestMapping("groundPttpNews.do")
	@ResponseBody
	public String groundPttpNews(HttpSession session,String dm,String replaceDm) {
		String czr = getUname(session);
		try {
			tpzsService.groundPttpNews(dm, czr, replaceDm);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 选择一个现有的新闻替换下来
	 * @return
	 */
	@RequestMapping("choosePttpUI.do")
	public String choosePttpUI () {
		return ROOT_URL+"/pttp/chooseUI";
	}
	
	/**
	 * 得到当前所有的正在上架中的动态图片
	 * @return
	 */
	@RequestMapping("choosePttpList.do")
	@ResponseBody
	public EasyuiDatagrid<VTp> choosePttpList (Integer lx,int page,int rows) {
		return tpzsService.chooseTPList(lx, page, rows);
	}
	
}
