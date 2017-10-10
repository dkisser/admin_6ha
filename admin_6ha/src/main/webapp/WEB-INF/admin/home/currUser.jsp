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
  </head>
  <body>
   		<table>
			<tr><td style="height: 70px;"></td></tr>
			<tr><td style="width: 120px;"></td><td style="text-align: right;">用户名:</td><td><input style="width:180px;" id="txbCUuname" name="uname" /></td></tr>
			<tr><td></td><td style="text-align: right;">姓名:</td><td><input style="width:180px;" id="txbCUpetname" name="petname" /></td></tr>
			<tr><td></td><td style="text-align: right;">角色类型:</td><td><input style="width:180px;" id="cbxCUrole" name="role" /></td></tr>
		</table>
		<table>
			<tr><td style="height: 40px"></td></tr>
			<tr><td style="width: 180px;"></td><td style="width: 100px;text-align: center;"><a id="currCancelBtn" class="easyui-linkbutton" iconCls="icon-no">关闭</a></td></tr>
		</table>
		<script type="text/javascript">
		$("#currCancelBtn").bind ("click",function () {
			$("#currUser").dialog("close");
		});
		
		$("#txbCUuname").textbox ({
			disabled: true,
			iconAlign:"right",
			iconCls:"icon-lock",
			value:"${sessionScope.admin_login_info.uname}",
		});
		
		$("#txbCUpetname").textbox ({
			disabled: true,
			iconAlign:"right",
			iconCls:"icon-lock",
			value:"${sessionScope.admin_login_info.petname}",
		});
		
		$("#cbxCUrole").combobox({
			disabled: true,
			valueField: "id",
			textFeild: "text",
			value: "${sessionScope.admin_login_info.role}",
			data: [{
					id: "1",
					text: "普通用户",
				},{
					id: "2",
					text: "VIP用户",
				},{
					id: "3",
					text: "管理员用户",
				},{
					id: "4",
					text: "超级管理员",
				}]
		});
		</script>
  </body>
</html>
