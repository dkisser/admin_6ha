package org.lf.web.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.lf.admin.db.dao.CGroupMapper;
import org.lf.admin.db.dao.JNewsMapper;
import org.lf.admin.db.dao.JPicMapper;
import org.lf.admin.db.dao.JTpMapper;
import org.lf.admin.db.dao.JYxMapper;
import org.lf.admin.db.dao.UserMapper;
import org.lf.admin.db.pojo.CGroup;
import org.lf.admin.db.pojo.JNews;
import org.lf.admin.db.pojo.JTp;
import org.lf.admin.db.pojo.JYx;
import org.lf.admin.db.pojo.User;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.XWZT;
import org.lf.utils.DateUtils;
import org.lf.utils.HtmlSpiderUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/** * @author  wenchen 
 * @date 创建时间：2017年8月8日 下午4:11:10 
 * @version 1.0 
 * @parameter */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class WebHomeServiceTest {
	
	@Autowired
	private JNewsMapper jNewsMapper;
	@Autowired
	private JPicMapper jPicDao;
	@Autowired
	private JTpMapper jTpDao;
	@Autowired
	private JYxMapper jYxDao;
	@Autowired
	private UserMapper userDao;
	@Autowired
	private CGroupMapper cGroupDao;
	
	private HtmlSpiderUtils utils = new HtmlSpiderUtils();
	
	private Random random = new Random();
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private SimpleDateFormat ss = new SimpleDateFormat("yyyyMMddHHmmss");
	
	@Test
	public void getData(){
		String result = HtmlSpiderUtils.getRequestStr("http://news.17173.com/chinajoy/2017/", null,null);
		result = utils.getHtmlBodyStr(result);
		String pn_game = utils.getHtmlDiv(result, null, "game", "sg");
		List<JYx> bdyxList = utils.getBDYXList(pn_game);
		for (JYx yx:bdyxList) {
			jYxDao.insertSelective(yx);
		}
		String pn_dtkz = utils.getHtmlDiv(result, null, "gif", "game");
		List<JTp> dtkzList = utils.getDTKZList(pn_dtkz);
		for (JTp tp:dtkzList) {
			jTpDao.insertSelective(tp);
		}
		String pn_sgmv = utils.getHtmlDiv(result, null, "sg", "inlive");
		List<JTp> sgmvList = utils.getSGMVList(pn_sgmv);
		for (JTp tp:sgmvList) {
			jTpDao.insertSelective(tp);
		}
//		String pn_vr = utils.getHtmlDiv(result, null, "vr", "news");
//		String pn_news = utils.getHtmlDiv(result, "footer", "news", null);
//		List<JNews> newsList = utils.getVrC1Html(pn_vr);
//		for (JNews news : newsList) {
//			jNewsMapper.insertSelective(news);
//		}
//		newsList = utils.getVrC2Html(pn_vr);
//		for (JNews news : newsList) {
//			jNewsMapper.insertSelective(news);
//		}
//		jNewsMapper.insertSelective(utils.getVrC3Html(pn_vr));
//		newsList = utils.getNewsHtml(pn_news);
//		for (JNews news : newsList) {
//			jNewsMapper.insertSelective(news);
//		}
	}
	
	/**
	 * 在j_news中插入i个为lx，zt的记录,若lx为vr中部或vr右部新闻，则要将imgurl也插入
	 * @param i
	 * @param zt
	 * @param lx
	 */
	@Transactional(rollbackFor=Exception.class)
	public void GenJNewsTestData (int i,XWZT zt,XWLX lx,String imgUrl) {
		List<User> userList = userDao.selectList(null);
		int r_user ;
		List<CGroup> groupList = cGroupDao.selectList(null);
		int r_group;
		JNews news ;
		if (lx.getValue()==XWLX.小图文.getValue()||lx.getValue()==XWLX.大图文.getValue()) {
			for (int j = 0 ;j<i;j++) {
				news= new JNews();
				r_user = random.nextInt(userList.size());
				r_group = random.nextInt(groupList.size());
				news.setLx(lx.getValue());
				news.setTitle(sdf.format(new Date())+"插入的"+lx+"测试数据"+j);
				news.setSqr(userList.get(r_user).getUname());
				news.setHref("http://news.17173.com/content/07292017/003105608.shtml");
				news.setZt(zt.getValue());
				news.setImgurl(imgUrl);
				news.setDm(DateUtils.toLong(new Date())+"");
				jNewsMapper.insertSelective(news);
			}
		} else {
			for (int j = 0 ;j<i;j++) {
				news= new JNews();
				r_user = random.nextInt(userList.size());
				r_group = random.nextInt(groupList.size());
				news.setLx(lx.getValue());
				news.setTitle(sdf.format(new Date())+"插入的"+lx+"测试数据"+j);
				news.setSqr(userList.get(r_user).getUname());
				news.setHref("http://news.17173.com/content/07292017/003105608.shtml");
				news.setZt(zt.getValue());
				news.setDm(DateUtils.toLong(new Date())+"");
				jNewsMapper.insertSelective(news);
			}
		}
	}
	
	@Test
	public void insertTestData(){
		GenJNewsTestData(5, XWZT.已过期, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
		GenJNewsTestData(5, XWZT.一审中, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
		GenJNewsTestData(5, XWZT.一审未通过, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
		GenJNewsTestData(5, XWZT.二审中, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
		GenJNewsTestData(5, XWZT.二审未通过, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
		GenJNewsTestData(5, XWZT.已过期, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
		GenJNewsTestData(5, XWZT.编辑中, XWLX.小图文, "http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg");
	}
	
}
