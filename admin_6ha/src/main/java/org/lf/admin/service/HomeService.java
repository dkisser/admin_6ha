package org.lf.admin.service;

import java.util.List;

import org.lf.admin.db.dao.MenuMapper;
import org.lf.admin.db.dao.UserMapper;
import org.lf.admin.db.dao.VUserMapper;
import org.lf.admin.db.pojo.Menu;
import org.lf.admin.db.pojo.User;
import org.lf.admin.db.pojo.VUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/** * @author  wenchen 
 * @date 创建时间：2017年7月5日 上午10:27:23 
 * @version 1.0 
 * @parameter */
@Service("homeService")
public class HomeService {
	
	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private VUserMapper vUserMapper;
	
	@Autowired
	private MenuMapper menuDao;
	
	public User getUser(User user){
		return userDao.select(user);
	}
	
	public VUser getVUser (VUser vuser) {
		return vUserMapper.select(vuser);
	}
	
	public User getUserByUname (String uname) {
		return userDao.selectByPrimaryKey(uname);
	}
	
	public List<User> getUserList(User user){
		return userDao.selectList(user);
	}
	
	public int countUserList(User user) {
		return userDao.countUserList(user);
	}
	
	/**
	 * 功能:获得菜单选项的一个json数组
	 * @param uname
	 * @return
	 */
	public JSONArray getMenuByUname (String uname) {
		JSONArray resultArr = new JSONArray();
		List<Menu> menuList = menuDao.getMenuByUname(uname);
		for (Menu parentMenu : menuList) {
			if (parentMenu.getParentId()==0) {
				JSONArray arr = new JSONArray();
				JSONObject obj = new JSONObject();
				for (Menu childMenu : menuList) {
					if (parentMenu.getId()==childMenu.getParentId()) {
						arr.add(childMenu);
					}
				}
				obj.put("parent", parentMenu);
				obj.put("child", arr);
				resultArr.add(obj);
			}
		}
		return resultArr;
	}

	public Boolean updateUser(User user) {
		return userDao.updateByPrimaryKeySelective(user) > 0 ? true : false;
	}
	
	public List<User> getTestJson () {
		User record = new User();
		return userDao.selectList(record);
	}
}
