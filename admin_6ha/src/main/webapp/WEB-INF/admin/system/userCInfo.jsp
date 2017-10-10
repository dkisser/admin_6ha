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
  <form id="userCInfoForm">
   	<div>
   		<table><tr><td style="height: 20px;"></td></tr></table>
   		<table>
   			<tr><td style="width:140px;"></td><td>用户名:</td><td><input id="txbunameip" name="uname"/></td><td></td></tr>
   			<tr><td></td><td>昵&nbsp;&nbsp;称:</td><td><input id="txbpetnameip" name="petname"/></td><td></td></tr>
   			<tr><td></td><td>性&nbsp;&nbsp;别:</td><td><input id="cbxsexip" name="sex"/></td><td></td></tr>
   			<tr><td></td><td>年&nbsp;&nbsp;龄:</td><td><input id="txbageip" name="age"/></td><td></td></tr>
   			<tr><td></td><td>邮&nbsp;&nbsp;箱:</td><td><input id="txbemailip" name="email"/></td><td></td></tr>
   			<tr><td></td><td>电&nbsp;&nbsp;话:</td><td><input id="txbphoneip" name="phone"/></td><td></td></tr>
   			<tr><td></td><td>角色类型:</td><td><input id="cbxroleip" name="role"/></td><td></td></tr>
   		</table>
   		<table>
   			<tr><td style="height: 20px;"></td></tr>
   			<tr><td style="width:140px;"></td><td style="width:100px; text-align:center;"><a id="lbuserCInfosave" href="#">保存</a></td><td style="width:100px; text-align:center;"><a id="lbuserCInfocancel" href="#">取消</a></td></tr>
   		</table>
   	</div>
   	</form>
<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {    
		vduserCInfouname: {    
	        validator: function(value, param){
	        	var validate = "";
	        	$.ajax({
	        		url: getContextPath() + "/admin/system/getUserByUname.do",
	        		cache:false,
					data:{"uname":value},
					dataType:"json",
					async: false,
					success:function (result) {
						validate = result.uname;
					},
					error: function () {
					}
	        	});
	        	//return true不显示message,return false显示message
	            return value != validate;
	        },    
	        message: '该用户名已被注册,请换一个!' 
	    } ,
	    vduserCInfopetname: {
	    	validator: function(value, param){
	        	var validate = "";
	        	$.ajax({
	        		url: getContextPath() + "/admin/system/getUserByPetName.do",
	        		cache:false,
					data:{"petname":value},
					dataType:"json",
					async: false,
					success:function (result) {
						validate = result.petname;
					},
					error: function () {
					}
	        	});
	        	//return true不显示message,return false显示message
	            return value != validate;
	        },    
	        message: '该昵称已被注册,请换一个!' 
	    }
	});  

	
	$("#txbunameip").textbox({
		required: true,
	});
	
	$("#txbpetnameip").textbox({
		required: true,
	});
	
	$("#cbxsexip").combobox({
		valueField: "id",
		textField: "text",
		required : true,
		editable: false,
		data:[{
				id: "男",
				text: "男",
			},{
				id: "女",
				text: "女",
			}]
	});
	
	$("#txbageip").textbox({
		required: true,
	});
	
	$("#txbemailip").textbox({});
	
	$("#txbphoneip").textbox({});
	
	$("#cbxroleip").combobox({
		url: getContextPath() + "/admin/system/getRoleList.do",
		valueField: "id",
		textField: "text",
		required : true,
		readonly: true,
		value: "${role}",
	});
	
	$("#lbuserCInfosave").linkbutton({
		iconCls: "icon-ok",
		iconAlign: "left"
	});
	
	$("#lbuserCInfocancel").linkbutton({
		iconCls: "icon-no",
		iconAlign: "left"
	});
	
	$("#lbuserCInfocancel").bind("click",function () {
		$("#dlguserCInfo").dialog("close");
	});
	
	if ("${ADD}"=="true") {
		
		$("#txbunameip").textbox({
			validType: 'vduserCInfouname',
		});
		
		$("#txbpetnameip").textbox({
			validType: 'vduserCInfopetname',
		});
		
		$("#lbuserCInfosave").bind("click",function () {
			$("#userCInfoForm").form("submit",{
				url: getContextPath() + "/admin/system/AddNewUser.do",
				onSubmit: function () {
					var valid = $("#userCInfoForm").form("validate");
					if (!valid) {
						$.messager.alert("提示","请按要求来填写!","info");
					}
					return valid;
				},
				success: function (result) {
					var re = eval("("+result+")");
					if (re){
						$("#dlguserCInfo").dialog("close");
						$("#dlgvipCInfo").dialog("close");
						$("#dlgadminCInfo").dialog("close");
						swal({
							title:"提示",
							text:"恭喜,添加成功!",
							type:"success"
						});
						$("#dgUserCList").datagrid("reload");	
						$("#dgVipCList").datagrid("reload");	
						$("#dgAdminCList").datagrid("reload");	
					} else {
						swal({
							title:"提示",
							text:"添加失败!",
							type:"error"
						});
					}
					
				}
			});
		});
		
	} else {
		$("#txbunameip").textbox({
			readonly: true,
			value: "${editUser.uname}",
		});
		
		$("#txbpetnameip").textbox({
			readonly: true,
			value: "${editUser.petname}",
		});
		
		$("#cbxsexip").combobox({
			value: "${editUser.sex}",
		});
		
		$("#txbageip").textbox({
			value: "${editUser.age}",
		});
		
		$("#txbemailip").textbox({
			value: "${editUser.email}",
		});
		
		$("#txbphoneip").textbox({
			value: "${editUser.phone}",
		});
		
		
		$("#lbuserCInfosave").bind("click",function () {
			$("#userCInfoForm").form("submit",{
				url: getContextPath() + "/admin/system/UpdateNewUser.do",
				onSubmit: function () {
					var valid = $("#userCInfoForm").form("validate");
					if (!valid) {
						$.messager.alert("提示","请按要求来填写!","info");
					}
					return valid;
				},
				success: function (result) {
					$("#dlguserCInfo").dialog("close");
					$.messager.alert("提示","您已成功更新了一条信息!","info");
					$("#dgUserCList").datagrid("reload");
				}
			});
		});
	}
	
</script>
  </body>
</html>
