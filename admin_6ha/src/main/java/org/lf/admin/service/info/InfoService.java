package org.lf.admin.service.info;

import java.util.ArrayList;
import java.util.List;

import org.lf.admin.db.dao.CityMapper;
import org.lf.admin.db.dao.ProvinceMapper;
import org.lf.admin.db.dao.VUserMapper;
import org.lf.admin.db.dao.ValidateMapper;
import org.lf.admin.db.pojo.City;
import org.lf.admin.db.pojo.Province;
import org.lf.admin.db.pojo.VUser;
import org.lf.admin.db.pojo.Validate;
import org.lf.utils.EasyuiComboBoxItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** * @author  wenchen 
 * @date 创建时间：2017年7月18日 下午2:55:36 
 * @version 1.0 
 * @parameter */
@Service()
public class InfoService {

	@Autowired
	private ValidateMapper validateMapper;
	
	@Autowired
	private VUserMapper vUserMapper;
	
	@Autowired
	private ProvinceMapper provinceMapper;
	
	@Autowired
	private CityMapper cityMapper;
	/**
	 * 功能：根据uname判断validate表中是否有记录，没有则添加一条空记录
	 */
	public void validInfo (String uname) {
		Validate validate = new Validate();
		validate.setUname(uname);
		if (validateMapper.countSelect(validate) == 0) {
			Validate record = new Validate();
			record.setUname(uname);
			validateMapper.insertSelective(record);
		}
	}
	
	public VUser getVUser (VUser vuser) {
		return vUserMapper.select(vuser);
	}
	
	public List<EasyuiComboBoxItem> getProvinceCombo () {
		List<EasyuiComboBoxItem> combo  = new ArrayList<EasyuiComboBoxItem>();
		List<Province> provinceList = provinceMapper.selectList(null);
		EasyuiComboBoxItem item ;
		for (Province province : provinceList) {
			item = new EasyuiComboBoxItem();
			item.setId(province.getProvinceId().toString());
			item.setText(province.getProvinceName());
			combo.add(item);
		}
		return combo;
	}
	
	public List<City> getCityInfo (Integer provinceId) {
		City record = new City();
		record.setBelongs(provinceId.toString());
		return cityMapper.selectList(record);
	}
}
