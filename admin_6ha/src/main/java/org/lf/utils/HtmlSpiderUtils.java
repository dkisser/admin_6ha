package org.lf.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.lf.admin.db.pojo.JNews;
import org.lf.admin.db.pojo.JTp;
import org.lf.admin.db.pojo.JYx;
import org.lf.admin.service.TPLX;
import org.lf.admin.service.XWLX;
import org.lf.admin.service.XWZT;
import org.springframework.transaction.annotation.Transactional;

/** * @author  wenchen 
 * @date 创建时间：2017年8月15日 下午2:03:23 
 * @version 1.0 
 * @parameter */
public class HtmlSpiderUtils {
	
	
	/**
	 * 以特定方式向这个url发送请求，获得请求的字符串
	 * @param url
	 * @param method
	 * @return
	 */
	public static String getRequestStr(String url,String method,Map<String,?> map) {
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		URL reuqestUrl = null;
		StringBuilder resultSb = new StringBuilder();
		if (map != null) {
			Set<String> set = map.keySet();
			StringBuilder queryParam = new StringBuilder("?");
			for (String s : set) {
				queryParam.append(s).append("=").append(map.get(s).toString()).append("&");
			}
			queryParam.deleteCharAt(queryParam.length()-1);
			url += queryParam.toString();
		}
		try {
			reuqestUrl = new URL(url);
			conn = (HttpURLConnection) reuqestUrl.openConnection();
			if (StringUtils.isEmpty(method)) {
				conn.setRequestMethod("GET");
			} else {
				conn.setRequestMethod(method);
			}
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while((line=reader.readLine())!=null){
				resultSb.append(line);
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				conn.disconnect();
			}
		}
		return resultSb.toString();
	}
	
	/**
	 * 将html页面中body里面的内容得到
	 * (去掉空格后的,同时也去掉了html注释)
	 * @param htmlStr
	 * @return
	 */
	public String getHtmlBodyStr(String htmlStr){
		
		htmlStr = htmlStr.replaceAll("\\s*", "");//去掉所有的空格
		String bodyPattern = "<body.*>.*</body>";
		Pattern p = Pattern.compile(bodyPattern);
		Matcher matcher = p.matcher(htmlStr);
		String body = null; 
		while(matcher.find()){
			body = matcher.group();
			body = body.replaceAll("<!--.+?-->", "");//去掉html注释
		}
		return body;
	}
	
	/**
	 * 解析得到pn_vr或pn_news中的html
	 * @param bodyStr
	 * @param afterClass
	 * @param idName
	 * @param afterId
	 * @return
	 */
	public String getHtmlDiv (String bodyStr,String afterClass,String idName,String afterId) {
		String start = null;
		String end = null;
		if (!StringUtils.isEmpty(afterId)) {
			start = "<divclass=\"pnpn-"+idName+"section\"id=\"pn_"+idName+"\">";
			end = "</div><divclass=\"pnpn-"+afterId+"section\"id=\"pn_"+afterId+"\">";
		} else {
			start="<divclass=\"pnpn-"+idName+"section\"id=\"pn_"+idName+"\">";
			end="</div><divclass=\""+afterClass+"\".*?>";
		}
		String[] result = bodyStr.split(start);
		result = result[1].split(end);
		
		return result[0];
	}
	
	/**
	 * 解析得到col-c1下的所有图片和图片在服务器上的地址，还有超链接的href
	 * @param divStr
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public List<JNews> getVrC1Html (String divStr) {
		/**
		 * 将c1中的html获得
		 */
		List<JNews> newsList = new ArrayList<JNews>();
		String[] c1Div = divStr.split("<divclass=\"col-c1\">");
		c1Div = c1Div[1].split("</div><divclass=\"col-c2\">");
		String regex = "<ahref=\"(.*?)\".*?>(.*?)</a>";
		Pattern p = Pattern.compile(regex); 
		Matcher matcher = p.matcher(c1Div[0]);
		JNews news = null;
		while(matcher.find()){
			news = new JNews();
			news.setHref(matcher.group(1));
			news.setTitle(matcher.group(2));
			news.setLx(XWLX.日看点左侧新闻.getValue());
			newsList.add(news);
		};
		return newsList;
	}
	
	/**
	 * 解析得到col-c2下的所有图片和图片在服务器上的地址，还有超链接的href
	 * @param divStr
	 * @return
	 */
	public List<JNews> getVrC2Html (String divStr) {
		/**
		 * 将c2中的html获得
		 */
		List<JNews> newsList = new ArrayList<JNews>();
		String[] c2Div = divStr.split("<divclass=\"col-c2\">");
		c2Div = c2Div[1].split("</div><divclass=\"col-c3\">");
		String regex = "<ahref=\"(.*?)\".*?>.*?<imgsrc=\"(.*?)\".*?><spanclass=\"txt\">(.*?)</span></a>";
		Pattern p = Pattern.compile(regex); 
		Matcher matcher = p.matcher(c2Div[0]);
		JNews news = null;
		while(matcher.find()){
			news = new JNews();
			news.setHref(matcher.group(1));
			news.setImgurl(matcher.group(2));
			news.setTitle(matcher.group(3));
			news.setLx(XWLX.小图文.getValue());
			newsList.add(news);
		};
		return newsList;
	}
	
	/**
	 * 解析得到col-c3下的所有图片和图片在服务器上的地址，还有超链接的href
	 * @param divStr
	 * @return
	 */
	public JNews getVrC3Html (String divStr) {
		/**
		 * 将c3中的img的src和对应的标题名称获得，存进一个文件
		 */
		String[] c3Div = divStr.split("<divclass=\"col-c3\">");
		String txtPattern = "<ahref=\"(.*?)\"";
		Pattern p = Pattern.compile(txtPattern);
		Matcher matcher = p.matcher(c3Div[1]);
		String href=null;
		while(matcher.find()){
			href=matcher.group(1);
		}
		String img = c3Div[1].split("<a.*?>")[1];
		String imgSrc = img.split("\"")[1];
		txtPattern = "<span.*?>(.*)</span>";
		p = Pattern.compile(txtPattern);
		matcher = p.matcher(img);
		String txt = null;
		while(matcher.find()){
			txt = matcher.group(1);
		}
		JNews news = new JNews();
		news.setTitle(txt);
		news.setImgurl(imgSrc);
		news.setHref(href);
		news.setLx(XWLX.大图文.getValue());
		return news;
	}
	
	/**
	 * 解析得到pn_news下pn_bd中的所有a标签的href和值，还有date
	 * @param divStr
	 * @return
	 */
	public List<JNews> getNewsHtml(String divStr){
		divStr = divStr.split("<divclass=\"pn-bd\">")[1];
		String regex = "<ahref=\"(.*?)\".*?><divclass=\"tit\">(.*?)</div><divclass=\"date\">(.*?)</div></a>";
		List<JNews> newsList = new ArrayList<JNews>();
		Pattern p = Pattern.compile(regex);
		Matcher matcher = p.matcher(divStr);
		JNews news = null;
		while (matcher.find()) {
			news = new JNews();
			news.setHref(matcher.group(1));
			news.setTitle(matcher.group(2));
			news.setDate(matcher.group(3));
			news.setLx(XWLX.滚动新闻.getValue());
			newsList.add(news);
		}
		return newsList;
	}
	/**
	 * 获取爆点游戏的图片资源、图片链接、图片名、图片所属游戏类型
	 * @param divStr
	 * @return
	 */
	public List<JYx> getBDYXList(String divStr){
		List<JYx> yxList = new ArrayList<JYx>();
		String body = divStr.split("<ul.*?>")[1];
		System.out.println("body="+body);
		String regex = "<divclass=\"channel\"><iclass=\".{7}(.*?)\">.*?<ahref=\"(.*?)\".*?><imgsrc=\"(.*?)\".*?>.*?<divclass=\"tit\">(.*?)</div>";
		Pattern p = Pattern.compile(regex);
		Matcher matcher = p.matcher(body);
		JYx yx = null;
		while(matcher.find()){
			yx = new JYx();
			yx.setLx(matcher.group(1));
			yx.setHref(matcher.group(2));
			yx.setImgurl(matcher.group(3));
			yx.setTitle(matcher.group(4));
			yx.setZt(XWZT.上架中.getValue());
			yx.setCount(0);
			yxList.add(yx);
		}
		return yxList;
	}
	/**
	 * 得到showgirl美女里面的照片和图片对应的连接
	 * @param divStr
	 * @return
	 */
	public List<JTp> getSGMVList(String divStr) {
		List<JTp> tpList = new ArrayList<JTp>();
		String[] liArr = divStr.split("<ulclass=\"photo-list\">");
		String regex = "<ahref=\"(.*?)\".*?<imgsrc=\"(.*?)\"";
		Pattern p = Pattern.compile(regex);
		Matcher matcher = null;
		JTp tp = null;
		for (int i = 0 ;i<liArr.length;i++) {
			if (i==0) {
				continue;
			}
			matcher = p.matcher(liArr[i]);
			while (matcher.find()) {
				tp = new JTp();
				tp.setHref(matcher.group(1));
				tp.setImgurl(matcher.group(2));
				tp.setLx(TPLX.ShowGirl美女.getValue());
				tp.setZt(XWZT.上架中.getValue());
				tpList.add(tp);
			}
		}
		return tpList;
	}
	/**
	 * 得到动态看展的gif地址和对应的链接
	 * @param divStr
	 * @return
	 */
	public List<JTp> getDTKZList(String divStr) {
		List<JTp> tpList = new ArrayList<JTp> ();
		String body = divStr.split("<ulclass=\"plistplist-gif\">")[1];
		String regex = "<ahref=\"(.*?)\".*?<imgsrc=\"(.*?)(!a-3-240x.jpg|)\"";
		Pattern p = Pattern.compile(regex);
		Matcher matcher = p.matcher(body);
		JTp tp = null;
		while(matcher.find()) {
			tp = new JTp();
			tp.setHref(matcher.group(1));
			tp.setImgurl(matcher.group(2));
			tp.setLx(TPLX.正经逛展会_小图.getValue());
			tpList.add(tp);
		}
		tpList.get(0).setLx(TPLX.正经逛展会_大图.getValue());
		return tpList;
	}
	
	@Test
	public void testName() throws Exception {
		HtmlSpiderUtils utils = new HtmlSpiderUtils();
		String result = HtmlSpiderUtils.getRequestStr("http://news.17173.com/chinajoy/2017/", null,null);
		result = utils.getHtmlBodyStr(result);
//		String pn_vr = utils.getHtmlDiv(result, null, "vr", "news");
//		System.out.println(pn_vr);
//		String pn_news = utils.getHtmlDiv(result, "footer", "news", null);
//		System.out.println(pn_news);
//		System.out.println("c1="+utils.getVrC1Html(pn_vr));
//		System.out.println("c2="+utils.getVrC2Html(pn_vr));
//		System.out.println("c3="+utils.getVrC3Html(pn_vr));
//		System.out.println("news="+utils.getNewsHtml(pn_news));
		String pn_game = utils.getHtmlDiv(result, null, "game", "sg");
		System.out.println("pn_game="+pn_game);
		System.out.println(utils.getBDYXList(pn_game));
		String pn_sgmv = utils.getHtmlDiv(result, null, "sg", "inlive");
		System.out.println("pn_sgmv="+pn_sgmv);
		System.out.println(utils.getSGMVList(pn_sgmv));
		String pn_dtkz = utils.getHtmlDiv(result, null, "gif", "game");
		System.out.println("pn_dtkz="+pn_dtkz);
		System.out.println(utils.getDTKZList(pn_dtkz));
	}
}
