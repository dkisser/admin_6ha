<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>湖北第二师范学院直播平台</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/index.css" />
	</head>
	<body>
		<!--
			HTML:HyperText Markup Language
			有一系列标签以及属性构成，严格来说html只能算一门标记语言(非程序设计语言)
			HBuilder 集成了 Emmet(zen coding)插件（快速编写html代码）
			ul#menu>li.item*10>a[href=#]{页面$}
		-->
		
		<div class="container">
			<div class="title">湖北第二师范学院直播平台</div>
			<div class="main">
				<video id="myVideo" src="${pageContext.servletContext.contextPath }/video/test.mp4" autoplay></video>
			</div>
			<div class="messageBox">
				<input type="text" class="txt" placeholder="吐槽一下吧..."/><button class="btn">发送</button>
			</div>
			<div class="copy">power by softeem&copy; all Right since 2017</div>
		</div>
		<!-- 引入js文件 -->
		<script src="${pageContext.servletContext.contextPath }/js/index.js"></script>
	</body>
</html>
