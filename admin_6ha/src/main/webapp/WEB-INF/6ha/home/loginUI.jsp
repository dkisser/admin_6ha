<%@ page language="java" import="java.util.*,org.lf.utils.AdminProperties" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%String baseUrl=AdminProperties.SERVER_URL;%>
<title>溜哈游戏资讯网</title>
<link type="image/x-icon" rel="icon" href="http://ue.17173cdn.com/images/lib/v1/favicon-hd.ico" />
<link href="${pageContext.servletContext.contextPath }/css/login.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/css/home.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/js/layui/css/layui.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/swh_admin.js"></script>
</head>
<body>
<script src="${pageContext.servletContext.contextPath }/js/loginUI.js"></script>
<script>
$(function(){
	var uname="${sessionScope.user_login_info.uname}";
	if (uname) {
		 $(".user_text").html(uname);
	}
	
});
$(window).load(function(){
});
</script>
<div class="6ha_header">
  <div class="user_info">
    <div class="frame_cell">
	  <img class="user_icon" src="../images/headIcon.png"/>
	  <span class="user_text"></span>
	</div>
  </div>
  <div class="login_frame">
    <div class="frame_cell">
	  <a href="#" onclick="login()">登录</a>
	  <a href="#" onclick="regist()">注册</a>
	</div>
  </div>
  <div class ="nav">
    <ul>
	  <li><a href="javascript:void 0;">ChinaJoy首页</a></li>
	  <li><a href="#yxrkd">游戏日看点</a></li>
	  <li><a href="#bdyx">爆点游戏</a></li>
	  <li><a href="#zjgzh">正经逛展会</a></li>
	  <li><a href="#showgirl">ShowGirl美女</a></li>
	  <li><a href="<%=baseUrl %>/web/vedio/vedioUI.do">游戏视频</a></li>
	</ul>
  </div>
</div>
<div class="right_nav">
  <ul>
    <li><a href="#yxrkd">游戏日看点</a></li>
	<li><a href="#bdyx">爆点游戏</a></li>
	<li><a href="#zjgzh">正经逛展会</a></li>
	<li><a href="#showgirl">ShowGirl美女</a></li>
	<li><a href="#news">NEWS新闻</a></li>
  </ul>
</div>
<div class="6ha_wrapper">
  <div id="yxrkd" class="wrapper_content_small">
    <div class="title-head">
	  <div class="cj-icon icon-text"></div>
	  <div class="icon-text subtitle">游戏日看点</div>
	</div>
	<div class="text-body_small">
	  <div class="col-c1">
	    <div class="box-tit">
		  <span class="cate cate1">
		    VR游戏
			<i></i>		  
		  </span>
		  <span class="con"><a href="${requestScope.leftList[0].href}" target="_blank">${requestScope.leftList[0].title}</a></span>
		</div>
		<ul>
		  <c:forEach items="${requestScope.leftList}" var="left"  begin="1">
		  	<li><div class="con a_margin_20"><a href="${left.href}" target="_blank">${left.title}</a></div></li>
		  </c:forEach>
		</ul>
	  </div>
	  <div class="col-c2">
	    <ul>
	      <c:forEach items="${requestScope.middleList }" var="middle">
			<li><a class="con" href="${middle.href }" target="_blank"><img src="${middle.imgurl }"/><span class="txt">${middle.title}</span></a></li>
	      </c:forEach>
		</ul>
	  </div>
	  <div class="col-c3">
	    <ul>
	      <c:forEach items="${requestScope.rightList }" var="right">
			<li><a class="con" href="${right.href }" target="_blank"><img style="width: 350px;height: 235px;" src="${right.imgurl }"/></a><span class="txt">${right.title}</span></li>
	      </c:forEach>
		</ul>
	  </div>
	</div>  
  </div>
  <div id="bdyx" class="wrapper_content">
    <div class="title-head">
	  <div class="cj-icon icon-text"></div>
	  <div class="icon-text subtitle">爆点游戏</div>
	</div>
	<div class="text-body">
	  <c:forEach items="${requestScope.bdyxList}" var="bdyx">
		  <div class="pic  footer_intro">
		  	<div class="channel">
			  <i class="icon icon-${bdyx.lx}"></i>
			</div>
		    <div class="picDiv">
		      <a href="${bdyx.href}"  target="_blank"><img src="${bdyx.imgurl}"/></a>
		    </div>
		    <div class="cover">${bdyx.title}</div>
			<div class="pic-foot">
			  <div class="foot-left footer_intro"></div>
			  <div class="foot-right footer_intro" data-count="">0</div>
			</div>
		  </div>
	  </c:forEach>
	</div>
  </div>
  <div id="zjgzh" class="wrapper_content">
    <div class="title-head">
	  <div class="cj-icon icon-text"></div>
	  <div class="icon-text subtitle">正经逛展会</div>
	</div>
	<div class="text-body">
	  <div class="gif">
		  <ul>
		    <c:forEach items="${requestScope.dtkzList}" var="dtkz" begin="0" end="0">
		      <li class="first"><a href="${dtkz.href}" target="_blank"><img src="${dtkz.imgurl}"  onmouseover="this.src=this.src.replace('!a-3-240x.jpg','')"/></a><span class="sign-gif">GIF</span></li>
		    </c:forEach>
		    <c:forEach items="${requestScope.dtkzList}" var="dtkz" begin="1">
		      <li><a href="${dtkz.href}" target="_blank"><img src="${dtkz.imgurl}"  onmouseover="this.src=this.src.replace('!a-3-240x.jpg','')"/></a><span class="sign-gif">GIF</span></li>
		    </c:forEach>
		  </ul>
	  </div>
	</div>
  </div>
  <div id="showgirl" class="wrapper_content_large">
    <div class="title-head">
	  <div class="cj-icon icon-text"></div>
	  <div class="icon-text subtitle">ShowGirl美女</div>
	</div>
	<div class="text-body_large">
	  <div class="photo_li banner" id="bannnerTest">
		  <ul>
		    <c:forEach var="sgmv" items="${requestScope.sgmvList}">
		      <li><a href="${sgmv.href}" target="_blank"><div class="photo"><img src="${sgmv.imgurl}" /></div></a></li>
		    </c:forEach>
		  </ul>
		  <a id="slider_btn"><span class="slick-next" style="display:block;"></span></a>	  
	  </div>
	 </div>
  </div>
  <div id="news" class="wrapper_content_large">
    <div class="title-head">
	  <div class="center-tit">
		  <span id="news_left"></span>
		  <div class="news">NEWS滚动新闻</div>
		  <span id="news_right"></span>
	  </div>
	</div>
	<div class="text-body">
	  <div class="today_news">
	    <ul>
	      <c:forEach items="${requestScope.newsList }" var="news" end="17">
		    <li><a href="${news.href}" target="_blank"><div class="news_left">${news.title}</div><div class="news_right date">${news.date }</div></a></li>
	      </c:forEach>
		</ul>
	  </div>
	  <div class="yestoday_news">
	    <ul>
	     <c:forEach items="${requestScope.newsList }" var="news" begin="18" end="36">
		    <li><a href="${news.href}" target="_blank"><div class="news_left">${news.title}</div><div class="news_right date">${news.date }</div></a></li>
	     </c:forEach>
		</ul>
	  </div>
	</div>
  </div>
</div>
<div id="wrapper-footer_line"></div>
<div id="6ha_footer">
  <div class="footer_container bg-gray">
    <div id="container_picCode">
	  <div class="picCode_index">
	    <div class="picCode_text">
		  <span class="top_span">官方微信</span>
		  <span>扫一扫关注官方微信</span>		
		</div>
		<div><img src="../images/weixin_ewm.png"/></div>
	  </div>
	  <div class="picCode_index">
	    <div class="picCode_text">
		  <span class="top_span">官方微博</span>
		  <span>扫一扫关注官方微博</span>		
		</div>
		<div class="footer_intro">
		  <img src="../images/weibo_ewm.png"/>	
		</div>
	  </div>
	  <div class="picCode_index">
	    <div class="picCode_text">
		  <span class="top_span">扫一扫下载App</span>
		  <a href="#"><div id="downloadApp"></div></a>
		</div>
		<div class="footer_intro">
		  <img src="../images/downloadApp.png" />		</div>
	  </div>
	  <div id="joinUs">
	    <a href="#"></a>
	  </div>
	</div>
	<div id="container_text">
	  <div id="text_line"></div>
	  <div id="text_ul">
	    <ul>
		  <li>
			<h2>主播帮助</h2>
			  <a href="#">App下载</a>
			  <a href="#">ios户外直播</a>
			  <a href="#">直播助手使用教程</a>
			  <a href="#">Xsplit软件教程</a>
			<h2>商务合作</h2>
			  <span>信箱: bd@panda.tv    QQ:3561132601</span>
		  </li>
		  <li class="clear_left">
			<h2>使用规则</h2>
			  <a href="#">用户行为准则</a>
			  <a href="#">不良信息投诉举报</a>
			  <a href="#">版权声明及投诉流程</a>
			  <a href="#">内容管理及处置条例</a>
			<h2>销售合作</h2>
			  <span>信箱: sales@panda.tv</span>
		  </li>
		</ul>
	  </div>
	</div>
  </div>
  <div id="footer_text"></div>
</div>
</body>
</html>
