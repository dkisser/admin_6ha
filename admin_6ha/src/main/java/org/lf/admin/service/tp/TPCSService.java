package org.lf.admin.service.tp;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.lf.admin.db.dao.JTpMapper;
import org.lf.admin.db.dao.LNewsMapper;
import org.lf.admin.db.dao.VTpMapper;
import org.lf.admin.db.pojo.JTp;
import org.lf.admin.db.pojo.LNews;
import org.lf.admin.db.pojo.VTp;
import org.lf.admin.service.OperErrCode;
import org.lf.admin.service.OperException;
import org.lf.admin.service.XWZT;
import org.lf.utils.DateUtils;
import org.lf.utils.EasyuiDatagrid;
import org.lf.utils.PageNavigator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** * @author  wenchen 
 * @date 创建时间：2017年10月10日 下午3:33:42 
 * @version 1.0 
 * @parameter */
@Service
public class TPCSService {
	
	@Autowired
	private VTpMapper vTpDao;
	
	@Autowired
	private JTpMapper jTpDao;
	
	@Autowired
	private LNewsMapper lNewsDao;
	
	public static final OperErrCode 提交终审失败 = new OperErrCode("040501", "提交终审失败");
	public static final OperErrCode 驳回失败 = new OperErrCode("040502", "驳回失败");
	
	/**
	 * 根据sqr进行模糊查找得到vnews的记录
	 * @param sqr
	 * @param title
	 * @param page
	 * @param rows
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public EasyuiDatagrid<VTp> getTPCSList(String sqr,String fzr,List<Integer> lxList,int page,int rows) throws UnsupportedEncodingException{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("fzr", fzr);
		param.put("sqr", sqr);
		List<Integer> ztList = new ArrayList<Integer>();
		ztList.add(XWZT.一审中.getValue());
		param.put("ztList", ztList);
		param.put("lxList", lxList);
		List<VTp> tpList = vTpDao.getDttpList(param);
		for (VTp tp: tpList) {
			if (tp.getRemark()!=null) {
				tp.setRemarkStr(new String (tp.getRemark(),"utf-8"));
			}
		}
		PageNavigator<VTp> pn = new PageNavigator<>(tpList, rows);
		EasyuiDatagrid<VTp> result = new EasyuiDatagrid<VTp>(pn.getPage(page), tpList.size());
		return result;
	}
	
	/**
	 * 驳回提交的动态图片news
	 * 1.将该news的状态修改一审失败状态
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:一审失败
	 * remark:动态图片（<dm>）于<系统时间>被<czr>提交进行一审，现处于<当前状态>状态，驳回原因<remark>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void revertDttp (String dm,String czr,String remark) throws OperException {
		try{
			
			//tp修改状态
			JTp tp = new JTp();
			tp.setDm(dm);
			tp = jTpDao.select(tp);
			tp.setZt(XWZT.一审未通过.getValue());
			jTpDao.updateByPrimaryKeySelective(tp);
			
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.一审未通过.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("动态图片").append("（").append(dm).append("）");
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
	 * 提交动态图片news到终审状态
	 * 1.将该news的状态修改为二审中
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:二审中
	 * remark:动态图片（<dm>）于<系统时间>被提交，经<czr>审批通过，现处于<当前状态>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void submitDttpZS (String dm,String czr) throws OperException {
		try{
			//tp修改状态
			JTp tp = new JTp();
			tp.setDm(dm);
			tp = jTpDao.select(tp);
			tp.setZt(XWZT.二审中.getValue());
			jTpDao.updateByPrimaryKeySelective(tp);
			
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.二审中.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("动态图片").append("（").append(dm).append("）");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("经").append(czr);
			remarkSb.append("审批通过，现处于").append(XWZT.二审中);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(提交终审失败);
		}
		
	}
	
	/**
	 * 得到VTp的一条记录，同时将blob转换成字符串
	 * @param news
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public VTp getVTp(VTp tp) {
		 VTp result = vTpDao.select(tp);
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
	 * 驳回提交的普通图片news
	 * 1.将该news的状态修改一审失败状态
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:一审失败
	 * remark:动态图片（<dm>）于<系统时间>被<czr>提交进行一审，现处于<当前状态>状态，驳回原因<remark>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void revertPttp (String dm,String czr,String remark) throws OperException {
		try{
			
			//tp修改状态
			JTp tp = new JTp();
			tp.setDm(dm);
			tp = jTpDao.select(tp);
			tp.setZt(XWZT.一审未通过.getValue());
			jTpDao.updateByPrimaryKeySelective(tp);
			
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.一审未通过.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("普通图片").append("（").append(dm).append("）");
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
	 * 提交普通图片news到终审状态
	 * 1.将该news的状态修改为二审中
	 * 2.在l_news中插入一条记录：
	 * dm
	 * czr:当前用户
	 * old_zt:一审中
	 * new_zt:二审中
	 * remark:动态图片（<dm>）于<系统时间>被提交，经<czr>审批通过，现处于<当前状态>
	 * @param dm
	 * @throws OperException 
	 */
	@Transactional(rollbackFor=Exception.class)
	public void submitPttpZS (String dm,String czr) throws OperException {
		try{
			//tp修改状态
			JTp tp = new JTp();
			tp.setDm(dm);
			tp = jTpDao.select(tp);
			tp.setZt(XWZT.二审中.getValue());
			jTpDao.updateByPrimaryKeySelective(tp);
			
			//在l_news中插入一条记录
			LNews news = new LNews();
			news.setDm(dm);
			news.setCzr(czr);
			news.setOldZt(XWZT.一审中.getValue());
			news.setNewZt(XWZT.二审中.getValue());
			news.setDate(new Date());
			StringBuilder remarkSb = new StringBuilder();
			remarkSb.append("普通图片").append("（").append(dm).append("）");
			remarkSb.append("于").append(DateUtils.toString(new Date())).append("经").append(czr);
			remarkSb.append("审批通过，现处于").append(XWZT.二审中);
			news.setRemark(remarkSb.toString());
			lNewsDao.insertSelective(news);
		} catch(Exception e){
			throw new OperException(提交终审失败);
		}
		
	}
	
}
