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
  <form class="layui-form layui-form-pane" id="editXtwUI_form" method="post" action="twsj/editXtw.do" enctype="multipart/form-data">
     <div class="layui-form-item">
	 </div>
	 <div class="layui-form-item">
	     <label class="layui-form-label">标题</label>
	     <div class="layui-input-block">
	       <input type="text" name="title" required  lay-verify="title|required" value="${editNews.title}" placeholder="请输入标题" autocomplete="off" class="layui-input">
	     </div>
	 </div>
	 <div class="layui-form-item">
	    <label class="layui-form-label">图片</label>
	    <div class="layui-input-block">
	      <input class="easyui-filebox layui-input" style="height:38px;" name="pic" id="editXtwUI_pic">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">页面编辑</label>
	    <div class="layui-input-block">
	      <textarea name="content" placeholder="请输入内容" lay-verify="content" class="layui-textarea" id="editXtwUI_ymContent">${editNews.remarkStr}</textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block" style="margin: 0 400px;">
	      <button class="layui-btn" lay-submit lay-filter="editXtw">立即提交</button>
	      <button class="layui-btn layui-btn-primary" onclick="editXtwUI.cancel()">取消</button>
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
	    var editIndex = layedit.build('editXtwUI_ymContent'); //建立编辑器
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
	    form.on('submit(editXtw)',function (data) {
	    	$("form").submit(function(e){
	    		  return false;
	    	});
    	 	$("#editXtwUI_form").form("submit", {
    	 		url: getContextPath() +"/admin/twsj/editXtw.do",
    	 		onSubmit:function (param) {
    	 			var valid = $("#editXtwUI_form").form("validate");
    	 			if (!valid) {
    	 				return false;
    	 			}
    	 			param.twdm = xtwsjUI_editRow.dm;
    	 		},
    	 		success:function (result) {
    	 			$("#xtwsjUI_newEditDlg").panel("close");
	 				$("#xtwsjUI_dgxtwList").datagrid("reload");
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
	
	$('#editXtwUI_pic').filebox({    
	    buttonText: '选择图片', 
	    required: true
	});
	
	var editXtwUI = {
			
			cancel: function () {
				$("#xtwsjUI_newEditDlg").dialog("close");
			}
		};
</script>

</body>
</html>
