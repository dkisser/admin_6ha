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
<div id="cpl_emailInfo">
	<div style="width:20%; height: 40%;float:left;"></div>
	<div style="width:80%; height: 40%;line-height: 200px">
		<div style="width:10%;height:40%;float:left;"></div><div style="margin-left :100px;width:16%;height:40%;float: left">邮箱地址:</div><input style="margin-left: 10px;" id="emailInfo_email"/>
	</div>
	<div style="width:30%;height: 30px;float:left"></div><a style="margin-left: 60px" id="emailInfo_ok" onclick="emainInfo.submit()">确定</a>
</div>
<script type="text/javascript">
	
	emainInfo = {
		
		submit: function () {
			$.ajax ({
				url: getContextPath() +"/admin/info/updateEmailByUname.do",
				cache: false,
				data:{"email":$("#emailInfo_email").val(),"uname":"${sessionScope.admin_login_info.uname}"},
				dataType: "json",
				success: function (result) {
					if (result) {
						swal({
							title:"提示",
							text:"恭喜您，添加电话号成功!请重新登录",
							type:"success"
						});
						$("#cplAppend").dialog("close");
						$("#dgCPLdiv").datagrid("deleteRow",0);
					} else {
						swal({
							title:"提示",
							text:"添加失败，请在提交一次",
							type:"warning"
						});
						$("#cplAppend").dialog("close");
					}
				},
				error: function () {
					swal({
						title:"提示",
						text:"网络发生错误，请在提交一次",
						type:"warning"
					});
				}
				
				
			});
			
		}
			
	}
	
	$("#emailInfo_ok").linkbutton({
		iconAlign:"left",
		iconCls: "icon-ok"
	});
	
	$("#emailInfo_email").textbox({
		required:true
	});
</script>
</body>
</html>
