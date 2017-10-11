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
   <form class="layui-form layui-form-pane" id="addDttpUI_form" method="post" action="twsj/addDttp.do" enctype="multipart/form-data">
     <div class="layui-form-item">
     	<label class="layui-form-label">图片类型</label>
	    <div class="layui-input-inline">
	      <input name="lx" id="addDttpUI_lx" type="text" placeholder="请选择图片类型" autocomplete="off" class="layui-input"/>
	    </div>
	 </div>
	 <div class="layui-form-item">
	    <label class="layui-form-label">图片</label>
	    <div class="layui-input-block">
	      <input class="easyui-filebox layui-input" style="height:38px;" name="pic" id="addDttpUI_pic">
	    </div>
	  </div>
	 <div class="layui-form-item">
	    <label class="layui-form-label">标题</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" lay-verify="title|required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">页面编辑</label>
	    <div class="layui-input-block">
	      <textarea name="content" placeholder="请输入内容" lay-verify="content" class="layui-textarea" id="addDttpUI_ymContent"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block" style="margin: 0 400px;">
	      <button class="layui-btn" lay-submit lay-filter="addDttp">立即提交</button>
	      <button class="layui-btn layui-btn-primary" onclick="addDttpUI.cancel()">取消</button>
	    </div>
	  </div>
	</form>
<script type="text/javascript">
	var addDttpUI ={
		cancel: function () {
			$("#dttpsjUI_newAddDlg").dialog("close");
		}

	};
	layui.use(['form','layedit','jquery'], function(){
	    var layedit = layui.layedit,
	    form = layui.form(),
	    $ = layui.jquery;
	   	
	    layedit.set({
    	  uploadImage: {
    	    url: getContextPath() + '/admin/twsj/uploadPic.do' ,//接口url
    	    type: 'post' //默认post
    	  }
	    });
	    var editIndex = layedit.build('addDttpUI_ymContent',{
	    	height: 250 
	    }); //建立编辑器
	    form.verify({
	        title: function(value,item){
	          if(value.length < 5){
	            return '标题至少得5个字符啊';
	          }
	        },
	        content: function(value,item){
	          layedit.sync(editIndex);
	        }
        });
	    form.on('submit(addDttp)',function (data) {
	    	$("form").submit(function(e){
	    		  return false;
	    	});
    	 	$("#addDttpUI_form	").form("submit", {
    	 		url: getContextPath() +"/admin/tpsj/addDttp.do",
    	 		onSubmit:function () {
    	 			var valid = $("#addDttpUI_form").form("validate");
    	 			if (!valid) {
    	 				return false;
    	 			}
    	 		},
    	 		success:function (result) {
    	 			$("#dttpsjUI_newAddDlg").panel("close");
	 				$("#dttpsjUI_dgdttpList").datagrid("reload");
	 				res = eval("("+result+")");
    	 			if ( res == "success") {
    	 				layer.msg('操作成功',{
    	 					time: 1000,
    	 				});
    	 			} else {
    	 				layer.alert(result,{title:'发生了一个错误'});
    	 			}
    	 		}
    	 		
    	 	});
	    });
	});
	
	$("#addDttpUI_lx").combobox({
		width: 900,
		height: 38,
		valueField: 'id',
		textField: 'text',
		data:[{
			id: 2,
			text:"动态大图"
		},{
			id: 3,
			text: "动态小图"
		}],
		editable:false,
		onLoadSuccess:function () {
			var data = $(this).combobox("getData");
			$(this).combobox("select",data[0].id);
		}
	});
	
	$("#addDttpUI_pic").filebox({
		required:true,
		buttonText: '选择动图', 
		accept:'image/gif'
	});
	
	
</script>

</body>
</html>
