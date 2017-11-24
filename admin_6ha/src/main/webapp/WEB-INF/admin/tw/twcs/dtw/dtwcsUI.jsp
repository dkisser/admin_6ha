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
<div id="dlgdtwcsUIMain">
  <table id="dtwcsUI_toolbar" style="width:100%;">
    <tr>
      <td style="width: 560px;"></td>
      <td>申请人:</td><td><input id="dtwcsUI_sqrtxb" name="sqr" style="width: 120px;"/></td>
      <td style="padding-left: 10px;">标    题:</td><td><input id="dtwcsUI_titletxb" name="title" style="width: 120px;"/></td>
      <td style="padding-left: 20px;"><a class="easyui-linkbutton" onclick="dtwcsUI.query()" data-options="iconCls:'icon-search'">查询</a></td>
    </tr>
  </table>
  <div id="dgdtwcsUI" fit="true"></div>
</div>
<script type="text/javascript">

	var dtwcsUI = {
		query:function (){
			$("#dgdtwcsUI").datagrid('reload',{
				sqr:$("#dtwcsUI_sqrtxb").textbox('getValue'),
				title:$("#dtwcsUI_titletxb").textbox('getValue')
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
			var dtwcsUI_previewRow = $("#dgdtwcsUI").datagrid('getData').rows[index];
			dtwcsUI.genBigDialog("dtwcsUI_newPreviewDlg", "图文预览", getContextPath() + "/admin/twcs/previewDtwUI.do",{id:dtwcsUI_previewRow.id});
		},
		submitZS:function (index) {
			var dtwcsUI_submitZSRow = $("#dgdtwcsUI").datagrid('getData').rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				layer.msg('您确定要将该新闻提交至终审吗?',{
					time: 10000, //10S后关闭
					btn:['是的','算了'],
					yes:function () {
						$.ajax({
							url: getContextPath() +"/admin/twcs/submitDtwZS.do",
							cache:false,
							data:{dm:dtwcsUI_submitZSRow.dm},
							dataType:"json",
							method:"POST",
							success:function (res) {
								$("#dgdtwcsUI").datagrid("reload");
								if ( res == "success") {
			    	 				layer.msg('操作成功',{
			    	 					time: 1000,
			    	 				});
			    	 			} else {
			    	 				layer.alert(result,{title:'发生了一个错误'});
			    	 			}
							},
							error:function () {
								alert("Ajax error!");
							}
						});
					},
					btn2:function (index) {
					}
				});
			});
		},
		revert:function (index) {
			dtwcsUI_revertRow = $("#dgdtwcsUI").datagrid('getData').rows[index];
			dtwcsUI.genSmallDialog("dtwcsUI_newRevertDlg", "图文驳回", getContextPath() + "/admin/twcs/revertDtwUI.do",null);
		}
			
	};

	$("#dlgdtwcsUIMain").dialog({
		title:"大图文初审",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#dtwcsUI_sqrtxb").textbox({});
	
	$("#dtwcsUI_titletxb").textbox({});
	
	$("#dgdtwcsUI").datagrid({
		url:getContextPath() + "/admin/twcs/getDtwList.do",
		toolbar: "#dtwcsUI_toolbar",
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
		    	title:'终审人',
		    	field:'glr',
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
		    		return "<a class='dtwcsUI_lookBtn' onclick='dtwcsUI.preview("+index+")'>查看</a>&nbsp;<a class='dtwcsUI_agreeBtn' onclick='dtwcsUI.submitZS("+index+")'>提交终审</a>&nbsp;<a class='dtwcsUI_refuseBtn' onclick='dtwcsUI.revert("+index+")'>驳回</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".dtwcsUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".dtwcsUI_agreeBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".dtwcsUI_refuseBtn").linkbutton({
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
