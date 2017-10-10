package org.lf.admin.action.tw;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.tw.TWSJService;
import org.lf.utils.AdminProperties;
import org.lf.utils.EasyuiDatagrid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/** * @author  wenchen 
 * @date 创建时间：2017年8月23日 下午2:26:32 
 * 大图文上架Controller
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/twsj/")
public class TWSJController extends BaseController{

	private final String ROOT_URL = "admin/tw/twsj";
	
	@Autowired
	private TWSJService twsjService;
	
	/**
	 * 大图文上架
	 * @return
	 */
	@RequestMapping("dtwsjUI.do")
	public String dtwsjUI () {
		return ROOT_URL+"/dtw/dtwsjUI";
	}
	
	@RequestMapping("getDtwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getDtwList (HttpSession session,int rows,int page) {
		VNews news = new VNews();
		news.setLx(XWLX.大图文.getValue());
		news.setSqr(getUname(session));
		return twsjService.newsList(news, rows, page);
	}
	
	@RequestMapping("addDtwUI.do")
	public String addDtwUI () {
		return ROOT_URL+"/dtw/addDtwUI";
	}
	/**
	 * 图片上传
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping("uploadPic.do")
	@ResponseBody
	public JSONObject uploadPic(HttpSession session,@RequestParam(value="file",required=false)MultipartFile file) {
		
		return twsjService.uploadPic(file, session,AdminProperties.PIC_TEMP_DIR);
	}
	/**
	 * 大图文上架-新增
	 * @param session
	 * @param id
	 * @param title
	 * @param content
	 * @param pic
	 * @param file
	 * @return
	 */
	@RequestMapping("addDtw.do")
	@ResponseBody
	public String addDtw(HttpSession session,Integer id,String title,String content,
			@RequestParam(value="pic",required=false)MultipartFile pic,
			@RequestParam(value="file",required=false)MultipartFile file) {
		String czr = getUname(session);
		try {
			twsjService.addDtw(session,czr,title, content,pic);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 大图文上架-编辑
	 * @param session
	 * @param twdm
	 * @param title
	 * @param content
	 * @param pic
	 * @param file
	 * @return
	 */
	@RequestMapping("editDtwUI.do")
	public String editDtwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("editNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/dtw/editDtwUI";
	}
	
	@RequestMapping("editDtw.do")
	@ResponseBody
	public String editDtw(HttpSession session,String twdm,String title,String content,
			@RequestParam(value="pic",required=false)MultipartFile pic,
			@RequestParam(value="file",required=false)MultipartFile file) {
		String czr = getUname(session);
		try {
			twsjService.editDtw(session, twdm,czr, title, content, pic);
			
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	/**
	 * 大图文上架-删除
	 * @param twdm
	 * @return
	 */
	@RequestMapping("delDtw.do")
	@ResponseBody
	public String delDtw(String twdm) {
		try {
			twsjService.delDtw(twdm);
			
		} catch (OperException e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 大图文上架-上架（重新上架）
	 * @param id
	 * @return
	 */
	@RequestMapping("sjDtw.do")
	@ResponseBody
	public String sjDtw(HttpSession session,String twdm) {
		String czr = getUname(session);
		try {
			twsjService.sjDtw(twdm, czr);
		} catch (OperException e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 *小图文上架
	 * @return
	 */
	@RequestMapping("xtwsjUI.do")
	public String xtwsjUI () {
		return ROOT_URL+"/xtw/xtwsjUI";
	}
	
	@RequestMapping("getXtwList.do")
	@ResponseBody
	public EasyuiDatagrid<VNews> getXtwList (HttpSession session,int rows,int page) {
		VNews news = new VNews();
		news.setLx(XWLX.小图文.getValue());
		news.setSqr(getUname(session));
		return twsjService.newsList(news, rows, page);
	}
	
	@RequestMapping("addXtwUI.do")
	public String addXtwUI () {
		return ROOT_URL+"/xtw/addXtwUI";
	}
	
	/**
	 * 小图文上架-新增
	 * @param session
	 * @param id
	 * @param title
	 * @param content
	 * @param pic
	 * @param file
	 * @return
	 */
	@RequestMapping("addXtw.do")
	@ResponseBody
	public String addXtw(HttpSession session,Integer id,String title,String content,
			@RequestParam(value="pic",required=false)MultipartFile pic,
			@RequestParam(value="file",required=false)MultipartFile file) {
		String czr = getUname(session);
		try {
			twsjService.addXtw(session,czr,title, content,pic);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("editXtwUI.do")
	public String editXtwUI (Model model,Integer id){
		VNews vnews = new VNews();
		vnews.setId(id);
		model.addAttribute("editNews", twsjService.getVNews(vnews));
		return ROOT_URL+"/xtw/editXtwUI";
	}
	/**
	 * 小图文上架-编辑
	 * @param session
	 * @param twdm
	 * @param title
	 * @param content
	 * @param pic
	 * @param file
	 * @return
	 */
	@RequestMapping("editXtw.do")
	@ResponseBody
	public String editXtw(HttpSession session,String twdm,String title,String content,
			@RequestParam(value="pic",required=false)MultipartFile pic,
			@RequestParam(value="file",required=false)MultipartFile file) {
		String czr = getUname(session);
		try {
			twsjService.editXtw(session, twdm,czr, title, content, pic);
			
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	/**
	 * 小图文上架-删除
	 * @param twdm
	 * @return
	 */
	@RequestMapping("delXtw.do")
	@ResponseBody
	public String delXtw(String twdm) {
		try {
			twsjService.delXtw(twdm);
			
		} catch (OperException e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 小图文上架-上架（重新上架）
	 * @param id
	 * @return
	 */
	@RequestMapping("sjXtw.do")
	@ResponseBody
	public String sjXtw(HttpSession session,String twdm) {
		String czr = getUname(session);
		try {
			twsjService.sjXtw(twdm, czr);
		} catch (OperException e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return SUCCESS;
	}
}
