<%@ page language="java" import="java.util.*,org.lf.utils.AdminProperties" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<%String baseUrl=AdminProperties.SERVER_URL;%>
</head>
<body>
<link href="${pageContext.servletContext.contextPath }/js/layui/css/layui.css" rel="stylesheet" type="text/css">
<script src="${pageContext.servletContext.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/layui/layui.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/swh_admin.js"></script>
<fieldset class="layui-elem-field layui-field-title">
  <legend>用户登录</legend>
</fieldset>
<form class="layui-form" action="<%=baseUrl %>/web/login.do" method="post">
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">用户名：</label>
    <div class="layui-input-block">
      <input id="loginUI_uname" style="width:200px;" type="text" name="uname" lay-verify="uname" autocomplete="off" placeholder="请输入用户名" class="layui-input">
    </div>
</div>
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">密码：</label>
    <div class="layui-input-block">
      <input id="loginUI_password" style="width:200px;" type="password" name="password" lay-verify="password|pass" autocomplete="off" placeholder="请输入密码" class="layui-input">
    </div>
</div>
<div class="layui-form-item" style="margin: 30px 10px;">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="login">登录</button>
      <button class="layui-btn layui-btn-primary" onclick="cancel()">取消</button>
    </div>
</div>
</form>
<script type="text/javascript">

  layui.use(['form','layer','jquery'],function(){
	  var layer = layui.layer,
	  form = layui.form(),
	  $ = layui.jquery;
	  
	  form.verify({
		    uname: function(value, item){
		      if(value.length < 5){
		    	  //验证 在web_user表中是否有此人
		        return '用户名不能少于5个字符';
		      }
		    }
		    ,password: function (value, item) {
 
		    	
		    }
		});
	  
	  $(".layui-form").submit(function(){
		  $.ajax({
	    		url:getContextPath() + "/web/login.do",
	    		type:"POST",
	    		cache: false,
	    		async:true,
	    		data:{"uname":$("#loginUI_uname").val(),"password":$("#loginUI_password").val()},
	    		dataType:"json",
	    		success:function(result) {
    				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    		    	parent.layer.close(index);
	    			if (result=="success"){
	    				parent.layer.msg('登录成功',{time:1000});
	    			}
	    		},
	    		error:function() {
	    			layer.alert("Ajax Error!",{title:'错误'});
	    		}
	    	});
	  });
	  
		  form.on('submit(login)',function(data){
			
	      });
		  

  });
function cancel(){
	  //阻止表单的提交
	  $("form").submit(function(e){
		  return false;
	  });
	  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
   	  parent.layer.close(index);
}
</script>
</body>
</html>