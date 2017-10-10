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
   	<div id="recahrgeUI_dlgmain">
   	
   	</div>
<script type="text/javascript">

$("#recahrgeUI_dlgmain").dialog({
	
	title:"会员充值",	
	width: 1024,
	height: 600,
	inline:true,
	cache: false,
	modal: true
});

</script>
</body>
</html>
