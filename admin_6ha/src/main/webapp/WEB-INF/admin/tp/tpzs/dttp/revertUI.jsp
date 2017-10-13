<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String baseUrl = "http://localhost:8080/admin_6ha"; %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta charset="utf-8">
  </head>
  
<body>
  <form id="revertDttpUI_form">
    <table>
      <tr><td style="height: 50px;"></td></tr>
      <tr><td style="padding-left: 70px;"></td><td style="text-align: right;">图片地址：</td><td><input id="revertDttpUI_imgurl" name="imgurl"/></td></tr>
      <tr><td style="height:10px;"></td></tr>
      <tr><td></td><td style="text-align: right;" valign="top">驳回原因：</td><td><input id="revertDttpUI_remark" name="remark"/></td></tr>
    </table>
  </form>
  <table>
    <tr><td style="height:30px;"></td></tr>
    <tr><td style="width: 140px;"></td><td style="width:100px;text-align:center;"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="revertDttpUI.revert()">确认</a></td><td style="width:100px;text-align:center;"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="revertDttpUI.cancel()">取消</a></td></tr>
  </table>
<script type="text/javascript">
	var revertDttpUI = {
			
		revert:function () {
			layui.use('layer',function () {
				var layer = layui.layer;
				$("#revertDttpUI_form").form('submit',{
					url:getContextPath() + "/admin/tpzs/revertDttp.do",
					onSubmit:function (param){
						param.dm = dttpzsUI_revertRow.dm;
					},
					success:function (res) {
						$("#dttpzsUI_newRevertDlg").dialog('close');
						$("#dgdttpzsUI").datagrid("reload");
						res = eval("("+res+")");
						if ( res == "success") {
	    	 				layer.msg('操作成功',{
	    	 					time: 1000,
	    	 				});
	    	 			} else {
	    	 				layer.alert(res,{title:'发生了一个错误'});
	    	 			}
					}
				});
			});
			
		},
		cancel: function () {
			$("#dttpzsUI_newRevertDlg").dialog('close');
		}
	};
	
	$("#revertDttpUI_imgurl").textbox({
		value: dttpzsUI_revertRow.imgurl,
		disabled:true,
		width: 280
	});
	
	$("#revertDttpUI_remark").textbox({
		width: 280,
		height: 90,
		multiline: true
	});
	
</script>

</body>
</html>
