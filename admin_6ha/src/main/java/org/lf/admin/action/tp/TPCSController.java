package org.lf.admin.action.tp;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.VTp;
import org.lf.admin.service.OperException;
import org.lf.admin.service.TPLX;
import org.lf.admin.service.tp.TPCSService;
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
@RequestMapping("/admin/tpcs/")
public class TPCSController extends BaseController{
	
	private final String ROOT_URL = "admin/tp/tpcs";
	
	@Autowired
	private TPCSService tpcsService;
	
	/**
	 * 动态图片初审
	 * @return
	 */
	@RequestMapping("dttpcsUI.do")
	public String dttpcsUI() {
		return ROOT_URL+"/dttp/tpcsUI";
	}
	
	@RequestMapping("getDttpList.do")
	@ResponseBody
	public EasyuiDatagrid<VTp> getDttpList(HttpSession session,String sqr,String title,int page,int rows) {
		String fzr = getCurUser(session).getUname();
		EasyuiDatagrid<VTp> datagrid = null;
		List<Integer> lxList = new ArrayList<Integer>();
		lxList.add(TPLX.正经逛展会_大图.getValue());
		lxList.add(TPLX.正经逛展会_小图.getValue());
		try {
			datagrid = tpcsService.getDttpCSList(sqr, fzr, lxList, page, rows);
					
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return datagrid;
	}
	
	/**
	 * 图片驳回
	 */
	/**
	 * 驳回大图文申请
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
			tpcsService.revertDtw(dm, czr, remark);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	/**
	 * 提交至终审
	 * @return
	 */
	@RequestMapping("submitDttpZS.do")
	@ResponseBody
	public String submitDttpZS(HttpSession session,String dm) {
		String czr = getUname(session);
		try {
			tpcsService.submitDttpZS(dm, czr);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("previewDttpUI.do")
	public String previewDttpUI (Model model,Integer id){
		VTp tp = new VTp();
		tp.setId(id);
		model.addAttribute("previewNews", tpcsService.getVTp(tp));
		return ROOT_URL+"/dttp/previewUI";
	}
	
	/**
	 * 普通图片初审
	 * @return
	 */
	@RequestMapping("pttpcsUI.do")
	public String pttpcsUI() {
		return ROOT_URL+"/pttp/tpcsUI";
	}
	
	
}
