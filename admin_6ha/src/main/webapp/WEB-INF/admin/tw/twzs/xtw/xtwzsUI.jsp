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
<div id="dlgxtwzsUIMain">
  <table id="xtwzsUI_toolbar" style="width:100%;">
    <tr>
      <td style="width: 560px;"></td>
      <td>申请人:</td><td><input id="xtwzsUI_sqrtxb" name="sqr" style="width: 120px;"/></td>
      <td style="padding-left: 10px;">标    题:</td><td><input id="xtwzsUI_titletxb" name="title" style="width: 120px;"/></td>
      <td style="padding-left: 20px;"><a class="easyui-linkbutton" onclick="xtwzsUI.query()" data-options="iconCls:'icon-search'">查询</a></td>
    </tr>
  </table>
  <div id="dgxtwzsUI" fit="true"></div>
</div>
<script type="text/javascript">

	var xtwzsUI = {
		query:function (){
			$("#dgxtwzsUI").datagrid('reload',{
				sqr:$("#xtwzsUI_sqrtxb").textbox('getValue'),
				title:$("#xtwzsUI_titletxb").textbox('getValue')
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
			var xtwzsUI_previewRow = $("#dgxtwzsUI").datagrid('getData').rows[index];
			xtwzsUI.genBigDialog("xtwzsUI_newPreviewDlg", "新闻预览", getContextPath() + "/admin/twzs/previewXtwUI.do",{id:xtwzsUI_previewRow.id});
		},
		ground:function (index) {
			xtwzsUI_submitZSRow = $("#dgxtwzsUI").datagrid('getData').rows[index];
			xtwzsUI.genSmallDialog("xtwzsUI_newGroundDlg", "请选择一个新闻下架", getContextPath() + "/admin/twzs/chooseXtwUI.do");
		},
		revert:function (index) {
			xtwzsUI_revertRow = $("#dgxtwzsUI").datagrid('getData').rows[index];
			xtwzsUI.genSmallDialog("xtwzsUI_newRevertDlg", "终审失败", getContextPath() + "/admin/twzs/revertXtwUI.do");
		}
			
	};

	$("#dlgxtwzsUIMain").dialog({
		title:"大图文初审",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#xtwzsUI_sqrtxb").textbox({});
	
	$("#xtwzsUI_titletxb").textbox({});
	
	$("#dgxtwzsUI").datagrid({
		url:getContextPath() + "/admin/twzs/getXtwList.do",
		toolbar: "#xtwzsUI_toolbar",
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
		    		return "<a class='xtwzsUI_lookBtn' onclick='xtwzsUI.preview("+index+")'>查看</a>&nbsp;<a class='xtwzsUI_agreeBtn' onclick='xtwzsUI.ground("+index+")'>同意上架</a>&nbsp;<a class='xtwzsUI_refuseBtn' onclick='xtwzsUI.revert("+index+")'>驳回</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".xtwzsUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".xtwzsUI_agreeBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".xtwzsUI_refuseBtn").linkbutton({
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
