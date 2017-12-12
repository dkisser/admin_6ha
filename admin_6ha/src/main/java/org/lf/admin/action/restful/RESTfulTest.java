package org.lf.admin.action.restful;

import java.util.List;

import org.lf.admin.db.dao.UserMapper;
import org.lf.admin.db.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/** 
 * @author  wenchen 
 * @date 创建时间：2017年12月12日 上午11:38:34 
 * @version 1.0 
 * @parameter
 */
@Controller
@RequestMapping("/restful/")
public class RESTfulTest {
	
	private static final String ROOT_URL="6ha/test/";
	
	@Autowired
	private UserMapper userDao;
	
	@RequestMapping(value="aaa",method={RequestMethod.GET},headers={"admin_6ha-version=1.0.0"})
	@ResponseBody
	public List<User> loginUI (){
		return userDao.getUser(null);
	}
	
	@RequestMapping(value="aaa",method={RequestMethod.GET},params={"id"},headers={"admin_6ha-version=1.0.0"})
	@ResponseBody
	public List<User> loginccc (int id){
		User user = new User();
		user.setgroupid(id);
		return userDao.getUserFuzzy(user);
	}
	
	@RequestMapping(value="aaa",method={RequestMethod.GET},params={"id","role"},headers={"admin_6ha-version=1.0.1"})
	@ResponseBody
	public List<User> loginddd (int id,int role){
		User user = new User();
		user.setgroupid(id);
		user.setRole(role);
		return userDao.getUserFuzzy(user);
	}
	
	@RequestMapping(value="aaa",method={RequestMethod.GET},params={"id","role"},headers={"admin_6ha-version=1.0.0"})
	@ResponseBody
	public String logineee (int id,int role){
		
		return "eeeeee";
	}
	
	@RequestMapping("testUI")
	public String testUI (){
		return ROOT_URL+"testUI";
	}
	
	@RequestMapping(value="aaa",method={RequestMethod.POST},headers={"admin_6ha-version=1.0.0"})
	@ResponseBody
	public String loginaaa (){
		return "abcdefg";
	}
}
