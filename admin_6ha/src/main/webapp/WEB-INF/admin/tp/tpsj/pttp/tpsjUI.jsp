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
<div id="dlgpttpsjUIMain">
  <table id="pttpsjUI_toolbar" style="width:100%;">
    <tr style="height:30px;"><td><a class="easyui-linkbutton" data-options="iconCls:'icon-add',iconAlign:'left',plain:true" onclick="pttpsjUI.add()">新增</a></td></tr>
  </table>
  <div id="pttpsjUI_dgpttpList" fit="true"></div>
</div>
<script type="text/javascript">
	var pttpsjUI = {
		
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
			pttpsjUI.createBigDialog("pttpsjUI_newAddDlg", "新增普通图片", getContextPath() + "/admin/tpsj/addPttpUI.do", {});
		},
		
		del:function (index) {
			var pttpsjUI_delRow = $("#pttpsjUI_dgpttpList").datagrid("getData").rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				layer.msg('您确定要删除该记录吗?',{
					time: 10000, //10S后关闭
					btn:['是的','算了'],
					yes:function () {
						$.ajax({
							url: getContextPath() + "/admin/tpsj/delPttp.do",
							type: "post",
							data:{id:pttpsjUI_delRow.id},
							dataType:"json",
							async:false,
							cache:false,
							success:function (res) {
								$("#pttpsjUI_dgpttpList").datagrid('reload');
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
		sjTp: function (index) {
			var pttpsjUI_sjRow = $("#pttpsjUI_dgpttpList").datagrid("getData").rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				layer.msg('您确定要上架该图片吗?',{
					time: 10000, //10S后关闭
					btn:['是的','算了'],
					yes:function () {
						$.ajax({
							url: getContextPath() + "/admin/tpsj/sjPttp.do",
							type: "post",
							data:{id:pttpsjUI_sjRow.id},
							dataType:"json",
							async:false,
							cache:false,
							success:function (res) {
								$("#pttpsjUI_dgpttpList").datagrid('reload');
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
					},
					btn2:function (index) {
					}
				});
			});
		}
			
	};
	
	$("#dlgpttpsjUIMain").dialog({
		title:"普通图片上架申请",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#pttpsjUI_dgpttpList").datagrid({
		url:getContextPath() + "/admin/tpsj/getPttpList.do",
		toolbar: "#pttpsjUI_toolbar",
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
		    	title:'图片类型',
		    	field:'lx',
		    	width: '15%',
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
		    	width: '53%',
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
		    		if (row.zt==1 || row.zt==2) {
		    			return '';
		    		} else if (row.zt == 4 || row.zt==5 || row.zt==6) {
		    			return '<a class="pttpsjUI_cxsjBtn" onclick="pttpsjUI.sjTp('+index+')">重新上架</a>&nbsp;<a class="pttpsjUI_delBtn" onclick="pttpsjUI.del('+index+')">删除</a>';
		    		} else if (row.zt == 7) {
		    			return '<a class="pttpsjUI_cxsjBtn" onclick="pttpsjUI.sjTp('+index+')">上架</a>&nbsp;<a class="pttpsjUI_delBtn" data-method="confirm" onclick="pttpsjUI.del('+index+')">删除</a>';
		    		}
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".pttpsjUI_cxsjBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".pttpsjUI_delBtn").linkbutton({
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
