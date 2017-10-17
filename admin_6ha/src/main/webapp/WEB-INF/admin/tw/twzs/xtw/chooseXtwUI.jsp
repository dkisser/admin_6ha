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
    <div id="dgchooseXtw" fit=true></div>
<script type="text/javascript">
	var chooseXtwUI = {
			
		groundXtw:function (index) {
			var chooseRow = $("#dgchooseXtw").datagrid('getData').rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				$.ajax({
					url:getContextPath() + "/admin/twzs/groundXtwNews.do",
					method:"POST",
					cache:false,
					data:{dm:xtwzsUI_submitZSRow.dm,replaceDm:chooseRow.dm},
					dataType:"json",
					success:function (res) {
						$("#xtwzsUI_newGroundDlg").dialog('close');
						$("#dgxtwzsUI").datagrid("reload");
						if ( res == "success") {
	    	 				layer.msg('操作成功',{
	    	 					time: 1000,
	    	 				});
	    	 			} else {
	    	 				layer.alert(res,{title:'发生了一个错误'});
	    	 			}
					},
					error:function () {
						alert("Ajax error!");
					}
				});
			});
			
		},
		cancel: function () {
			$("#xtwzsUI_newGroundDlg").dialog('close');
		}
	};
	
	$("#dgchooseXtw").datagrid({
		url:getContextPath() + "/admin/twzs/chooseXtwList.do",
		pagination : true, //是否有分页工具
		pagePosition : "bottom", //分页工具位置
		pageSize : 8, //分页默认大小
		pageList : [ 8 ],
		striped : true, //斑马线样式,
		nowrap : true, //是否在一行显示所有，自动换行
		loadMsg : "努力加载中，请稍后。。。。",//加载信息
		rownumbers : true, //是否显示行号
		singleSelect : true, //只能同时选择一行
		showHeader : true,//显示行头，默认true;
		emptyMsg : "没有数据",
		errorMsg :"加载失败",
		columns:[[
		     {
		    	title:'申请人',
		    	field:'sqr',
		    	width: '18%',
		    	align:'center'
		     },{
		    	title:'标题',
		    	field:'title',
		    	width: '60%',
		    	align:'center'
		     },{
		    	title:'操作',
		    	field:'opt',
		    	width: '19%',
		    	align:'center',
				formatter:function(value,row,index) {
		    		return "<a class='chooseXtwUI_lookBtn' onclick='chooseXtwUI.groundXtw("+index+")'>替换</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".chooseXtwUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
		}
	});
	
</script>

</body>
</html>
