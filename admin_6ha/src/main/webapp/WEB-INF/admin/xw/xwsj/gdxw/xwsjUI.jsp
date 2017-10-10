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
<div id="dlggdxwsjUIMain">
  <table id="gdxwsjUI_toolbar" style="width:100%;">
    <tr style="height:30px;"><td><a class="easyui-linkbutton" data-options="iconCls:'icon-add',iconAlign:'left',plain:true" onclick="gdxwsjUI.add()">新增</a></td></tr>
  </table>
  <div id="gdxwsjUI_dgxwList" fit="true"></div>
</div>
<script type="text/javascript">
	var gdxwsjUI = {
		
		createBigDialog: function (dialogId,title,href,params) {
			var dialogObj = $("<div id=\""+dialogId+"\"></div>");
			dialogObj.appendTo("#center");
			$("#"+dialogId).dialog({
				href: href,
				queryParams : params,
				title: title,
				width: 1024,
				height:600,
				modal:true,
				inline:true,
				cache:false,
				onClose:function () {
					dialogObj.remove();
				}
			});
		},
		createSmallDialog: function (dialogId,title,href,params) {
			var dialogObj = $("<div id=\""+dialogId+"\"></div>");
			dialogObj.appendTo("body");
			$("#"+dialogId).dialog({
				href: href,
				queryParams : params,
				title: title,
				width: 512,
				height:300,
				modal:true,
				inline:true,
				cache:false,
				onClose:function () {
					dialogObj.remove();
				}
			});
		},
		
		add:function () {
			gdxwsjUI.createBigDialog("gdxwsjUI_newAddDlg", "新增滚动新闻", getContextPath() + "/admin/xwsj/addGdxwUI.do", {});
		},
		
		edit:function (index) {
			gdxwsjUI_editRow = $("#gdxwsjUI_dgxwList").datagrid("getData").rows[index];
			gdxwsjUI.createBigDialog("gdxwsjUI_newEditDlg", "修改新闻", getContextPath() + "/admin/xwsj/editGdxwUI.do", {id:gdxwsjUI_editRow.id});
		},
		
		del:function (index) {
			var gdxwsjUI_delRow = $("#gdxwsjUI_dgxwList").datagrid("getData").rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				layer.msg('您确定要删除该记录吗?',{
					time: 10000, //10S后关闭
					btn:['是的','算了'],
					yes:function () {
						$.ajax({
							url: getContextPath() + "/admin/xwsj/delGdxw.do",
							type: "post",
							data:{dm:gdxwsjUI_delRow.dm},
							dataType:"json",
							async:false,
							cache:false,
							success:function (res) {
								$("#gdxwsjUI_dgxwList").datagrid('reload');
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
		sjDtw: function (index) {
			var gdxwsjUI_sjRow = $("#gdxwsjUI_dgxwList").datagrid("getData").rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				layer.msg('您确定要上架该新闻吗?',{
					time: 10000, //10S后关闭
					btn:['是的','算了'],
					yes:function () {
						$.ajax({
							url: getContextPath() + "/admin/twsj/sjDtw.do",
							type: "post",
							data:{twdm:gdxwsjUI_sjRow.dm},
							dataType:"json",
							async:false,
							cache:false,
							success:function (res) {
								$("#gdxwsjUI_dgxwList").datagrid('reload');
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
		}
			
	};
	
	$("#dlggdxwsjUIMain").dialog({
		title:"大图文上架申请",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#gdxwsjUI_dgxwList").datagrid({
		url:getContextPath() + "/admin/xwsj/getGdxwList.do",
		toolbar: "#gdxwsjUI_toolbar",
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
		    		if (row.zt==1 || row.zt==2) {
		    			return '';
		    		} else if (row.zt == 4 || row.zt==5 || row.zt==6) {
		    			return '<a class="gdxwsjUI_cxsjBtn" onclick="gdxwsjUI.sjDtw('+index+')">重新上架</a>&nbsp;<a class="gdxwsjUI_editBtn" onclick="gdxwsjUI.edit('+index+')">修改</a>&nbsp;<a class="gdxwsjUI_delBtn" onclick="gdxwsjUI.del('+index+')">删除</a>';
		    		} else if (row.zt == 7) {
		    			return '<a class="gdxwsjUI_cxsjBtn" onclick="gdxwsjUI.sjDtw('+index+')">上架</a>&nbsp;<a class="gdxwsjUI_editBtn" onclick="gdxwsjUI.edit('+index+')">修改</a>&nbsp;<a class="gdxwsjUI_delBtn" data-method="confirm" onclick="gdxwsjUI.del('+index+')">删除</a>';
		    		}
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".gdxwsjUI_cxsjBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".gdxwsjUI_editBtn").linkbutton({
				iconCls:'icon-edit',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".gdxwsjUI_delBtn").linkbutton({
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
