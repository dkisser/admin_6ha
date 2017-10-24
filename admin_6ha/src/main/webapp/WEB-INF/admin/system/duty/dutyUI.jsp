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
  <div id="dlgdutyUIMain">
  	<div id="dgdutyUI"></div>
  </div>
<script type="text/javascript">

	$("#dlgdutyUIMain").dialog({
		title:"部门职责管理",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});

	$("#dgdutyUI").datagrid({
		url:getContextPath() + "/admin/system/getDutyList.do",
		toolbar: "",
		fit:true,
		pagination : true, //是否有分页工具
		pagePosition : "bottom", //分页工具位置
		pageSize : 15, //分页默认大小
		pageList : [ 15 ],
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
		    	title:'部门名称',
		    	field:'mc',
		    	width: '28%',
		    	align:'center'
		     },{
		    	title:'部门负责人',
		    	field:'fzr',
		    	width: '20%',
		    	align:'center'
		     },{
		    	title:'部门管理人',
		    	field:'glr',
		    	width: '20%',
		    	align:'center' 
		     },{
		    	title:'操作',
		    	field:'opt',
		    	width: '30%',
		    	align:'center',
				formatter:function(value,row,index) {
		    		return "<a class='dutyUI_lookBtn' onclick='dutyUI.preview("+index+")'>查看</a>&nbsp;<a class='dutyUI_agreeBtn' onclick='dutyUI.submitGdxwZS("+index+")'>提交终审</a>&nbsp;<a class='dutyUI_refuseBtn' onclick='dutyUI.revertGdxw("+index+")'>驳回</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".dutyUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".dutyUI_agreeBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".dutyUI_refuseBtn").linkbutton({
				iconCls:'icon-no',
				iconAlign:'left',
				plain:true,
				height: 23
			});
		}
	});

</script>
</body>
</html>
