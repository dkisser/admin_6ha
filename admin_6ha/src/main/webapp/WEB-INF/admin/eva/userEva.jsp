<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'home.jsp' starting page</title>
   	<link>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/css/jcdj.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/js/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/swh_admin.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/echarts.min.js"></script>
	
  </head>
<body>
<div id="userEvaMain" >  
	<div class="easyui-layout" fit="true">
	    <div data-options="region:'south'" style="height:100px;">
	    	<div style="width: 30%;height: 100%;float:left;"></div><div style="width: 30%;height:100%;text-align: center;float:left;line-height: 90px"><a id="userEva_okBtn" onclick="cplInfo.cpl_ok2()">确定</a></div>
	    </div>    
	    <div data-options="region:'west'" style="width:45%;"></div>   
	    <div data-options="region:'center'" style="height:65%;"></div>
    </div>    
</div> 
<script type="text/javascript">
	$("#userEvaMain").dialog({
		title:"个人用户星级评分",
		width:1024,
		height:600,
		cache: false,
		inline:true
	});
	$("#userEva_okBtn").linkbutton ({
		size:'large',
		iconAlign:'left',
		iconCls: 'icon-ok'
	});
</script>
</body>
</html>
