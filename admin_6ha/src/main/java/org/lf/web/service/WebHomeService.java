package org.lf.web.service;

import java.util.List;

import org.lf.admin.db.dao.JNewsMapper;
import org.lf.admin.db.dao.JPicMapper;
import org.lf.admin.db.dao.JTpMapper;
import org.lf.admin.db.dao.JYxMapper;
import org.lf.admin.db.dao.WebUserMapper;
import org.lf.admin.db.pojo.JNews;
import org.lf.admin.db.pojo.JTp;
import org.lf.admin.db.pojo.JYx;
import org.lf.admin.db.pojo.WebUser;
import org.lf.admin.service.TPLX;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.XWZT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** * @author  wenchen 
 * @date 创建时间：2017年8月8日 下午12:08:07 
 * @version 1.0 
 * @parameter */
@Service
public class WebHomeService {
	
	@Autowired
	private WebUserMapper webuserDao;
	
	@Autowired
	private JNewsMapper jNewsDao;
	
	@Autowired
	private JPicMapper jPicDao;
	
	@Autowired
	private JTpMapper jTpDao;
	
	@Autowired
	private JYxMapper jYxDao;

	public String login(String uname,String password){
		
		return "";
	}
	
	/**
	 * 根据传进来的参数查询得到一个webuser
	 * @param user
	 * @return
	 */
	public WebUser getWebUser (WebUser user) {
		return webuserDao.select(user);
	}
	
	/**
	 * 根据传进来的参数查询得到一个webuser列表
	 * @param user
	 * @return
	 */
	public List<WebUser> getWebUserList (WebUser user) {
		return webuserDao.selectList(user);
	}
	/**
	 * 根据传进来的参数更新webuser
	 * @return
	 */
	public Boolean updateWebUser (WebUser user){
		return webuserDao.updateByPrimaryKeySelective(user) > 0 ? true : false;
	}
	
	/**
	 * 在webuser表中插入一条记录
	 * @return
	 */
	public Boolean insertWebUser(WebUser user){
		return webuserDao.insertSelective(user) > 0 ? true : false;
	}
	
	/**
	 * 得到vr左侧游戏资讯的内容
	 * @return
	 */
	public List<JNews> getLeftVrNews(){
		JNews news = new JNews();
		news.setLx(XWLX.日看点左侧新闻.getValue());
		news.setZt(XWZT.上架中.getValue());
		return jNewsDao.selectList(news);
	}
	/**
	 * 得到vr中部游戏资讯的内容
	 * @return
	 */
	public List<JNews> getMiddleVrNews(){
		JNews news = new JNews();
		news.setLx(XWLX.小图文.getValue());
		news.setZt(XWZT.上架中.getValue());
		return jNewsDao.selectList(news);
	}
	/**
	 * 得到vr右侧游戏资讯的内容
	 * @return
	 */
	public List<JNews> getRightVrNews(){
		JNews news = new JNews();
		news.setLx(XWLX.大图文.getValue());
		news.setZt(XWZT.上架中.getValue());
		return jNewsDao.selectList(news);
	}
	/**
	 * 得到news滚动新闻的内容
	 * @return
	 */
	public List<JNews> getNewsList(){
		JNews news = new JNews();
		news.setLx(XWLX.滚动新闻.getValue());
		news.setZt(XWZT.上架中.getValue());
		return jNewsDao.selectList(news);
	}
	/**
	 * 得到爆点游戏的内容
	 * @return
	 */
	public List<JYx> getBDYXList(){
		JYx yx = new JYx();
		yx.setStart(0);
		yx.setOffset(5);
		return jYxDao.selectList(yx);
	}
	/**
	 * 得到动态看展的内容
	 * @return
	 */
	public List<JTp> getDTKZList(){
		JTp tp = new JTp();
		tp.setLx(TPLX.正经逛展会_小图.getValue());
		tp.setStart(0);
		tp.setOffset(14);
		List<JTp> sList = jTpDao.selectList(tp);
		tp.setLx(TPLX.正经逛展会_大图.getValue());
		tp.setOffset(1);
		List<JTp> bList = jTpDao.selectList(tp);
		bList.addAll(sList);
		return bList;
	}
	/**
	 * 得到showgirl美女图片
	 * @return
	 */
	public List<JTp> getSGMVList(){
		JTp tp = new JTp();
		tp.setLx(TPLX.ShowGirl美女.getValue());
		tp.setStart(0);
		tp.setOffset(8);
		return jTpDao.selectList(tp);
	}
	
}
