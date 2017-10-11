package org.lf.admin.service.tp;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.lf.admin.db.dao.JTpMapper;
import org.lf.admin.db.dao.LNewsMapper;
import org.lf.admin.db.pojo.JTp;
import org.lf.admin.db.pojo.LNews;
import org.lf.admin.service.OperErrCode;
import org.lf.admin.service.OperException;
import org.lf.admin.service.TPLX;
import org.lf.admin.service.XWZT;
import org.lf.admin.service.tw.TWSJService;
import org.lf.utils.AdminProperties;
import org.lf.utils.AdminUtils;
import org.lf.utils.DateUtils;
import org.lf.utils.EasyuiDatagrid;
import org.lf.utils.PageNavigator;
import org.lf.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:33:42 
 * @version 1.0 
 * @parameter */
@Service
public class TPSJService {
	
	public static final OperErrCode 新增动态图片失败 = new OperErrCode("040401", "新增动态图片失败");
	public static final OperErrCode 删除动态图片失败 = new OperErrCode("040402", "删除动态图片失败");
	public static final OperErrCode 上架动态图片失败 = new OperErrCode("040403", "上架动态图片失败");
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	private JTpMapper jTpDao;

	@Autowired
	private TWSJService twsjService;
	
	@Autowired
	private LNewsMapper lNewsDao;
	/**
	 * 得到当前所有的动态图片
	 * @param page
	 * @param rows
	 * @return
	 */
	public EasyuiDatagrid<JTp> getDttpList(int page,int rows){
		Map<String,Object> param = new HashMap<String,Object>();
		List<Integer> lxList = new ArrayList<Integer>();
		lxList.add(TPLX.正经逛展会_大图.getValue());
		lxList.add(TPLX.正经逛展会_小图.getValue());
		param.put("lxList", lxList);
		List<JTp> tpList = jTpDao.getTpByZTAndLx(param);
		PageNavigator<JTp> pg = new PageNavigator<>(tpList, rows);
		EasyuiDatagrid<JTp> datagrid =  new EasyuiDatagrid<>(pg.getPage(page), tpList.size());
		return datagrid;	
	}
	
	/**
	 * 得到当前所有的普通图片
	 * @param page
	 * @param rows
	 * @return
	 */
	public EasyuiDatagrid<JTp> getPttpList(int page,int rows){
		Map<String,Object> param = new HashMap<String,Object>();
		List<Integer> lxList = new ArrayList<Integer>();
		lxList.add(TPLX.ShowGirl美女.getValue());
		param.put("lxList", lxList);
		List<JTp> tpList = jTpDao.getTpByZTAndLx(param);
		PageNavigator<JTp> pg = new PageNavigator<>(tpList, rows);
		EasyuiDatagrid<JTp> datagrid =  new EasyuiDatagrid<>(pg.getPage(page), tpList.size());
		return datagrid;	
	}
	
	/**
	 * 在数据库中插入一个图片记录
	 * 1.将图片上传到指定目录
	 * 2.在数据库中插入一条记录
	 * @param lx
	 * @param pic
	 * @throws OperException 
	 * @throws IOException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void addDttp(HttpSession session,String czr,String title,String content,Integer lx,MultipartFile pic) throws OperException, IOException{
		JSONObject picObj = twsjService.uploadPic(pic, session, AdminProperties.DTTP_PIC_TARGDIR);
		ServletContext servletContext = session.getServletContext();
		String serverRealPath = servletContext.getRealPath("");
		String filePath = String.format(AdminProperties.DTTP_HTML_TARGDIR, sdf.format(new Date()));
		String fileName = picObj.getJSONObject("data").getString("picName").split("\\.jpg")[0]+".html";
		//生成对应的html文件
		AdminUtils.genHtml(content, title, serverRealPath+filePath, fileName);
		try {
			//在jtp中插入记录
			JTp tp = new JTp();
			tp.setLx(lx);
			tp.setZt(XWZT.编辑中.getValue());
			tp.setImgurl(picObj.getJSONObject("data").getString("src"));
			tp.setHref(AdminProperties.SERVER_URL+filePath+"/"+fileName);
			jTpDao.insertSelective(tp);
			//在l_news中插入一条记录
			LNews lnews= new LNews();
			tp = jTpDao.select(tp);
			lnews.setDm(tp.getId().toString());
			lnews.setCzr(czr);
			lnews.setOldZt(null);
			lnews.setNewZt(XWZT.编辑中.getValue());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("动态图片").append("(").append(tp.getId().toString()).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr).append("提交，");
			remarkSb.append("现处于").append(XWZT.编辑中);
			lnews.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(lnews);
		}catch (Exception e) {
			throw new OperException(新增动态图片失败);
		}
	}
	
	/** 删除动态图片
	 * 根据穿过来的id删除
	 * @param twdm
	 * @return
	 * @throws OperException 
	 */
	public void delDttp (Integer id) throws OperException {
		try {
			jTpDao.deleteByPrimaryKey(id);
		} catch (Exception e) {
			throw new OperException(删除动态图片失败);
		}
	}
	
	/**
	 * 动态图片上架
	 * @param twdm
	 * @param czr
	 * @return
	 * 
	 * 1.将j_tp中的记录的状态变为一审中
	 * 2.在l_news中插入一条记录：
	 * date: 当前系统时间
	 * dm ： twdm
	 * czr: 当前用户的uname（czr）
	 * oldzt: null
	 * newzt: 一审中
	 * remark:动态图片（<twdm>）与<系统时间>被提交，现处于一审中
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void sjDttp (Integer id,String czr) throws OperException {
		try {
			//将zt改为一审中
			JTp tp = new JTp();
			tp.setId(id);
			LNews lnews =new LNews();
			lnews.setOldZt(tp.getZt());
			tp.setZt(XWZT.一审中.getValue());
			jTpDao.updateByPrimaryKeySelective(tp);
			//在l_record中插入相关记录
			lnews.setDate(new Date());
			lnews.setDm(id.toString());
			lnews.setCzr(czr);
			lnews.setNewZt(XWZT.一审中.getValue());
			StringBuilder resultSb = new StringBuilder();
			resultSb.append("动态图片（").append(id.toString()).append("）");
			resultSb.append("于").append(StringUtils.getCurrTime()).append("被").append(czr).append("提交，现处于").append(XWZT.一审中);
			lnews.setRemark(resultSb.toString());
			lNewsDao.insertSelective(lnews);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OperException(上架动态图片失败);
		}
		
	}
	
}
