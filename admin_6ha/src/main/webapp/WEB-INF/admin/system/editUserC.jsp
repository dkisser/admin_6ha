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
   <form id="editUserCForm">
   	<div>
   		<table><tr><td style="height: 20px;"></td></tr></table>
   		<table>
   			<tr><td style="width:140px;"></td><td>用户名:</td><td><input id="editUserC_txbuname" name="uname"/></td><td></td></tr>
   			<tr><td></td><td>昵&nbsp;&nbsp;称:</td><td><input id="editUserC_txbpetname" name="petname"/></td><td></td></tr>
   			<tr><td></td><td>性&nbsp;&nbsp;别:</td><td><input id="editUserC_cbxsex" name="sex"/></td><td></td></tr>
   			<tr><td></td><td>年&nbsp;&nbsp;龄:</td><td><input id="editUserC_txbage" name="age"/></td><td></td></tr>
   			<tr><td></td><td>邮&nbsp;&nbsp;箱:</td><td><input id="editUserC_txbemail" name="email"/></td><td></td></tr>
   			<tr><td></td><td>电&nbsp;&nbsp;话:</td><td><input id="editUserC_txbphone" name="phone"/></td><td></td></tr>
   			<tr><td></td><td>角色类型:</td><td><input id="editUserC_cbxrole" name="role"/></td><td></td></tr>
   		</table>
   		<table>
   			<tr><td style="height: 20px;"></td></tr>
   			<tr><td style="width:140px;"></td><td style="width:100px; text-align:center;"><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="editUserC.submitEditUserC()" href="#">确认</a></td><td style="width:100px; text-align:center;"><a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="editUserC.cancel()" href="#">取消</a></td></tr>
   		</table>
   	</div>
  </form>   	
<script type="text/javascript">

	var editUserC = {
		
		cancel: function () {
			$("#userC_newEditUserC").dialog("close");
		},
		submitEditUserC: function () {
			$.messager.progress();
			$("#editUserCForm").form("submit",{
				
				url: getContextPath() + "/admin/system/editUserInfoC.do",
				onSubmit: function (param) {
					
					var validate = $("#editUserCForm").form("validate");
					
					if (!validate) {
						$.messager.progress("close");
						return validate;
					}
					param.uname="${editUser.uname}";
					
				},
				success: function (result) {
					result = eval("("+result+")");
					$.messager.progress("close");
					if (result == "success") {
						$("#userC_newEditUserC").dialog ("close");
						$("#dgUserCList").datagrid("reload");
					} else {
						$.messager.alert("提示",result,"info");
					}
				}
				
			});
		}
		
			
	};
	
	$("#editUserC_txbuname").textbox({
		disabled: true,
		iconCls: "icon-lock",
		value: "${editUser.uname}",
	});
	
	$("#editUserC_txbpetname").textbox({
		disabled: true,
		iconCls: "icon-lock",
		value: "${editUser.petname}",
	});
	$("#editUserC_cbxsex").combobox({
		value: "${editUser.sex}",
		valueField: "id",
		textField: "text",
		required: true,
		data:[{
				id: "男",
				text: "男",
			},{
				id: "女",
				text: "女",
			}],
	});
	
	$("#editUserC_txbage").numberbox({
		required: true,
		value: "${editUser.age}",
	});
	
	$("#editUserC_txbage").numberbox("textbox").blur(function () {
		
		$.ajax({
			url: getContextPath() + "/admin/system/checkUserAge.do",
			cache: false,
			async:true,
			data:{"age":$("#editUserC_txbage").val()},
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
	
	$("#editUserC_txbemail").textbox({
		value: "${editUser.email}",
	});
	
	$("#editUserC_txbphone").textbox({
		value: "${editUser.phone}",
	});
	
	$("#editUserC_cbxrole").combobox({
		url: getContextPath() + "/admin/system/getRoleCombo.do",
		valueField: "id",
		textField: "text",
		data:[[
		       {
		    	 id: "1",
		    	 text: "普通用户"
		       },{
		    	 id: "2",
		    	 text: "VIP用户"
		       },{
		    	 id: "3",
		    	 text: "管理员用户" 
		       },{
		    	 id: "4",
		    	 text: "超级管理员"
		       }]],
		onLoadSuccess: function () {
			$(this).combobox("select","${editUser.role}");
		}
	});
	
</script>
  </body>
</html>
