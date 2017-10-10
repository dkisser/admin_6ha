package org.lf.admin.service.tw;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.lf.admin.db.dao.JNewsMapper;
import org.lf.admin.db.dao.LNewsMapper;
import org.lf.admin.db.dao.VNewsMapper;
import org.lf.admin.db.pojo.JNews;
import org.lf.admin.db.pojo.LNews;
import org.lf.admin.db.pojo.VNews;
import org.lf.admin.service.OperErrCode;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.XWZT;
import org.lf.utils.DateUtils;
import org.lf.utils.EasyuiDatagrid;
import org.lf.utils.PageNavigator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** * @author  wenchen 
 * @date 创建时间：2017年9月1日 上午11:40:59 
 * @version 1.0 
 * @parameter */
@Service 
public class TWZSService {
	
	@Autowired
	private VNewsMapper vNewsDao;
	
	@Autowired
	private JNewsMapper jNewsDao;
	
	@Autowired
	private LNewsMapper lNewsDao;
	
	public static final OperErrCode 上架新闻失败 = new OperErrCode("020601", "上架新闻失败");
	public static final OperErrCode 驳回新闻失败 = new OperErrCode("020602", "驳回新闻失败");
	
	/**
	 * 查询当前glr下面的所有二审申请
	 * @param glr
	 * @param sqr
	 * @param title
	 * @param page
	 * @param rows
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public EasyuiDatagrid<VNews> getZSnewsList(String glr,String sqr,String title,XWLX lx,int page,int rows) throws UnsupportedEncodingException{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("glr", glr);
		param.put("sqr", sqr);
		param.put("lx", lx.getValue());
		param.put("title", title);
		List<Integer> ztList = new ArrayList<Integer>();
		ztList.add(XWZT.二审中.getValue());
		param.put("ztList", ztList);
		List<VNews> newsList = vNewsDao.getVnewsListFuzzy(param);
		for (VNews news: newsList) {
			if (news.getRemark()!=null) {
				news.setRemarkStr(new String (news.getRemark(),"utf-8"));
			}
		}
		PageNavigator<VNews> pn = new PageNavigator<>(newsList, rows);
		EasyuiDatagrid<VNews> datagrid = new EasyuiDatagrid<>(pn.getPage(page), newsList.size());
		return datagrid;
	}
	/**
	 * 提交news到上架中状态
	 * 1.先将原来的大图文状态设置为已过期
	 * 2.将该news的状态修改为上架中
	 * 3.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:二审中
	 * new_zt:上架中
	 * remark:大图文（<dm>）于<系统时间>被提交，经<czr>审批通过，现处于<当前状态>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void groundDtwNews (String dm,String czr) throws OperException {
		try{
			//先将原来的大图文状态设置为已过期
			JNews old = new JNews();
			old.setLx(XWLX.大图文.getValue());
			old.setZt(XWZT.上架中.getValue());
			old = jNewsDao.select(old);
			old.setZt(XWZT.已过期.getValue());
			jNewsDao.updateByPrimaryKeySelective(old);
			//news修改状态
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setZt(XWZT.上架中.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.二审中.getValue());
			news.setNewZt(XWZT.上架中.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("大图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被提交，经").append(czr);
			remarkSb.append("审批通过，现处于").append(XWZT.上架中);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(上架新闻失败);
		}
		
	}
	
	/**
	 * 提交news到上架中状态
	 * 1.先将原来的小图文状态设置为已过期
	 * 2.将该news的状态修改为上架中
	 * 3.在l_news中插入两条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:二审中
	 * new_zt:上架中
	 * remark:小图文（<dm>）于<系统时间>被提交，经<czr>审批通过，现处于<当前状态>
	 * * dm
	 * czr:当前用户
	 * old_zt:二审中
	 * new_zt:上架中
	 * remark:小图文（<dm>）于<系统时间>经<czr>审批下架，现处于<当前状态>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void groundXtwNews (String dm,String czr,String replaceDm) throws OperException {
		try{
			//先将原来的大图文状态设置为已过期
			JNews old = new JNews();
			old.setDm(replaceDm);
			old = jNewsDao.select(old);
			old.setZt(XWZT.已过期.getValue());
			jNewsDao.updateByPrimaryKeySelective(old);
			//news修改状态
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setZt(XWZT.上架中.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.二审中.getValue());
			news.setNewZt(XWZT.上架中.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("大图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被提交，经").append(czr);
			remarkSb.append("审批通过，现处于").append(XWZT.上架中);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
			//在l_news中插入一条记录
			LNews oldnews = new LNews();
			oldnews.setDm(dm);
			oldnews.setCzr(czr);
			oldnews.setOldZt(XWZT.二审中.getValue());
			oldnews.setNewZt(XWZT.上架中.getValue());
			oldnews.setDate(new Date());
			StringBuilder remarkSb_old = new StringBuilder();
			remarkSb_old.append("大图文").append("(").append(dm).append(")");
			remarkSb_old.append("于").append(DateUtils.toString(new Date())).append("经").append(czr);
			remarkSb_old.append("审批下架，现处于").append(XWZT.已过期);
			oldnews.setRemark(remarkSb_old.toString());
			lNewsDao.insertSelective(oldnews);
		} catch(Exception e){
			e.printStackTrace();
			throw new OperException(上架新闻失败);
		}
		
	}
	
	/**
	 * 驳回提交的news
	 * 1.将该news的状态修改二审失败状态
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:二审中
	 * new_zt:二审失败
	 * remark:大图文（<dm>）于<系统时间>被<czr>提交进行二审，现处于<当前状态>状态，驳回原因<remark>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void revertDtw (String dm,String czr,String remark) throws OperException {
		try{
			//news修改状态
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setZt(XWZT.二审未通过.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.二审中.getValue());
			news.setNewZt(XWZT.二审未通过.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("大图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("提交进行二审，现处于").append(XWZT.二审未通过).append("状态，");
			remarkSb.append("驳回原因：").append(remark);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(驳回新闻失败);
		}
	}
	
	/**
	 * 驳回提交的news
	 * 1.将该news的状态修改二审失败状态
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:二审中
	 * new_zt:二审失败
	 * remark:大图文（<dm>）于<系统时间>被<czr>提交进行二审，现处于<当前状态>状态，驳回原因<remark>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void revertXtw (String dm,String czr,String remark) throws OperException {
		try{
			//news修改状态
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setZt(XWZT.二审未通过.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.二审中.getValue());
			news.setNewZt(XWZT.二审未通过.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("小图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("提交进行二审，现处于").append(XWZT.二审未通过).append("状态，");
			remarkSb.append("驳回原因：").append(remark);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(驳回新闻失败);
		}
	}
	
	/**
	 * 得到当前所有的正在上架中的小图文
	 * @return
	 */
	public EasyuiDatagrid<VNews> chooseXtwList(int page,int rows){
		VNews record = new VNews();
		record.setZt(XWZT.上架中.getValue());
		record.setLx(XWLX.小图文.getValue());
		List<VNews> newsList = vNewsDao.selectList(record);
		PageNavigator<VNews> pn = new PageNavigator<>(newsList, rows);
		EasyuiDatagrid<VNews> datagrid = new EasyuiDatagrid<>(pn.getPage(page), newsList.size());
		return datagrid;
	}
	
}
