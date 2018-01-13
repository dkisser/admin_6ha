package org.lf.admin.action.tp;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.JTp;
import org.lf.admin.service.tp.TPSJService;
import org.lf.utils.EasyuiDatagrid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:07:43 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/tpsj/")
public class TPSJController extends BaseController{
	
	private final String ROOT_URL = "admin/tp/tpsj";
	
	@Autowired
	private TPSJService tpsjService;
	/**
	 * 动态图片上架
	 * @return
	 */
	@RequestMapping("dttpsjUI.do")
	public String dttpsjUI() {
		return ROOT_URL+"/dttp/tpsjUI";
	}
	
	@RequestMapping("getDttpList.do")
	@ResponseBody
	public EasyuiDatagrid<JTp> getDttpList(int page,int rows){
		return tpsjService.getDttpList(page, rows);
	}
	
	@RequestMapping("addDttpUI.do")
	public String addDttpUI() {
		return ROOT_URL+"/dttp/addUI";
	}
	
	@RequestMapping("addDttp.do")
	@ResponseBody
	public String addDttp(HttpSession session,String title,String content,Integer lx,
			@RequestParam(value="pic",required=true)MultipartFile pic,
			@RequestParam(value="file",required=true)MultipartFile file){
		String czr = getUname(session);
		try {
			tpsjService.addDttp(session, czr, title, content, lx, pic);
		} catch (Exception e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("delDttp.do")
	@ResponseBody
	public String delDttp(Integer id){
		try {
			tpsjService.delDttp(id);
		} catch (Exception e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("sjDttp.do")
	@ResponseBody
	public String sjDttp(HttpSession session,Integer id){
		String czr = getUname(session);
		try {
			tpsjService.sjDttp(id, czr);
		} catch (Exception e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 普通图片上架
	 * @return
	 */
	@RequestMapping("pttpsjUI.do")
	public String pttpsjUI() {
		return ROOT_URL+"/pttp/tpsjUI";
	}
	
	@RequestMapping("getPttpList.do")
	@ResponseBody
	public EasyuiDatagrid<JTp> getPttpList(int page,int rows){
		return tpsjService.getPttpList(page, rows);
	}
	
	@RequestMapping("addPttpUI.do")
	public String addPttpUI() {
		return ROOT_URL+"/pttp/addUI";
	}
	
	@RequestMapping("addPttp.do")
	@ResponseBody
	public String addPttp(HttpSession session,String title,String content,
			@RequestParam(value="pic",required=true)MultipartFile pic,
			@RequestParam(value="file",required=false)MultipartFile file){
		String czr = getUname(session);
		try {
			tpsjService.addPttp(session, czr, title, content, pic);
		} catch (Exception e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("delPttp.do")
	@ResponseBody
	public String delPttp(Integer id){
		try {
			tpsjService.delPttp(id);
		} catch (Exception e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("sjPttp.do")
	@ResponseBody
	public String sjPttp(HttpSession session,Integer id){
		String czr = getUname(session);
		try {
			tpsjService.sjPttp(id, czr);
		} catch (Exception e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
}
