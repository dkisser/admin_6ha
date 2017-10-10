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
   	<div id="dlgAdminCMain">
   		<div id="adminC_toolbar" style="height: 40px;width:100%;line-height: 40px;">
   		    <div style="height: 100%;float: left;">
   		      <div style="float: left;"></div>
   		    </div>
   		    <div style="height: 100%;float: right;">
   		      <div>
   		        <div style="float: left;">用户名：</div>
   		        <div style="float: left;"><input id="txbAdminCname" name="uname"/></div>
   		        <div style="float: left;padding-left: 30px;">认证类别：</div>
   		        <div style="float: left;padding-right: 30px;"><input id="cbxAdminCstatus" name="status"/></div>
   		      </div>
   		    </div>
   		  </div>
   		<div id="dgAdminCList" fit="true"></div>
   	</div>
<script type="text/javascript">

	var AdminC = {
			
			edit: function (index){
// 				var userC_newEditUserC =  $("<div id='userC_newEditUserC'></div>");
// 				var row = $("#dgUserCList").datagrid("getData").rows[index];
// 				userC_newEditUserC.appendTo("body");
// 				$("#userC_newEditUserC").dialog ({
// 					href: getContextPath() + "/system/editUserInfoCUI.do?uname="+row.uname+"&role="+"${role}",
// 					title: "修改信息",
// 					width: 512,
// 					height: 300,
// 					inline: true
// 				});
				alert("edit");
			},
			
			del: function (index){
// 				var row = $("#dgUserCList").datagrid("getData").rows[index];
// 				$.messager.confirm ("提示","您确定要删除该条记录?",function (sure) {
// 					if (sure){
// 						$.ajax({
// 							url: getContextPath() + "/system/delUserInfo.do",
// 							async: false,
// 							data:{"uname":row.uname},
// 							dataType: "json",
// 							success: function (result){
// 								if (result=="success") {
// 									$("#dgUserCList").datagrid("reload");
// 									swal({
// 										title:"提示",
// 										text:"恭喜您删除成功!",
// 										type:"success"
// 									});
// 								} else {
// 									swal({
// 										title:"提示",
// 										text:"没找到uname为"+row.uname+"的用户",
// 										type:"error"
// 									});
// 								}
// 							},
// 							error: function () {
// 								swal({
// 									title: "提示",
// 									text: "delete error!",
// 									type:"error",
// 								});
// 							}
// 						});
// 					}
// 				});
				alert("del");
			},
			
			reset: function (index){
// 				var row = $("#dgUserCList").datagrid("getData").rows[index];
// 				alert(JSON.stringify(row));
// 				$.messager.confirm ("提示","您确定要将密码重置为123456吗?",function(sure) {
// 					if (sure) {
// 						$.ajax({
// 							url: getContextPath() + "/resetUpw.do",
// 							cache: false,
// 							async:true,
// 							dataType: "json",
// 							data: {"uname":row.uname},
// 							success: function (result) {
// 								if (result == "success") {
// 									swal({
// 										title: "提示",
// 										text: "重置密码成功",
// 										type:"success",
// 									});
// 								} else {
// 									swal({
// 										title: "提示",
// 										text: "重置密码失败",
// 										type:"warning",
// 									});
// 								}
// 							},
// 							error : function () {
// 								alert("error");
// 							}
// 						});
// 					}
// 				});
					alert("reset");
			}
			
			
	};
	
	$("#dlgAdminCMain").dialog({
		title: "管理员用户",
		width: 1024,
		height: 600,
		cache: false,
		inline:true,
	});
	
	$("#txbAdminCname").textbox({
		 width: 200,
		 buttonText:'Search',   
		 iconCls:'icon-search', 
		 iconAlign:'right',
		 onClickButton: function () {
			var url =getContextPath() + "/admin/system/getUserFuzzy.do?uname="+$("#txbAdminCname").textbox("getText")+"&role="+"${role}"+"&status="+$("#cbxAdminCstatus").combobox("getValue");
			$("#dgAdminCList").datagrid("reload",url);
		 },
	});
	
	$("#cbxAdminCstatus").combobox({
		width: 200,
		valueField: "id",
		textField: "text",
		editable: false,
		data:[{
			id:"",
			text:"全部"
		},{
			id: "0",
			text: "未认证",
		},{
			id: "1",
			text: "已认证",
		}],
		onSelect : function (record) {
			var url = getContextPath() + "/admin/system/getUserFuzzy.do?status="+record.id+"&role="+"${role}"+"&uname="+$("#txbAdminCname").textbox("getText");
			$("#dgAdminCList").datagrid("reload",url);
		}
	});

	$("#dgAdminCList").datagrid({
		url: getContextPath() + "/admin/detail/getUserList.do?role="+${role},
		striped: true,
		nowrap: true,
		loadMsg: "数据正在加载中,请稍后...",
		rownumbers: true,
		singleSelect: true,
		showHeader: true,
		toolbar:"#adminC_toolbar",
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
				    	  return "<a class='editAdminCBtn' onclick='AdminC.edit("+index+")'>编辑</a>&nbsp;&nbsp;&nbsp;<a class='delAdminCBtn' onclick='AdminC.del("+index+")'>删除</a>&nbsp;&nbsp;&nbsp;<a class='resetAdminCBtn' onclick='AdminC.reset("+index+")'>重置</a>";
				      }
				   }
		           ]],
		           onLoadSuccess: function () {
		        	 $(".editAdminCBtn").linkbutton({
		        		 iconCls: "icon-edit",
		        		 iconAlign: "left",
		        		 height: 24,
		        	 });
		        	 
		        	 $(".delAdminCBtn").linkbutton({
		        		 iconCls: "icon-no",
		        		 iconAlign: "left",
		        		 height: 24,
		        	 }); 
		        	 
		        	 $(".resetAdminCBtn").linkbutton({
		        		 iconCls: "icon-redo",
		        		 iconAlign: "left",
		        		 height: 24,
		        	 });  
		           },
	});
</script>
  </body>
</html>
