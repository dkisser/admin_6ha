package org.lf.admin.service.system;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.lf.admin.db.dao.RoleMapper;
import org.lf.admin.db.dao.UserMapper;
import org.lf.admin.db.pojo.Role;
import org.lf.admin.db.pojo.User;
import org.lf.admin.service.OperErrCode;
import org.lf.admin.service.OperException;
import org.lf.utils.EasyuiComboBoxItem;
import org.lf.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * * @author wenchen
 * 
 * @date 创建时间：2017年7月6日 下午2:01:33
 * @version 1.0
 * @parameter
 */
@Service()
public class SystemService {

	@Autowired
	private UserMapper userDao;

	@Autowired
	private RoleMapper roleDao;
	
	private OperErrCode 用户名不能为空 = new OperErrCode("100001","用户名不能为空");
	
	private OperErrCode 昵称不能为空 = new OperErrCode("100002", "昵称不能为空");
	
	private OperErrCode 年龄不能为0或小于0的数 = new OperErrCode("100003", "年龄不能为0或小于0的数");
	
	private OperErrCode 该用户名已存在 = new OperErrCode("100004", "该用户名已存在");
	
	private OperErrCode 角色类型不能为空 = new OperErrCode("100005", "角色类型不能为空");
	
	/**
	 * 功能:根据uname进行模糊查找
	 * 
	 * @param user
	 * @return
	 * @throws OperException 
	 */
	
	private void validUser (User user,Boolean isInsert) throws OperException {
		
		if (StringUtils.isEmpty(user.getUname())) {
			throw new OperException(用户名不能为空);
		}
		if (StringUtils.isEmpty(user.getPetname())) {
			throw new OperException(昵称不能为空);
		}
		if (user.getRole() == null) {
			throw new OperException(角色类型不能为空);
		}
		BigDecimal compareAge;
		try {
			compareAge = new BigDecimal(user.getAge());
		} catch (Exception e) {
			throw new OperException(OperErrCode.非法的输入);
		}
		BigDecimal compareNum = new BigDecimal("0");
		if (!(compareAge.compareTo(compareNum) == 1)) {
			throw new OperException(年龄不能为0或小于0的数);
		} 
		//检查你的uname是否重复
		if (isInsert) {
			User u = new User();
			u.setUname(user.getUname());
			if (userDao.countUserList(u) > 0 ? true : false) {
				throw new OperException(该用户名已存在);
			}
		}
		
	}
	/**
	 * 根据uname进行模糊查找
	 * @param user
	 * @return
	 */
	public List<User> getUserFuzzy(User user) {
		return userDao.getUserFuzzy(user);
	}

	/**
	 * @param param
	 * @return
	 */
	public List<Role> getRoleList(Role param) {
		return roleDao.selectList(param);
	}

	/**
	 * 获取role表的内容，将其变成下拉列表框
	 * 
	 * @return List<EasyuiComboBoItem>
	 */
	public List<EasyuiComboBoxItem> getRoleCombo() {
		List<EasyuiComboBoxItem> combo = new ArrayList<EasyuiComboBoxItem>();
		List<Role> roleList = getRoleList(null);
		EasyuiComboBoxItem item;
		for (Role role : roleList) {
			item = new EasyuiComboBoxItem();
			item.setId(role.getId().toString());
			item.setText(role.getName());
			combo.add(item);
		}
		return combo;
	}
	
	/**
	 * 获取role表的内容，将其变成下拉列表框(带全部)
	 * 
	 * @return List<EasyuiComboBoItem>
	 */
	public List<EasyuiComboBoxItem> getRoleComboWithAll() {
		List<EasyuiComboBoxItem> combo = new ArrayList<EasyuiComboBoxItem>();
		List<Role> roleList = getRoleList(null);
		EasyuiComboBoxItem item;
		item = new EasyuiComboBoxItem();
		item.setId("");
		item.setText("全部");
		combo.add(item);
		for (Role role : roleList) {
			item = new EasyuiComboBoxItem();
			item.setId(role.getId().toString());
			item.setText(role.getName());
			combo.add(item);
		}
		return combo;
	}
	
	/**
	 * 功能:新增一个用户
	 * @param user
	 * @return
	 * @throws OperException
	 */
	public Boolean insertUser(User user) throws OperException {
		validUser(user, true);
		user.setPassword(StringUtils.toMD5(user.getUname() + "123456"));
		user.setUuid(StringUtils.getShortUUID());
		return userDao.insertSelective(user) > 0 ? true : false;
	}
	
	/**
	 * 功能:更新一个用户
	 * @param user
	 * @return
	 * @throws OperException
	 */
	public Boolean updateUser(User user) throws OperException {
		validUser(user, false);
		return userDao.updateByPrimaryKeySelective(user) > 0 ? true : false;
	}

}
