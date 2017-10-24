package org.lf.admin.service.system;

import java.util.List;

import org.lf.admin.db.dao.CGroupMapper;
import org.lf.admin.db.pojo.CGroup;
import org.lf.utils.EasyuiDatagrid;
import org.lf.utils.PageNavigator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** * @author  wenchen 
 * @date 创建时间：2017年10月24日 上午9:54:27 
 * @version 1.0 
 * @parameter */
@Service
public class RoleService {
	
	@Autowired
	private CGroupMapper cGroupDao;
	
	/**
	 * 获得所有的cgroup记录
	 * @param page
	 * @param rows
	 * @return
	 */
	public EasyuiDatagrid<CGroup> getDutyList (int page,int rows) {
		EasyuiDatagrid<CGroup> datagrad = null;
		List<CGroup> groupList = cGroupDao.selectList(null);
		PageNavigator<CGroup> pn = new PageNavigator<>(groupList, rows);
		datagrad = new EasyuiDatagrid<>(pn.getPage(page), groupList.size());
		return datagrad;
	}
	
}
