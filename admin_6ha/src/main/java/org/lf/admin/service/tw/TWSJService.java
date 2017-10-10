package org.lf.admin.service.tw;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.lf.admin.db.dao.JNewsMapper;
import org.lf.admin.db.dao.LNewsMapper;
import org.lf.admin.db.dao.VNewsMapper;
import org.lf.admin.db.pojo.JNews;
import org.lf.admin.db.pojo.LNews;
import org.lf.admin.db.pojo.User;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperErrCode;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.XWZT;
import org.lf.admin.service.sorcket.Constants;
import org.lf.utils.AdminProperties;
import org.lf.utils.AdminUtils;
import org.lf.utils.DateUtils;
import org.lf.utils.EasyuiDatagrid;
import org.lf.utils.LayEdit;
import org.lf.utils.PageNavigator;
import org.lf.utils.PicInfo;
import org.lf.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/** * @author  wenchen 
 * @date 创建时间：2017年8月24日 上午10:52:00 
 * @version 1.0 
 * @parameter */
@Service
public class TWSJService {

	@Autowired
	private VNewsMapper vnewsDao;
	@Autowired
	private JNewsMapper jNewsDao;
	@Autowired
	private LNewsMapper lNewsDao;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public static final OperErrCode 新增大图文失败 = new OperErrCode("020401", "新增大图文失败");
	public static final OperErrCode 编辑大图文失败 = new OperErrCode("020402", "修改大图文失败");
	public static final OperErrCode 删除大图文失败 = new OperErrCode("020403", "删除大图文失败");
	public static final OperErrCode 上架大图文失败 = new OperErrCode("020404", "上架大图文失败");
	public static final OperErrCode 新增小图文失败 = new OperErrCode("020405", "新增小图文失败");
	public static final OperErrCode 编辑小图文失败 = new OperErrCode("020406", "修改小图文失败");
	public static final OperErrCode 删除小图文失败 = new OperErrCode("020407", "删除小图文失败");
	public static final OperErrCode 上架小图文失败 = new OperErrCode("020408", "上架小图文失败");
	
	/**
	 * 得到VNews的一条记录，同时将blob转换成字符串
	 * @param news
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public VNews getVNews(VNews news) {
		 VNews result = vnewsDao.select(news);
		 try {
			 if (result.getRemark()!=null) {
				 result.setRemarkStr(new String(result.getRemark(), "utf-8"));
			 }
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			result.setRemarkStr(null);
		}
		 return result;
	}
	/**
	 * 根据news查询得到指定条件的newsList
	 * @param news
	 * @param rows
	 * @param page
	 * @return
	 */
	public EasyuiDatagrid<VNews> newsList (VNews news,int rows,int page) {
		List<VNews> newsList = vnewsDao.selectList(news);
		PageNavigator<VNews> pg = new PageNavigator<>(newsList, rows);
		EasyuiDatagrid<VNews> datagrid = new EasyuiDatagrid<>(pg.getPage(page), newsList.size());
		return datagrid;
	}
	
	/**
	 * 上传图片，上传成功后返回图片在服务器上的地址
	 * @param file
	 * @param session
	 * @return
	 * @throws IOException
	 */
	public JSONObject uploadPic(MultipartFile file,HttpSession session,String targDir){
		LayEdit edit= new LayEdit();
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		String filePath = String.format(targDir, sdf.format(new Date()));
		String fileOldName=file.getOriginalFilename();
		String fileName = StringUtils.getShortUUID()+fileOldName.substring(fileOldName.indexOf("."));
		String serverUrl = AdminProperties.SERVER_URL+filePath+"/"+fileName;
		Boolean is = null;
		try {
			is = AdminUtils.uploadMedia(serverRealPath+filePath, fileName, file);
		} catch (Exception e) {
			is = false;
			e.printStackTrace();
			edit.setMsg(e.getMessage());
		}
		if (is) {
			edit.setCode(0);
			PicInfo info = new PicInfo(serverUrl);
			info.setPicName(fileName);
			edit.setData(info);
		} else {
			edit.setCode(-1);
		}
		return (JSONObject) JSONObject.toJSON(edit);
	}
	
	/**新增大图文
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
	public void addDtw (HttpSession session,String czr,String title,String content,MultipartFile file) throws IOException, OperException {
		JSONObject picObj = uploadPic(file, session,AdminProperties.DTW_TAEG_DIR);
		User user = (User)session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		String filePath = String.format(AdminProperties.DTW_HTML_DIR, sdf.format(new Date()));
		String fileName = picObj.getJSONObject("data").getString("picName").split("\\.jpg")[0]+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//在jnew中插入记录
			JNews news = new JNews();
			news.setLx(XWLX.大图文.getValue());
			news.setDm(DateUtils.toLong(new Date())+"");
			news.setTitle(title);
			news.setSqr(user.getUname());
			news.setImgurl(picObj.getJSONObject("data").getString("src"));
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
			remarkSb.append("大图文").append("(").append(news.getDm()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr).append("提交，");
			remarkSb.append("现处于").append(XWZT.编辑中);
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		}catch (Exception e) {
			throw new OperException(新增大图文失败);
		}
		
	}
	/**新增小图文
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
	public void addXtw (HttpSession session,String czr,String title,String content,MultipartFile file) throws IOException, OperException {
		JSONObject picObj = uploadPic(file, session,AdminProperties.XTW_TAEG_DIR);
		User user = (User)session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		String filePath = String.format(AdminProperties.XTW_HTML_DIR, sdf.format(new Date()));
		String fileName = picObj.getJSONObject("data").getString("picName").split("\\.jpg")[0]+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//在jnew中插入记录
			JNews news = new JNews();
			news.setLx(XWLX.小图文.getValue());
			news.setDm(DateUtils.toLong(new Date())+"");
			news.setTitle(title);
			news.setSqr(user.getUname());
			news.setImgurl(picObj.getJSONObject("data").getString("src"));
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
			remarkSb.append("小图文").append("(").append(news.getDm()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr).append("提交，");
			remarkSb.append("现处于").append(XWZT.编辑中);
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		}catch (Exception e) {
			throw new OperException(新增小图文失败);
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
	public void editDtw (HttpSession session,String twdm,String czr,String title,String content,MultipartFile file) throws IOException, OperException {
		//将图片上传，然后返回图片的相关信息
		JSONObject picObj = uploadPic(file, session,AdminProperties.DTW_TAEG_DIR);
		User user = (User)session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		//html的路径
		String filePath = String.format(AdminProperties.DTW_HTML_DIR, sdf.format(new Date()));
		//html的名字
		String fileName = picObj.getJSONObject("data").getString("picName").split("\\.jpg")[0]+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//更新jnews
			JNews record = new JNews();
			record.setDm(twdm);
			record = jNewsDao.select(record);
			record.setDm(twdm);
			record.setTitle(title);
			record.setSqr(user.getUname());
			record.setImgurl(picObj.getJSONObject("data").getString("src"));
			record.setHref(AdminProperties.SERVER_URL+filePath+"/"+fileName);
			record.setRemark(content.getBytes("utf-8"));
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews lnews= new LNews();
			lnews.setDm(twdm);
			lnews.setCzr(czr);
			lnews.setOldZt(record.getZt());
			lnews.setNewZt(record.getZt());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("大图文").append("(").append(record.getDm()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("进行修改，现处于").append(XWZT.valueOf(record.getZt())).append("状态");
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		} catch (Exception e) {
			throw new OperException(编辑大图文失败);
		}
		
	}
	/**编辑小图文
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
	public void editXtw (HttpSession session,String twdm,String czr,String title,String content,MultipartFile file) throws IOException, OperException {
		//将图片上传，然后返回图片的相关信息
		JSONObject picObj = uploadPic(file, session,AdminProperties.XTW_TAEG_DIR);
		User user = (User)session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		//html的路径
		String filePath = String.format(AdminProperties.XTW_HTML_DIR, sdf.format(new Date()));
		//html的名字
		String fileName = picObj.getJSONObject("data").getString("picName").split("\\.jpg")[0]+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//更新jnews
			JNews record = new JNews();
			record.setDm(twdm);
			record = jNewsDao.select(record);
			record.setDm(twdm);
			record.setTitle(title);
			record.setSqr(user.getUname());
			record.setImgurl(picObj.getJSONObject("data").getString("src"));
			record.setHref(AdminProperties.SERVER_URL+filePath+"/"+fileName);
			record.setRemark(content.getBytes("utf-8"));
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews lnews= new LNews();
			lnews.setDm(twdm);
			lnews.setCzr(czr);
			lnews.setOldZt(record.getZt());
			lnews.setNewZt(record.getZt());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("小图文").append("(").append(record.getDm()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("进行修改，现处于").append(XWZT.valueOf(record.getZt()-1)).append("状态");
			lnews.setRemark(remarkSb.toString());
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OperException(编辑小图文失败);
		}
		
	}
	/** 删除大图文
	 * 根据穿过来的twdm找到对应的id然后删除
	 * @param twdm
	 * @return
	 * @throws OperException 
	 */
	public void delDtw (String twdm) throws OperException {
		try {
			JNews record = new JNews();
			record.setDm(twdm);
			record = jNewsDao.select(record);
			jNewsDao.deleteByPrimaryKey(record.getId());
		} catch (Exception e) {
			throw new OperException(删除大图文失败);
		}
	}
	/** 删除小图文
	 * 根据穿过来的twdm找到对应的id然后删除
	 * @param twdm
	 * @return
	 * @throws OperException 
	 */
	public void delXtw (String twdm) throws OperException {
		try {
			JNews record = new JNews();
			record.setDm(twdm);
			record = jNewsDao.select(record);
			jNewsDao.deleteByPrimaryKey(record.getId());
		} catch (Exception e) {
			throw new OperException(删除小图文失败);
		}
	}
	/**
	 * 大图文上架
	 * @param twdm
	 * @param czr
	 * @return
	 * 
	 * 1.将j_news中的记录的状态变为一审中
	 * 2.在l_news中插入一条记录：
	 * date: 当前系统时间
	 * dm ： twdm
	 * czr: 当前用户的uname（czr）
	 * oldzt: null
	 * newzt: 一审中
	 * remark:大图文（<twdm>）与<系统时间>被提交，现处于一审中
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void sjDtw (String twdm,String czr) throws OperException {
		try {
			//将zt改为一审中
			JNews record = new JNews();
			record.setDm(twdm);
			record = jNewsDao.select(record);
			LNews lnews =new LNews();
			lnews.setOldZt(record.getZt());
			record.setZt(XWZT.一审中.getValue());
			jNewsDao.updateByPrimaryKey(record);
			
			//在l_record中插入相关记录
			lnews.setDate(new Date());
			lnews.setDm(twdm);
			lnews.setCzr(czr);
			lnews.setNewZt(XWZT.一审中.getValue());
			StringBuilder resultSb = new StringBuilder();
			resultSb.append("大图文（").append(twdm).append("）");
			resultSb.append("于").append(StringUtils.getCurrTime()).append("被").append(czr).append("提交，现处于").append(XWZT.一审中);
			lnews.setRemark(resultSb.toString());
			lNewsDao.insertSelective(lnews);
		} catch (Exception e) {
			throw new OperException(上架大图文失败);
		}
		
	}
	/**
	 * 小图文上架
	 * @param twdm
	 * @param czr
	 * @return
	 * 
	 * 1.将j_news中的记录的状态变为一审中
	 * 2.在l_news中插入一条记录：
	 * date: 当前系统时间
	 * dm ： twdm
	 * czr: 当前用户的uname（czr）
	 * oldzt: null
	 * newzt: 一审中
	 * remark:小图文（<twdm>）与<系统时间>被提交，现处于一审中
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void sjXtw (String twdm,String czr) throws OperException {
		try {
			//将zt改为一审中
			JNews record = new JNews();
			record.setDm(twdm);
			record = jNewsDao.select(record);
			LNews lnews =new LNews();
			lnews.setOldZt(record.getZt());
			record.setZt(XWZT.一审中.getValue());
			jNewsDao.updateByPrimaryKey(record);
			
			//在l_record中插入相关记录
			lnews.setDate(new Date());
			lnews.setDm(twdm);
			lnews.setCzr(czr);
			lnews.setNewZt(XWZT.一审中.getValue());
			StringBuilder resultSb = new StringBuilder();
			resultSb.append("小图文（").append(twdm).append("）");
			resultSb.append("于").append(StringUtils.getCurrTime()).append("被").append(czr).append("提交，现处于").append(XWZT.一审中);
			lnews.setRemark(resultSb.toString());
			lNewsDao.insertSelective(lnews);
		} catch (Exception e) {
			throw new OperException(上架小图文失败);
		}
		
	}
}
