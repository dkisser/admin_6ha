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
    <div id="dgchooseGdxw" fit=true></div>
<script type="text/javascript">
	var chooseGdxwUI = {
			
		ground:function (index) {
			var chooseRow = $("#dgchooseGdxw").datagrid('getData').rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				$.ajax({
					url:getContextPath() + "/admin/xwzs/groundGdxwNews.do",
					method:"POST",
					cache:false,
					data:{dm:gdxwzsUI_submitZSRow.dm,replaceDm:chooseRow.dm},
					dataType:"json",
					success:function (res) {
						$("#gdxwzsUI_newGroundDlg").dialog('close');
						$("#dggdxwzsUI").datagrid("reload");
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
			$("#gdxwzsUI_newGroundDlg").dialog('close');
		}
	};
	
	$("#dgchooseGdxw").datagrid({
		url:getContextPath() + "/admin/xwzs/chooseGdxwList.do",
		pagination : true, //是否有分页工具
		pagePosition : "bottom", //分页工具位置
		pageSize : 8, //分页默认大小
		pageList : [ 8 ],
		striped : true, //斑马线样式,
		nowrap : true, //是否在一行显示所有，自动换行
		loadMsg : "努力加载中，请稍后。。。。",//加载信息
		emptyMsg: "目前暂无任何数据额...",
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
		    		return "<a class='chooseGdxwUI_lookBtn' onclick='chooseGdxwUI.ground("+index+")'>替换</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".chooseGdxwUI_lookBtn").linkbutton({
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
