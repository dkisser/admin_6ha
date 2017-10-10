package org.lf.admin.service.xw;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.lf.admin.db.dao.JNewsMapper;
import org.lf.admin.db.dao.LNewsMapper;
import org.lf.admin.db.pojo.JNews;
import org.lf.admin.db.pojo.LNews;
import org.lf.admin.db.pojo.User;
import org.lf.admin.service.OperErrCode;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.XWZT;
import org.lf.admin.service.sorcket.Constants;
import org.lf.admin.service.tw.TWSJService;
import org.lf.utils.AdminProperties;
import org.lf.utils.AdminUtils;
import org.lf.utils.DateUtils;
import org.lf.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** * @author  wenchen 
 * @date 创建时间：2017年8月24日 上午10:52:39 
 * @version 1.0 
 * @parameter */
@Service
public class XWSJService {
	
	public static final OperErrCode 删除新闻失败 = new OperErrCode("030401", "删除新闻失败");
	public static final OperErrCode 新增新闻失败 = new OperErrCode("030402", "新增新闻失败");
	public static final OperErrCode 编辑新闻失败 = new OperErrCode("030403", "编辑新闻失败");
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	private JNewsMapper jNewsDao;
	
	@Autowired
	private LNewsMapper lNewsDao;
	
	@Autowired
	private TWSJService twsjService;
	
	/** 删除滚动新闻
	 * 根据穿过来的dm找到对应的id然后删除
	 * @param twdm
	 * @return
	 * @throws OperException 
	 */
	public void delGdxw (String dm) throws OperException {
		try {
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			jNewsDao.deleteByPrimaryKey(record.getId());
		} catch (Exception e) {
			throw new OperException(删除新闻失败);
		}
	}
	
	/**新增滚动新闻
	 * 1.先将文件上传到服务器
	 * 2.在jnews中插入一条记录
	 * 3.在l_news中插入一条记录：
	 * dm：dm
	 * czr:当前用户
	 * old_zt:null
	 * new_zt:编辑中
	 * remark:大图文（<dm>）于<系统时间>被<czr>提交，现处于<当前状态>。
	 * @param session
	 * @param czr
	 * @param title
	 * @param content
	 * @param file
	 * @throws IOException
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void addGdxw (HttpSession session,String czr,String title,String content) throws IOException, OperException {
		User user = (User)session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		String filePath = String.format(AdminProperties.GDXW_HTML_TARGDIR, sdf.format(new Date()));
		String fileName = StringUtils.getShortUUID()+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//在jnew中插入记录
			JNews news = new JNews();
			news.setLx(XWLX.滚动新闻.getValue());
			news.setDm(DateUtils.toLong(new Date())+"");
			news.setTitle(title);
			news.setSqr(user.getUname());
			news.setHref(AdminProperties.SERVER_URL+filePath+"/"+fileName);
			news.setZt(XWZT.编辑中.getValue());
			news.setRemark(content.getBytes("utf-8"));
			jNewsDao.insertSelective(news);
			//在l_news中插入一条记录
			LNews lnews= new LNews();
			lnews.setDm(news.getDm());
			lnews.setCzr(czr);
			lnews.setOldZt(null);
			lnews.setNewZt(XWZT.编辑中.getValue());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("滚动新闻").append("(").append(news.getDm()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr).append("提交，");
			remarkSb.append("现处于").append(XWZT.编辑中);
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		}catch (Exception e) {
			throw new OperException(新增新闻失败);
		}
		
	}
	
	/**编辑大图文
	 * 1.先将文件上传到服务器
	 * 2.根据twdm更新jnews中的一条记录
	 * 3.在l_news中插入一条记录：
	 * dm：dm
	 * czr:当前用户
	 * old_zt:当前状态
	 * new_zt:当前状态
	 * remark:大图文（<dm>）于<系统时间>被<czr>进行修改，现处于<当前状态>状态。
	 * @param session
	 * @param czr
	 * @param title
	 * @param content
	 * @param file
	 * @throws IOException
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void editGdxw (HttpSession session,String dm,String title,String czr,String content) throws IOException, OperException {
		//将图片上传，然后返回图片的相关信息
		User user = (User)session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		//html的路径
		String filePath = String.format(AdminProperties.GDXW_HTML_TARGDIR, sdf.format(new Date()));
		//html的名字
		String fileName = StringUtils.getShortUUID()+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//更新jnews
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setDm(dm);
			record.setTitle(title);
			record.setSqr(user.getUname());
			record.setHref(AdminProperties.SERVER_URL+filePath+"/"+fileName);
			record.setRemark(content.getBytes("utf-8"));
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews lnews= new LNews();
			lnews.setDm(dm);
			lnews.setCzr(czr);
			lnews.setOldZt(record.getZt());
			lnews.setNewZt(record.getZt());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("滚动新闻").append("(").append(record.getDm()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("进行修改，现处于").append(XWZT.valueOf(record.getZt()-1)).append("状态");
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OperException(编辑新闻失败);
		}
		
	}
	
}
