<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<%String baseUrl="http://125.220.70.103:8080/admin_6ha";%>
</head>
<body>
<link href="${pageContext.servletContext.contextPath }/js/layui/css/layui.css" rel="stylesheet" type="text/css">
<script src="${pageContext.servletContext.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/layui/layui.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/swh_admin.js"></script>
<fieldset class="layui-elem-field layui-field-title">
  <legend>快速注册</legend>
</fieldset>
<form class="layui-form" action="<%=baseUrl %>/web/regist.do" method="post">
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">用户名：</label>
    <div class="layui-input-block">
      <input id="registUI_uname" style="width:200px;" type="text" name="uname" lay-verify="uname|name" autocomplete="off" placeholder="请输入用户名" class="layui-input">
    </div>
</div>
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">密码：</label>
    <div class="layui-input-block">
      <input id="registUI_password" style="width:200px;" type="password" name="password" lay-verify="pass" autocomplete="off" placeholder="请输入密码" class="layui-input">
    </div>
</div>
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">确认密码：</label>
    <div class="layui-input-block">
      <input id="registUI_repassword" style="width:200px;" type="password" name="repassword" lay-verify="checkPassword|pass" autocomplete="off" placeholder="请再次输入密码" class="layui-input">
    </div>
</div>
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">性别：</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男" checked>
      <input type="radio" name="sex" value="女" title="女">
    </div>
</div>
<div class="layui-form-item" style="margin: 10px;">
    <label class="layui-form-label">邮箱：</label>
    <div class="layui-input-block">
      <input id="registUI_email" style="width:200px;" type="text" name="email" lay-verify="email" autocomplete="off" placeholder="请输入您的常用邮箱" class="layui-input">
    </div>
</div>
<div class="layui-form-item" style="margin: 30px 10px;">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="regist">注册</button>
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
		    name: [
		             /^[\S]{5,}$/
		             ,'用户名必须大于5位，且中间不能出现空格'
		           ] 
	  		,uname:function(value,item){
	  			var valid = null;
	  			$.ajax({
	  				url:getContextPath() + "/web/checkUname.do",
		    		type:"POST",
		    		cache: false,
		    		async:false,
		    		data:{"uname":value},
		    		dataType:"json",
		    		success:function(result) {
		    			valid= result;
		    		},
		    		error:function() {
		    			layer.alert("Ajax Error!",{title:'错误'});
		    		}
	  			});
	  			if (valid) {
	  				return '该用户名已被别人注册';
	  			}
	  		}
		    ,pass: [
		             /^[\S]{6,12}$/
		             ,'密码必须6到12位，且不能出现空格'
		           ] 
		    ,checkPassword:function(value,item){
		    	if (value != $("#registUI_password").val()) {
		    		return '两次输入的密码不一致，请再次确认';
		    	}
		    }
		});
	  
		  form.on('submit(regist)',function(data){
	    	  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	    	  parent.layer.close(index);
			  parent.layer.msg('注册成功',{time:1000});
	      });
		  

  });
function cancel(){
	  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
   	  parent.layer.close(index);
}
</script>
</body>
</html>