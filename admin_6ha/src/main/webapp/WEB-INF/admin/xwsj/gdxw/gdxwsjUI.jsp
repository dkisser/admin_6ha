<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta charset="utf-8">
  </head>
  
<body>
<div id="dlggdxwsjUIMain"></div>

<script type="text/javascript">
	$("#dlggdxwsjUIMain").dialog({
		title:"滚动新闻上架申请",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
</script>
</body>
</html>
