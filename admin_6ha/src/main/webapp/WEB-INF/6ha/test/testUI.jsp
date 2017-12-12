<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<%String baseUrl="http://125.220.70.103:8080/admin_6ha";%>
</head>
<body>
<script src="${pageContext.servletContext.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/swh_admin.js"></script>
aaaaaaaaaaaa
<script type="text/javascript">
	$.ajax({
		url: getContextPath()+"/restful/aaa",
		type:"GET",
		cache:false,
		async:"true",
		data:{id:2,role:4},
		dataType:"json",
		beforeSend:function (req){
			req.setRequestHeader("admin_6ha-version","1.1.0");
		},
		success:function (res){
			alert(JSON.stringify(res));
		},
		erro:function (){
			alert("Ajax error!");
		}
	});
</script>
</body>
</html>