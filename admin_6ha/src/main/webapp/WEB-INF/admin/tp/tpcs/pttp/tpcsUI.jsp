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
<div id="dlgpttpcsUIMain">
  <table id="pttpcsUI_toolbar" style="width:100%;">
    <tr>
      <td style="width: 760px;"></td>
      <td>申请人:</td><td><input id="pttpcsUI_sqrtxb" name="sqr"/></td>
      <td><a class="easyui-linkbutton" onclick="pttpcsUI.query()" data-options="iconCls:'icon-search'">查询</a></td>
    </tr>
  </table>
  <div id="dgpttpcsUI" fit="true"></div>
</div>
<script type="text/javascript">

	var pttpcsUI = {
		query:function (){
			$("#dgpttpcsUI").datagrid('reload',{
				sqr:$("#pttpcsUI_sqrtxb").textbox('getValue')
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
			var pttpcsUI_previewRow = $("#dgpttpcsUI").datagrid('getData').rows[index];
			pttpcsUI.genBigDialog("pttpcsUI_newPreviewDlg", "图片预览", getContextPath() + "/admin/tpcs/previewPttpUI.do",{id:pttpcsUI_previewRow.id});
		},
		submitZS:function (index) {
			var pttpcsUI_submitZSRow = $("#dgpttpcsUI").datagrid('getData').rows[index];
			layui.use('layer',function () {
				var layer = layui.layer;
				layer.msg('您确定要将该图片提交至终审吗?',{
					time: 10000, //10S后关闭
					btn:['是的','算了'],
					yes:function () {
						$.ajax({
							url: getContextPath() +"/admin/tpcs/submitPttpZS.do",
							cache:false,
							data:{dm:pttpcsUI_submitZSRow.dm},
							dataType:"json",
							method:"POST",
							success:function (res) {
								$("#dgpttpcsUI").datagrid("reload");
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
			pttpcsUI_revertRow = $("#dgpttpcsUI").datagrid('getData').rows[index];
			pttpcsUI.genSmallDialog("pttpcsUI_newRevertDlg", "驳回图片", getContextPath() + "/admin/tpcs/revertPttpUI.do",null);
		}
			
	};

	$("#dlgpttpcsUIMain").dialog({
		title:"普通图片初审",
		width: 1024,
		height:600,
		modal:true,
		inline:true,
		cache:false
	});
	
	$("#pttpcsUI_sqrtxb").textbox({
		width: 120
	});
	
	
	$("#dgpttpcsUI").datagrid({
		url:getContextPath() + "/admin/tpcs/getPttpList.do",
		toolbar: "#pttpcsUI_toolbar",
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
		    		return "<a class='pttpcsUI_lookBtn' onclick='pttpcsUI.preview("+index+")'>查看</a>&nbsp;<a class='pttpcsUI_agreeBtn' onclick='pttpcsUI.submitZS("+index+")'>提交终审</a>&nbsp;<a class='pttpcsUI_refuseBtn' onclick='pttpcsUI.revert("+index+")'>驳回</a>";
		    	}
		     }
		]],
		onLoadSuccess: function () {
			$(".pttpcsUI_lookBtn").linkbutton({
				iconCls:'icon-search',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".pttpcsUI_agreeBtn").linkbutton({
				iconCls:'icon-ok',
				iconAlign:'left',
				plain:true,
				height: 23
			});
			$(".pttpcsUI_refuseBtn").linkbutton({
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
