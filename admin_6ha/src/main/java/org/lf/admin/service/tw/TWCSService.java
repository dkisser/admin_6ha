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
public class TWCSService {

	@Autowired
	private VNewsMapper vNewsDao;
	
	@Autowired
	private JNewsMapper jNewsDao;
	
	@Autowired
	private LNewsMapper lNewsDao;
	
	public static final OperErrCode 提交终审失败 = new OperErrCode("020501", "提交终审失败");
	public static final OperErrCode 驳回失败 = new OperErrCode("020502", "驳回失败");
	
	/**
	 * 根据sqr、title进行模糊查找得到vnews的记录
	 * @param sqr
	 * @param title
	 * @param page
	 * @param rows
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public EasyuiDatagrid<VNews> getCSNewsList(String sqr,String title,String fzr,XWLX lx,int page,int rows) throws UnsupportedEncodingException{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("fzr", fzr);
		param.put("sqr", sqr);
		param.put("lx",lx.getValue());
		param.put("title", title);
		List<Integer> ztList = new ArrayList<Integer>();
		ztList.add(XWZT.一审中.getValue());
		param.put("ztList", ztList);
		List<VNews> newsList = vNewsDao.getVnewsListFuzzy(param);
		for (VNews news: newsList) {
			if (news.getRemark()!=null) {
				news.setRemarkStr(new String (news.getRemark(),"utf-8"));
			}
		}
		PageNavigator<VNews> pn = new PageNavigator<>(newsList, rows);
		EasyuiDatagrid<VNews> result = new EasyuiDatagrid<VNews>(pn.getPage(page), newsList.size());
		return result;
	}
	
	/**
	 * 提交大图文news到终审状态
	 * 1.将该news的状态修改为二审中
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:二审中
	 * remark:大图文（<dm>）于<系统时间>被提交，经<czr>审批通过，现处于<当前状态>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void submitDtwZS (String dm,String czr) throws OperException {
		try{
			//news修改状态
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setZt(XWZT.二审中.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.二审中.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("大图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("经").append(czr);
			remarkSb.append("审批通过，现处于").append(XWZT.二审中);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(提交终审失败);
		}
		
	}
	
	/**
	 * 提交news到终审状态
	 * 1.将该news的状态修改为二审中
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:二审中
	 * remark:大图文（<dm>）于<系统时间>被提交，经<czr>审批通过，现处于<当前状态>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void submitXtwZS (String dm,String czr) throws OperException {
		try{
			//news修改状态
			JNews record = new JNews();
			record.setDm(dm);
			record = jNewsDao.select(record);
			record.setZt(XWZT.二审中.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.二审中.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("小图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("经").append(czr);
			remarkSb.append("审批通过，现处于").append(XWZT.二审中);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(提交终审失败);
		}
		
	}
	
	/**
	 * 驳回提交的大图文news
	 * 1.将该news的状态修改一审失败状态
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:一审失败
	 * remark:大图文（<dm>）于<系统时间>被<czr>提交进行一审，现处于<当前状态>状态，驳回原因<remark>
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
			record.setZt(XWZT.一审未通过.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.一审未通过.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("大图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("驳回，现处于").append(XWZT.一审未通过).append("状态，");
			remarkSb.append("驳回原因：").append(remark);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			e.printStackTrace();
			throw new OperException(驳回失败);
		}
	}
	
	/**
	 * 驳回提交的小图文news
	 * 1.将该news的状态修改一审失败状态
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:一审失败
	 * remark:小图文（<dm>）于<系统时间>被<czr>提交进行一审，现处于<当前状态>状态，驳回原因<remark>
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
			record.setZt(XWZT.一审未通过.getValue());
			jNewsDao.updateByPrimaryKeySelective(record);
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.一审未通过.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("小图文").append("(").append(dm).append(")");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("被").append(czr);
			remarkSb.append("驳回，现处于").append(XWZT.一审未通过).append("状态，");
			remarkSb.append("驳回原因：").append(remark);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			e.printStackTrace();
			throw new OperException(驳回失败);
		}
	}
	
}
