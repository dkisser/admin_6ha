package org.lf.admin.service.count;

import java.util.ArrayList;
import java.util.List;

import org.lf.admin.db.dao.LUserGradeMapper;
import org.lf.admin.service.model.Recharge;
import org.lf.utils.EasyuiComboBoxItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** * @author  wenchen 
 * @date 创建时间：2017年7月17日 下午3:30:28 
 * @version 1.0 
 * @parameter */
@Service()
public class CountService {

	@Autowired
	private LUserGradeMapper lUserGradeMapper;
	
	public List<Recharge> getRechargeInfo (Recharge recharge) {
		return lUserGradeMapper.getRechargeInfo(recharge);
	}
	
	public List<EasyuiComboBoxItem> getRechargeYearMC (String uname) {
		 List<Recharge> rechargeList = lUserGradeMapper.getRechargeYearInfo(uname);
		 List<EasyuiComboBoxItem> combo = new ArrayList<EasyuiComboBoxItem>(); 
		 EasyuiComboBoxItem item;
		 for (Recharge recharge:rechargeList) {
			 item = new EasyuiComboBoxItem();
			 item.setId(recharge.getYear().toString());
			 item.setText(recharge.getYear().toString());
			 combo.add(item);
		 }
		 return combo;
	}
}
