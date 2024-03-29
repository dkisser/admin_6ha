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
<div id="dlgrkdxwzsUIMain">
  <table id="rkdxwzsUI_toolbar" style="width:100%;">
    <tr>
      <td style="width: 560px;"></td>
      <td>申请人:</td><td><input id="rkdxwzsUI_sqrtxb" name="sqr" style="width: 120px;"/></td>
      <td style="padding-left: 10px;">标    题:</td><td><input id="rkdxwzsUI_titletxb" name="title" style="width: 120px;"/></td>
      <td style="padding-left: 20px;"><a class="easyui-linkbutton" onclick="rkdxwzsUI.query()" data-options="iconCls:'icon-search'">查询</a></td>
    </tr>
  </table>
  <div id="dgrkdxwzsUI" fit="true"></div>
</div>
<script type="text/javascript">

	var rkdxwzsUI = {
		query:function (){
			$("#dgrkdxwzsUI").datagrid('reload',{
				sqr:$("#rkdxwzsUI_sqrtxb").textbox('getValue'),
				title:$("#rkdxwzsUI_titletxb").textbox('getValue')
			});
		},
		genSmallDialog:function(dialogId,title,url,params) {
			var dialogObj = $("<div id='"+dialogId+"'></div>");
			dialogObj.appendTo("#center");
			$("#"+dialogId).dialog({
				title:title,
				href: url,
				queryParams : params,
				width: 512,
				height: 300,
				modal:true,
				inline:true,
				cache:false,
				onClose:function () {
					dialogObj.remove();
				}
			});
		},
		genBigDialog:function(dialogId,title,url,params) {
			var dialogObj = $("<div id='"+dialogId+"'></div>");
			dialogObj.appendTo("#center");
			$("#"+dialogId).dialog({
				title:title,
				href: url,
				queryParams : params,
				width: 1024,
				height: 600,
				modal:true,
				inline:true,
				cache:false,
				onClose:function () {
					dialogObj.remove();
				}
			});
		},
		preview:function (index) {
			var rkdxwzsUI_previewRow = $("#dgrkdxwzsUI").datagrid('getData').rows[index];
			rkdxwzsUI.genBigDialog("rkdxwzsUI_newPreviewDlg", "新闻预览", getContextPath() + "/admin/xwzs/previewRkdxwUI.do",{id:rkdxwzsUI_previewRow.id});
		},
		ground:function (index) {
			rkdxwzsUI_submitZSRow = $("#dgrkdxwzsUI").datagrid('getData').rows[index];
			rkdxwzsUI.genSmallDialog("rkdxwzsUI_newGroundDlg", "请选择一个新闻下架", getContextPath() + "/admin/xwzs/chooseRkdxwUI.do");
		},
		revert:function (index) {
			rkdxwzsUI_revertRow = $("#dgrkdxwzsUI").datagrid('getData').rows[index];
			rkdxwzsUI.genSmallDialog("rkdxwzsUI_newRevertDlg", "新闻驳回", getContextPath() + "/admin/xwzs/revertRkdxwUI.do");
		}
			
	};

	$("#dlgrkdxwzsUIMain").dialog({
		title:"日看点新闻终审",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#rkdxwzsUI_sqrtxb").textbox({});
	
	$("#rkdxwzsUI_titletxb").textbox({});
	
	$("#dgrkdxwzsUI").datagrid({
		url:getContextPath() + "/admin/xwzs/getRkdxwList.do",
		toolbar: "#rkdxwzsUI_toolbar",
		pagination : true, //是否有分页工具
		pagePosition : "bottom", //分页工具位置
		pageSize : 15, //分页默认大小
		pageList : [ 15 ],
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
		    	width: '10%',
		    	align:'center'
		     },{
		    	title:'标题',
		    	field:'title',
		    	width: '33%',
		    	align:'center'
		     },{
		    	title:'申请日期',
		    	field:'date',
		    	width: '15%',
		    	align:'center' 
		     },{
		    	title:'初审人',
		    	field:'fzr',
		    	width: '10%',
		    	align:'center' 
		     },{
		    	title:'状态',
		    	field:'zt',
		    	width: '10%',
		    	align:'center',
		    	formatter:function(value,row,index) {
		    		if (value==1) {
		    			return '一审中';
		    		} else if (value==2) {
		    			return '二审中';
		    		} else if (value==5) {
		    			return '一审未通过';
		    		} else if (value==6) {
		    			return '二审未通过';
		    		} else if (value==4) {
		    			return '已过期';
		    		} else if (value==3){
		    			return '上架中';
		    		} else if (value == 7) {
		    			return '编辑中';	
		    		}
		    	}
		     },{
		    	title:'操作',
		    	field:'opt',
		    	width: '20%',
		    	align:'center',
				formatter:function(value,row,index) {
		    		return "<a class='rkdxwzsUI_lookBtn' onclick='rkdxwzsUI.preview("+index+")'>查看</a>&nbsp;<a class='rkdxwzsUI_agreeBtn' onclick='rkdxwzsUI.ground("+index+")'>同意上架</a>&nbsp;<a class='rkdxwzsUI_refuseBtn' onclick='rkdxwzsUI.revert("+index+")'>驳回</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".rkdxwzsUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".rkdxwzsUI_agreeBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".rkdxwzsUI_refuseBtn").linkbutton({
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
