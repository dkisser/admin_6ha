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
  </head>
  <body>
  <div id="dlgCplInfodiv">
	<table>
		<tr><td style="height: 40px;"></td></tr>
		<tr style="height: 40px;"><td style="width: 120px;"></td><td style="text-align: right;">用户名:</td><td><input style="width:180px;" id="txbCUuname" name="uname" /></td></tr>
		<tr style="height: 40px;"><td style="width: 120px;"></td><td style="text-align: right;">姓名:</td><td><input style="width:180px;" id="txbCUpetname" name="petname" /></td></tr>
		<tr style="height: 40px;"><td style="width: 120px;"></td><td style="text-align: right;">角色类型:</td><td><input style="width:180px;" id="cbxCUrole" name="role" /></td></tr>
	</table>
	<table>
		<tr><td style="height: 20px"></td></tr>
		<tr><td style="width: 180px;"></td><td style="width: 100px;text-align: center;"><a onclick="cpl.completeInfo()" id="currCancelBtn" class="easyui-linkbutton" iconCls="icon-ok">确定</a></td></tr>
	</table> 
  </div>
		<script type="text/javascript">
		
		cpl = {
				
			completeInfo : function () {
				$.ajax({
					url:getContextPath() + "/admin/info/validInfo.do",
					dataType:"json",
					cache: false,
					success: function (result) {
						var cplInfo = $("<div id='cplInfo'></div>");
						cplInfo.appendTo("#center");
						$("#dlgCplInfodiv").dialog("close");
						$("#cplInfo").dialog({
							title: "个人信息",
							href: getContextPath() +"/admin/info/cplInfoUI.do",
							width: 824,
							height: 600,
							cache: false,
							inline:true,
							onClose:function () {
								cplInfo.remove();
							}
						});
					},
					error:function () {
						alert("Ajax error!");
					}
				});
			}	
				
		};
		
		$("#dlgCplInfodiv").dialog({
			title: "确认个人信息",
			width: 512,
			height: 300,
			cache: false,
			inline:true,
		});
		
		$("#currCancelBtn").bind ("click",function () {
			$("#currUser").dialog("close");
		});
		
		$("#txbCUuname").textbox ({
			readonly: true,
			value:"${sessionScope.admin_login_info.uname}",
		});
		
		$("#txbCUpetname").textbox ({
			readonly: true,
			value:"${sessionScope.admin_login_info.petname}",
		});
		
		$("#cbxCUrole").combobox({
			readonly: true,
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
