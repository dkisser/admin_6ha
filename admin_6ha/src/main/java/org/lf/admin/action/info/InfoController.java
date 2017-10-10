package org.lf.admin.action.info;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.lf.admin.action.BaseController;
import org.lf.admin.db.pojo.City;
import org.lf.admin.db.pojo.VUser;
import org.lf.admin.service.info.InfoService;
import org.lf.utils.EasyuiComboBoxItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** * @author  wenchen 
 * @date 创建时间：2017年7月5日 上午10:27:05 
 * @version 1.0 
 * @parameter */
@Controller
@RequestMapping("/admin/info/")
public class InfoController extends BaseController{

	@Autowired
	private InfoService infoService;
	
	private final String ROOT_URL = "admin/info/";
	
	@RequestMapping("completeInfoUI.do")
	public String completeInfoUI () {
		return ROOT_URL + "completeInfo";
	}
	
	@RequestMapping("validInfo.do")
	@ResponseBody
	public String validInfo (HttpSession session) {
		String uname = getUname(session);
		infoService.validInfo(uname);

		return SUCCESS;
	}
	
	@RequestMapping("cplInfoUI.do")
	public String cplInfoUI (HttpSession session,Model model) {
		String uname = getUname(session);
		VUser user = new VUser();
		user.setUname(uname);
		model.addAttribute("vUser",infoService.getVUser(user));
		return ROOT_URL + "cplInfo";
	}
	
	@RequestMapping("getProvinceCombo.do")
	@ResponseBody
	public List<EasyuiComboBoxItem> getProvinceCombo () {
		return infoService.getProvinceCombo();
	}
	
	@RequestMapping("getCityInfo.do")
	@ResponseBody
	public List<City> getCityInfo (Integer provinceId) {
		return infoService.getCityInfo(provinceId);
	}
	
}
