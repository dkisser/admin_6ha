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
   <form id="insertUserCForm">
   	<div>
   		<table><tr><td style="height: 20px;"></td></tr></table>
   		<table>
   			<tr><td style="width:140px;"></td><td>用户名:</td><td><input id="inserUserC_txbuname" name="uname"/></td><td></td></tr>
   			<tr><td></td><td>昵&nbsp;&nbsp;称:</td><td><input id="inserUserC_txbpetname" name="petname"/></td><td></td></tr>
   			<tr><td></td><td>性&nbsp;&nbsp;别:</td><td><input id="inserUserC_cbxsex" name="sex"/></td><td></td></tr>
   			<tr><td></td><td>年&nbsp;&nbsp;龄:</td><td><input id="inserUserC_txbage" name="age"/></td><td></td></tr>
   			<tr><td></td><td>邮&nbsp;&nbsp;箱:</td><td><input id="inserUserC_txbemail" name="email"/></td><td></td></tr>
   			<tr><td></td><td>电&nbsp;&nbsp;话:</td><td><input id="inserUserC_txbphone" name="phone"/></td><td></td></tr>
   			<tr><td></td><td>角色类型:</td><td><input id="inserUserC_cbxrole" name="role"/></td><td></td></tr>
   		</table>
   		<table>
   			<tr><td style="height: 20px;"></td></tr>
   			<tr><td style="width:140px;"></td><td style="width:100px; text-align:center;"><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="insertUserC.submitInsertUserC()" href="#">确认</a></td><td style="width:100px; text-align:center;"><a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="insertUserC.cancel()" href="#">取消</a></td></tr>
   		</table>
   	</div>
  </form>
<script type="text/javascript">
	var insertUserC = {
		
		cancel: function () {
			$("#userC_newInsertUserC").dialog ("close");
		},
		submitInsertUserC: function () {
			$.messager.progress();
			$("#insertUserCForm").form("submit",{
				
				url: getContextPath() + "/admin/system/addUserInfoC.do",
				onSubmit: function (param) {
					
					var validate = $("#insertUserCForm").form("validate");
					
					if (!validate) {
						$.messager.progress("close");
						return validate;
					}
					
				},
				success:function (result) {
					result = eval("("+result+")");
					$.messager.progress("close");
					if (result == "success") {
						$("#userC_newInsertUserC").dialog ("close");
						$("#dgUserCList").datagrid("reload");
						$("#dgVipCList").datagrid("reload");
						$("#dgAdminCList").datagrid("reload");
					} else {
						$.messager.alert("提示",result,"info");
					}
				}
				
			});
		}
			
	};
	
	$("#inserUserC_txbuname").textbox({
		required: true
	});
	
	$("#inserUserC_txbuname").textbox("textbox").blur(function () {

		$.ajax({
			url: getContextPath() + "/admin/system/checkUserByUname.do",
			cache: false,
			async:true,
			data:{"uname":$("#inserUserC_txbuname").val(),"role":$("#inserUserC_cbxrole").combobox("getValue")},
			dataType: "json",
			success: function (result) {
				if (result == "success") {
					
				} else {
					$.messager.alert("提示",result,"info");
				}
			},
			error: function () {
				alert("Ajax error!");
			}
		});
	});
	
	$("#inserUserC_txbpetname").textbox({
		required: true
	});
	
	$("#inserUserC_cbxsex").combobox({
		valueField: "id",
		textField: "text",
		required : true,
		data:[{
				id: "男",
				text: "男",
			},{
				id: "女",
				text: "女",
			}],
		onLoadSuccess: function () {
			var data = $(this).combobox("getData");
			$(this).combobox("select",data[0].id);
		}
	});
	
	$("#inserUserC_txbage").numberbox({
		required: true
	});
	
	$("#inserUserC_txbage").numberbox("textbox").blur(function () {
	
		$.ajax({
			url: getContextPath() + "/admin/system/checkUserAge.do",
			cache: false,
			async:true,
			data:{"age":$("#inserUserC_txbage").val()},
			dataType: "json",
			success: function (result) {
				if (result == "success") {
					
				} else {
					$.messager.alert("提示",result,"info");
				}
			},
			error: function () {
				alert("Ajax error!");
			}
		});
	});
	
	$("#inserUserC_txbemail").textbox({});
	
	$("#inserUserC_txbphone").textbox({});
	
	$("#inserUserC_cbxrole").combobox({
		url: getContextPath() + "/admin/system/getRoleCombo.do",
		valueField: "id",
		textField: "text",
		required : true,
		onLoadSuccess: function () {
			var data = $(this).combobox("getData");
			$(this).combobox("select",data[0].id);
		}
	});
	

	
</script>
  </body>
</html>
