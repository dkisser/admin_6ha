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
<div id="dlgdttpzsUIMain">
  <table id="dttpzsUI_toolbar" style="width:100%;">
    <tr>
      <td style="width: 760px;"></td>
      <td>申请人:</td><td><input id="dttpzsUI_sqrtxb" name="sqr" style="width: 120px;"/></td>
      <td style="padding-left: 20px;"><a class="easyui-linkbutton" onclick="dttpzsUI.query()" data-options="iconCls:'icon-search'">查询</a></td>
    </tr>
  </table>
  <div id="dgdttpzsUI" fit="true"></div>
</div>
<script type="text/javascript">

	var dttpzsUI = {
		query:function (){
			$("#dgdttpzsUI").datagrid('reload',{
				sqr:$("#dttpzsUI_sqrtxb").textbox('getValue')
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
			var dttpzsUI_previewRow = $("#dgdttpzsUI").datagrid('getData').rows[index];
			dttpzsUI.genBigDialog("dttpzsUI_newPreviewDlg", "新闻预览", getContextPath() + "/admin/tpzs/previewDttpUI.do",{id:dttpzsUI_previewRow.id});
		},
		ground:function (index) {
			dttpzsUI_submitZSRow = $("#dgdttpzsUI").datagrid('getData').rows[index];
			dttpzsUI.genSmallDialog("dttpzsUI_newGroundDlg", "请选择一个新闻下架", getContextPath() + "/admin/tpzs/chooseDttpUI.do");
		},
		revert:function (index) {
			dttpzsUI_revertRow = $("#dgdttpzsUI").datagrid('getData').rows[index];
			dttpzsUI.genSmallDialog("dttpzsUI_newRevertDlg", "终审驳回", getContextPath() + "/admin/tpzs/revertDttpUI.do");
		}
			
	};

	$("#dlgdttpzsUIMain").dialog({
		title:"动态图片终审",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#dttpzsUI_sqrtxb").textbox({});
	
	$("#dttpzsUI_titletxb").textbox({});
	
	$("#dgdttpzsUI").datagrid({
		url:getContextPath() + "/admin/tpzs/getDttpList.do",
		toolbar: "#dttpzsUI_toolbar",
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
				align:'center',
				formatter:function(value,row,index) {
					var content = "<span title='<img width=220 height=200 src="+row.imgurl+"/>' class='pictip'>"+value+"</span>";
		    		return content;
				}
			 },{
		    	title:'图片类型',
		    	field:'lx',
		    	width: '10%',
		    	align:'center',
		    	formatter:function(value,row,index) {
		    		var content = "<span title='<img width=220 height=200 src="+row.imgurl+"/>' class='pictip'>";
		    		if (value == 2) {
		    			content += "动态大图";
		    		} else if (value == 3) {
		    			content += "动态小图";
		    		} else if (value == 4) {
		    			content += "普通图片";
		    		}
		    		return content+="</span>";
		    	}
		     },{
		    	title:'图片地址',
		    	field:'imgurl',
		    	width: '48%',
		    	align:'center',
		    	formatter:function(value,row,index) {
		    		var content = "<span title='<img width=220 height=200 src="+row.imgurl+"/>' class='pictip'>"+value+"</span>";
		    		return content;
		    	}
		     },{
		    	title:'状态',
		    	field:'zt',
		    	width: '10%',
		    	align:'center',
		    	formatter:function(value,row,index) {
		    		var content = "<span title='<img width=220 height=200 src="+row.imgurl+"/>' class='pictip'>";
		    		if (value==1) {
		    			content+= '一审中';
		    		} else if (value==2) {
		    			content+= '二审中';
		    		} else if (value==5) {
		    			content+= '一审未通过';
		    		} else if (value==6) {
		    			content+= '二审未通过';
		    		} else if (value==4) {
		    			content+='已过期';
		    		} else if (value==3){
		    			content+= '上架中';
		    		} else if (value == 7) {
		    			content+= '编辑中';	
		    		}
		    		return content+="</span>";
		    	}
		     },{
		    	title:'操作',
		    	field:'opt',
		    	width: '20%',
		    	align:'center',
				formatter:function(value,row,index) {
		    		return "<a class='dttpzsUI_lookBtn' onclick='dttpzsUI.preview("+index+")'>查看</a>&nbsp;<a class='dttpzsUI_agreeBtn' onclick='dttpzsUI.ground("+index+")'>同意上架</a>&nbsp;<a class='dttpzsUI_refuseBtn' onclick='dttpzsUI.revert("+index+")'>驳回</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".dttpzsUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".dttpzsUI_agreeBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".dttpzsUI_refuseBtn").linkbutton({
				iconCls:'icon-no',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".pictip").tooltip({ 
				position:"bottom",
				trackMouse: true,
			});
		}
	});
</script>
</body>
</html>
