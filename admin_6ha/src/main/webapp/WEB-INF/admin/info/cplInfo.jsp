<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'home.jsp' starting page</title>
   	<link>
	<meta charset="utf-8">
  </head>
<body>
<div id="dlgCplInfo" class="easyui-tabs" fit="true"> 
   <div title="联系方式" >
    <div  class="easyui-layout" fit="true">   
	    <div data-options="region:'south'" style="height:100px;">
	    	<div style="width: 30%;height: 100%;float:left;"></div><div style="width: 30%;height:100%;text-align: center;float:left;line-height: 90px"><a id="cpl_okBtn" onclick="cplInfo.cpl_ok()">确定</a></div>
	    </div>   
	    <div data-options="region:'east',iconCls:'icon-reload'" style="width:60%;">
	      <div id="dgCPLdiv"></div>
	    </div>
	    <div id="lyt_west" data-options="region:'west'" style="width:40%;">
	    <form id="cpl_form1" method="post">
	    	<div style="width: 100%;height: 10%;margin-top: 60px;float:left;"><div style="margin-left: 30px;float:left;">姓名:</div><div style="margin-left: 30px;float:left;"><input id="cpl_petname" name="petname"/></div></div>
	    	<div style="width: 100%;height: 10%;margin-top: 20px;float:left;"><div style="margin-left: 30px;float:left;">性别:</div><div style="margin-left: 30px;float:left;"><input id="cpl_sex" name="sex"/></div></div>
	    	<div style="width: 100%;height: 10%;margin-top: 20px;float:left;"><div style="margin-left: 30px;float:left;">年龄:</div><div style="margin-left: 30px;float:left;"><input id="cpl_age" name="age"/></div></div>
	    </form>
	    </div> 
  	</div>   
   </div>   
   <div title="身份信息" >   
      <div  class="easyui-layout" fit="true">   
	    <div data-options="region:'south'" style="height:100px;">
	    	<div style="width: 30%;height: 100%;float:left;"></div><div style="width: 30%;height:100%;text-align: center;float:left;line-height: 90px"><a id="cpl_okBtn2" onclick="cplInfo.cpl_ok2()">确定</a></div>
	    </div>   
	    <div data-options="region:'east',iconCls:'icon-reload'" style="width:60%;">
	    	<div id="dgCPLCitydiv"></div>
	    </div>   
	    <div data-options="region:'west'" style="width:40%;">
	    <form id="cpl_form2" method="post"> 
	    	<div style="width: 100%;height: 10%;margin-top: 60px;float:left;"><div style="margin-left: 30px;float:left;">身份证号:</div><div style="margin-left: 10px;float:left;"><input id="cpl_idcard" name="idCard"/></div></div>
	    	<div style="width: 100%;height: 10%;margin-top: 20px;float:left;"><div style="margin-left: 30px;float:left;">所在省份:</div><div style="margin-left: 10px;float:left;"><input id="cpl_province" name="province"/></div></div>
	    	<div style="width: 100%;height: 10%;margin-top: 20px;float:left;"><div style="margin-left: 30px;float:left;">所在城市:</div><div style="margin-left: 10px;float:left;"><input id="cpl_city" name="city"/></div></div>
	    </form>  
	    </div> 
  	</div>   
   </div>
</div>  
<script type="text/javascript">
cplInfo = {
		
	cpl_ok: function () {
		var petname = $("#cpl_petname").textbox("getText").trim();
		var age = $("#cpl_age").textbox("getText").trim();
		var email = $("#cpl_email").textbox("getText").trim();
		var phone = $("#cpl_phone").textbox("getText").trim();
		$("#cpl_form1").form("submit",{
			url: getContextPath() + "/admin/info/completeUserInfo.do",
			onSubmit: function (param) {
				if (petname =="" || petname.length < 2) {
					swal({
						title:"提示",
						text:"输入姓名不合法，请重新填写!",
						type:"warning"
					});
					return false;
				}
				if (age =="" || parseInt(age) < 0 || parseInt(age) > 100) {
					swal({
						title:"提示",
						text:"您输入的年龄不合法，请重新输入!",
						type:"warning"
					});
					return false;
				}
				
				if (email =="") {
					swal({
						title:"提示",
						text:"您输入的邮箱不合法，请重新输入!",
						type:"warning"
					});
					return false;
				}
				
				if (phone =="") {
					swal({
						title:"提示",
						text:"您输入的电话号码不合法，请重新输入!",
						type:"warning"
					});
					return false;
				}
				param.email = email;
				param.phone = phone;
			},
			success: function (result) {
				if (result) {
					swal({
						title:"提示",
						text:"您已经成功修改了消息，请重新登录",
						type:"success"
					});
				}
			}
			
		});
	},
		
	cpl_ok2: function () {
		//更新
		var idCard = $("#cpl_idcard").textbox("getText").trim();
		var province = $("#cpl_province").combobox("getText").trim();
		var city = $("#cpl_city").combobox("getText").trim();
		$("#cpl_form2").form("submit",{
			url:getContextPath() + "/admin/info/completeValidateInfo.do",
			onSubmit: function () {
				if (idCard == "" || idCard.length < 18) {
					swal({
						title:"提示",
						text:"您填写身份证信息有误，请重新填写",
						type:"warning"
					});
					return false;
				}
				if (province == "") {
					swal({
						title:"提示",
						text:"您必须填写省份信息",
						type:"warning"
					});
					return false;
				}
				if (city == "") {
					swal({
						title:"提示",
						text:"您必须填写所在城市信息",
						type:"warning"
					});
					return false;
				}
			},
			success: function (result) {
				if (result) {
					swal({
						title:"提示",
						text:"您已经成功修改了消息，请重新登录",
						type:"success"
					});
				}
			}

		});
	}
		
}

	
	$("#dlgCplInfo").tabs({
		pill:true,
		tabWidth: "100px"
	});
	
	$("#cpl_petname").textbox({
	    iconCls:'icon-man', 
	    iconAlign:'right',
	    value:'${requestScope.vUser.petname}'
	});
	$("#cpl_sex").combobox({
		valueField:'id',    
		textField:'text',
	    value:'${requestScope.vUser.sex}',
	    data:[{
	    	id: '男',
	    	text:'男'
	    	},{
	    	id: '女',
	    	text:'女',
	    	}]
	});
	$("#cpl_age").textbox({
	    iconCls:'icon-man', 
	    iconAlign:'right' ,
	    value:'${requestScope.vUser.age}'
	});
	
	$("#cpl_idcard").textbox({
		width: "180px",
	    iconCls:'icon-man', 
	    iconAlign:'right',
	    value:'${requestScope.vUser.idCard}'
	});
	$("#cpl_province").combobox({
		width: "180px",
		url:getContextPath () + "/admin/info/getProvinceCombo.do",    
	    valueField:'id',    
	    textField:'text', 
	    value:'${requestScope.vUser.provinceName}',
	    onSelect : function (result) {
	    	$("#dgCPLCitydiv").datagrid({
	    		url: getContextPath() + "/admin/info/getCityInfo.do?provinceId="+result.id,
	    		striped: true,
	    		nowrap: true,
	    		loadMsg: "数据正在加载中,请稍后...",
	    		emptyMsg: "目前暂无任何数据额...",
	    		singleSelect: true,
	    		showHeader: true,
	    		columns:[[
	    		   
	    			 {
	    				width: "476px",
	    			    title: "该省下面的城市",
	    			    field: "cityName",
	    			    align: "center", 
	    			}
	    		]],
	    		onDblClickRow: function(index,row){
	    			$("#cpl_city").textbox("setText",row.cityName) ;
	    		}
	    	});
	    },
	    onLoadError: function () {
	    	$('#dgCPLdiv').datagrid('appendRow',{
				text: '目前网络状况不太好，省份加载失败，请刷新一下'
			});
	    },
	    onLoadSuccess: function () {
	    	if ('${requestScope.vUser.provinceName}') {
	    		var data = $(this).combobox("getData");
	    		$(this).combobox("select",data[0].id);
	    	}else {
	    		$(this).combobox("select",'${requestScope.vUser.provinceName}');
	    	}
	    }
	});
	$("#cpl_city").textbox({
		width: "180px",
		iconCls:'icon-man', 
	    iconAlign:'right',
	    readonly: true,
	    value:'${requestScope.vUser.cityName}'
	});
	
	$("#dgCPLdiv").datagrid({
		striped: true,
		nowrap: true,
		loadMsg: "数据正在加载中,请稍后...",
		emptyMsg: "目前暂无任何数据额...",
		singleSelect: true,
		showHeader: true,
		columns:[[
		   
			 {
				width: "100%",
			    title: "提示",
			    field: "text",
			    align: "center", 
			}
		]],
		onDblClickRow: function(index,row){
			switch (row.text) {
			case "请前去填写您的邮箱信息":
				var cplAppend = $("<div id='cplAppend'></div>");
				cplAppend.appendTo("#center");
				$("#cplAppend").dialog({
					href: getContextPath() + "/admin/info/emailInfoUI.do",
					title:"邮箱信息填写",
					width: 512,
					height: 300,
					cache: false,
					inline:true,
					onClose: function () {
						$("#cplAppend").remove();
					}
				});
				break;
			case "请前去填写您的电话信息":
				var cplAppend = $("<div id='cplAppend'></div>");
				cplAppend.appendTo("#center");
				$("#cplAppend").dialog({
					href: getContextPath() + "/admin/info/phoneInfoUI.do",
					title:"电话信息填写",
					width: 512,
					height: 300,
					cache: false,
					inline:true,
					onClose: function () {
						$("#cplAppend").remove();
					}
				});
				break;
			case "请前去填写您的身份信息":
				$("#dlgCplInfo").tabs("select","身份信息");
				break;

			default:
				break;
			}
		}
	});

	var str = '';
	if ("${requestScope.vUser.email}" != "") {
		str += '<div style="width: 100%;height: 10%;margin-top: 20px;float:left;"><div style="margin-left: 30px;float:left;">邮箱:</div><div style="margin-left: 30px;float:left;"><input id="cpl_email" name="email"/></div></div>';
		
	} else {
		$('#dgCPLdiv').datagrid('appendRow',{
			text: '请前去填写您的邮箱信息'
		});
	}
	
	if ("${requestScope.vUser.phone}" != "") {
		str += '<div style="width: 100%;height: 10%;float:left;"><div style="margin-left: 30px;float:left;">电话:</div><div style="margin-left: 30px;float:left;"><input id="cpl_phone" name="phone"/></div></div>';
		
	} else {
		$('#dgCPLdiv').datagrid('appendRow',{
			text: '请前去填写您的电话信息'
		});
	}
	
	if ("${requestScope.vUser.idCard}" == "") {
		$('#dgCPLdiv').datagrid('appendRow',{
			text: '请前去填写您的身份信息'
		});
	}
	
	$("#lyt_west").append(str);
	
	$("#cpl_email").textbox({
	    iconCls:'icon-man', 
	    iconAlign:'right' ,
	    value:'${requestScope.vUser.email}'
	});
	$("#cpl_phone").textbox({
	    iconCls:'icon-man', 
	    iconAlign:'right' ,
	    value:'${requestScope.vUser.phone}'
	});
	
	$("#cpl_okBtn").linkbutton ({
		size:'large',
		iconAlign:'left',
		iconCls: 'icon-ok'
	});
	$("#cpl_okBtn2").linkbutton ({
		size:'large',
		iconAlign:'left',
		iconCls: 'icon-ok'
	});

	
</script>  	
</body>
</html>
