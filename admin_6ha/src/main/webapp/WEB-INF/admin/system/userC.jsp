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
   	<div id="dlgUserCMain">
   		  <div id="userC_toolbar" style="height: 40px;width:100%;line-height: 40px;">
   		    <div style="height: 100%;float: left;">
   		      <div style="float: left;"><a class="easyui-linkbutton" data-options="iconCls:'icon-add',iconAlign:'left'" onclick="userC.add()">添加</a></div>
   		    </div>
   		    <div style="height: 100%;float: right;">
   		      <div>
   		        <div style="float: left;">用户名：</div>
   		        <div style="float: left;"><input id="txbUserCname" name="uname"/></div>
   		        <div style="float: left;padding-left: 30px;">认证类别：</div>
   		        <div style="float: left;padding-right: 30px;"><input id="cbxUserCstatus" name="status"/></div>
   		        <div style="float: left;padding-left: 30px;">用户类别：</div>
   		        <div style="float: left;padding-right: 30px;"><input id="cbxUserCrole" name="role"/></div>
   		      </div>
   		    </div>
   		  </div>
   		<div id="dgUserCList" fit="true"></div>
   	</div>
<script type="text/javascript">

	userC = {
			
		add: function (){
			var userC_newInsertUserC =  $("<div id='userC_newInsertUserC'></div>");
			userC_newInsertUserC.appendTo("body");
			$("#userC_newInsertUserC").dialog ({
				href: getContextPath() + "/admin/system/addUserInfoCUI.do",
				title: "添加用户",
				width: 512,
				height: 300,
				inline: true,
				onClose: function () {
					userC_newInsertUserC.remove();
				}
			});
		},
		
		edit: function (index){
			var userC_newEditUserC =  $("<div id='userC_newEditUserC'></div>");
			var row = $("#dgUserCList").datagrid("getData").rows[index];
			userC_newEditUserC.appendTo("body");
			$("#userC_newEditUserC").dialog ({
				href: getContextPath() + "/admin/system/editUserInfoCUI.do?uname="+row.uname,
				title: "修改信息",
				width: 512,
				height: 300,
				inline: true,
				onClose: function () {
					userC_newEditUserC.remove();
				}
			});
		},
		
		del: function (index){
			var row = $("#dgUserCList").datagrid("getData").rows[index];
			$.messager.confirm ("提示","您确定要删除该条记录?",function (sure) {
				if (sure){
					$.ajax({
						url: getContextPath() + "/admin/system/delUserInfo.do",
						async: false,
						data:{"uname":row.uname},
						dataType: "json",
						success: function (result){
							if (result=="success") {
								$("#dgUserCList").datagrid("reload");
								swal({
									title:"提示",
									text:"恭喜您删除成功!",
									type:"success"
								});
							} else {
								swal({
									title:"提示",
									text:"没找到uname为"+row.uname+"的用户",
									type:"error"
								});
							}
						},
						error: function () {
							swal({
								title: "提示",
								text: "delete error!",
								type:"error",
							});
						}
					});
				}
			});
		},
		
		reset: function (index){
			var row = $("#dgUserCList").datagrid("getData").rows[index];
			$.messager.confirm ("提示","您确定要将密码重置为123456吗?",function(sure) {
				if (sure) {
					$.ajax({
						url: getContextPath() + "/resetUpw.do",
						cache: false,
						async:true,
						dataType: "json",
						data: {"uname":row.uname},
						success: function (result) {
							if (result == "success") {
								swal({
									title: "提示",
									text: "重置密码成功",
									type:"success",
								});
							} else {
								swal({
									title: "提示",
									text: "重置密码失败",
									type:"warning",
								});
							}
						},
						error : function () {
							alert("error");
						}
					});
				}
			});
		}
			
	};
	
	$("#dlgUserCMain").dialog({
		title: "普通用户",
		width: 1024,
		height: 600,
		cache: false,
		inline:true,
	});
	
	$("#txbUserCname").textbox({
		 width: 200,
		 buttonText:'Search',   
		 iconCls:'icon-search', 
		 iconAlign:'right',
		 onClickButton: function () {
			var url = getContextPath() + "/admin/system/getUserFuzzy.do?uname="+$("#txbUserCname").textbox("getText")+"&role="+$("#cbxUserCrole").combobox("getValue")+"&status="+$("#cbxUserCstatus").combobox("getValue");
			$("#dgUserCList").datagrid("reload",url);
		 },
	});
	
	$("#cbxUserCstatus").combobox({
		width: 200,
		valueField: "id",
		textField: "text",
		editable: false,
		data:[{
			id: "",
			text: "全部",
		},{
			id: "0",
			text: "未认证",
		},{
			id: "1",
			text: "已认证",
		}],
		onSelect : function (record) {
			var url = getContextPath() + "/admin/system/getUserFuzzy.do?status="+record.id+"&role="+$("#cbxUserCrole").combobox("getValue")+"&uname="+$("#txbUserCname").textbox("getText");
			$("#dgUserCList").datagrid("reload",url);
		},
		onLoadSuccess: function () {
			var combo = $(this).combobox("getData");
			$(this).combobox("select",combo[0].id);
		}
	});

	$("#cbxUserCrole").combobox({
		url: getContextPath() + "/admin/system/getRoleComboWithAll.do",
		width: 200,
		valueField: "id",
		textField: "text",
		onSelect : function (record) {
			var url = getContextPath() + "/admin/system/getUserFuzzy.do?status="+$("#cbxUserCstatus").combobox("getValue")+"&role="+record.id+"&uname="+$("#txbUserCname").textbox("getText");
			$("#dgUserCList").datagrid("reload",url);
		},
		onLoadSuccess: function () {
			var combo = $(this).combobox("getData");
			$(this).combobox("select",combo[0].id);
		}
	});
	
	$("#dgUserCList").datagrid({
		url: getContextPath() + "/admin/system/getUserList.do",
		striped: true,
		nowrap: true,
		loadMsg: "数据正在加载中,请稍后...",
		rownumbers: true,
		singleSelect: true,
		showHeader: true,
		toolbar:"#userC_toolbar",
		columns: [[
		           {
		        	  width: "10%",
		        	  title: "用户名",
		        	  field: "uname",
		        	  align: "center",
		           },{
		        	  width: "10%",
		        	  title: "昵称",
			          field: "petname",
			          align: "center", 
		           },{
		        	  width: "6%",
		        	  title: "性别",
			          field: "sex",
			          align: "center", 
		           },{
		        	  width: "6%",
			          title: "年龄",
				      field: "age",
				      align: "center", 
			       },{
			    	  width: "16%",
			      	  title: "邮箱",
				      field: "email",
				      align: "center", 
			       },{
			    	  width: "12%",
			          title: "电话",
				      field: "phone",
			          align: "center", 
			       },{
			    	  width: "6%",
			       	  title: "认证类别",
			          field: "status",
			          align: "center",
			          formatter: function (value,row,index){
			        	  if (value) {
			        		  return "已认证";
			        	  } else {
			        		  return "未认证";
			        	  }
			          }
			       },{
			    	   width: "10%",
			       	  title: "角色类别",
			          field: "role",
			          align: "center", 
			          formatter: function (value,row,index) {
			        	  if (value == 1) {
			        		  return "普通用户";
			        	  } else if (value ==2) {
			        		  return "vip用户";
			        	  } else if (value ==3) {
			        		  return "管理员用户";
			        	  } else {
			        		  return "超级管理员用户";
			        	  }
			          }
			       },{
			    	  width: "23%",
				      title: "操作",
				      field: "option",
				      align: "center",
				      formatter: function (value,row,index) {
				    	  return "<a class='editUserCBtn' onclick='userC.edit("+index+")'>编辑</a>&nbsp;&nbsp;&nbsp;<a class='delUserCBtn' onclick='userC.del("+index+")'>删除</a>&nbsp;&nbsp;&nbsp;<a class='resetUserCBtn' onclick='userC.reset("+index+")'>重置</a>";
				      }
				   }
		           ]],
		           onLoadSuccess: function () {
		        	 $(".editUserCBtn").linkbutton({
		        		 iconCls: "icon-edit",
		        		 iconAlign: "left",
		        		 height: 24,
		        	 });
		        	 
		        	 $(".delUserCBtn").linkbutton({
		        		 iconCls: "icon-no",
		        		 iconAlign: "left",
		        		 height: 24,
		        	 }); 
		        	 
		        	 $(".resetUserCBtn").linkbutton({
		        		 iconCls: "icon-redo",
		        		 iconAlign: "left",
		        		 height: 24,
		        	 });  
		           },
	});
</script>
  </body>
</html>
