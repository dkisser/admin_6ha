<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String baseUrl = "http://localhost:8080/admin_6ha"; %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta charset="utf-8">
  </head>
  
<body>
    <form class="layui-form layui-form-pane" id="addRkdxwUI_form" method="post" action="twsj/addRkdxw.do" enctype="multipart/form-data">
     <div class="layui-form-item">
	 </div>
	 <div class="layui-form-item">
	    <label class="layui-form-label">标题</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" required  lay-verify="title|required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">页面编辑</label>
	    <div class="layui-input-block">
	      <textarea name="content" placeholder="请输入内容" lay-verify="content" class="layui-textarea" id="addRkdxwUI_ymContent"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block" style="margin: 0 400px;">
	      <button class="layui-btn" id="addRkdxw_submitBtn" lay-submit lay-filter="addRkdxw">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
  </form>
<script type="text/javascript">

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
	    var editIndex = layedit.build('addRkdxwUI_ymContent'); //建立编辑器
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
	    form.on('submit(addRkdxw)',function (data) {
	    	$("form").submit(function(e){
	    		  return false;
	    	});
    	 	$("#addRkdxwUI_form").form("submit", {
    	 		url: getContextPath() +"/admin/xwsj/addRkdxw.do",
    	 		onSubmit:function () {
    	 			var valid = $("#addRkdxwUI_form").form("validate");
    	 			if (!valid) {
    	 				return false;
    	 			}
    	 		},
    	 		success:function (result) {
    	 			$("#rkdxwsjUI_newAddDlg").panel("close");
	 				$("#rkdxwsjUI_dgxwList").datagrid("reload");
	 				result =eval("("+result+")");
    	 			if ( result == "success") {
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
	
</script>

</body>
</html>
