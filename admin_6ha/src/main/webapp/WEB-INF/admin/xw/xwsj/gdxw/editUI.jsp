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
    <form class="layui-form layui-form-pane" id="editGdxwUI_form" method="post" action="twsj/editGdxw.do" enctype="multipart/form-data">
     <div class="layui-form-item">
	 </div>
	 <div class="layui-form-item">
	    <label class="layui-form-label">标题</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" required  lay-verify="title|required" placeholder="请输入标题" autocomplete="off" value="${editNews.title}" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">页面编辑</label>
	    <div class="layui-input-block">
	      <textarea name="content" placeholder="请输入内容" lay-verify="content" class="layui-textarea" id="editGdxwUI_ymContent">${editNews.remarkStr}</textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block" style="margin: 0 400px;">
	      <button class="layui-btn" id="editGdxw_submitBtn" lay-submit lay-filter="editGdxw">立即提交</button>
	      <button class="layui-btn layui-btn-primary" onclick="editGdxw.cancel()">取消</button>
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
	    var editIndex = layedit.build('editGdxwUI_ymContent'); //建立编辑器
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
	    form.on('submit(editGdxw)',function (data) {
	    	$("form").submit(function(e){
	    		  return false;
	    	});
    	 	$("#editGdxwUI_form").form("submit", {
    	 		url: getContextPath() +"/admin/xwsj/editGdxw.do",
    	 		onSubmit:function (param) {
    	 			var valid = $("#editGdxwUI_form").form("validate");
    	 			if (!valid) {
    	 				return false;
    	 			}
    	 			param.dm = gdxwsjUI_editRow.dm;
    	 		},
    	 		success:function (result) {
    	 			$("#gdxwsjUI_newEditDlg").panel("close");
	 				$("#gdxwsjUI_dgxwList").datagrid("reload");
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
	var editGdxw = {
		cancel:function () {
			$("#gdxwsjUI_newEditDlg").dialog("close");
		}
	};
</script>

</body>
</html>
