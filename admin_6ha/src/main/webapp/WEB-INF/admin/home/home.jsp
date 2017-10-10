<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>溜哈网后台管理系统</title>
    	
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/css/jcdj.css">
	<style type="text/css">
		.container{
            width: 100%;
            height: 100%;
            background-image: url(images/home/home_bg.jpg) ;
            background-repeat: no-repeat;
			background-size: 100% 100%;
            background-attachment: fixed;
            overflow: hidden;
	   }
       .main_glass{
       		width:1000px;
       		height:400px;
       		margin: auto;
       		margin-top: 100px;
       }
       .headtext{
       		width:1000px;
       		font-size: 5em; 
       		text-align: center;
       		color: #FFF;
       }
       .loginbuttondiv{
       		width:800px;
       		height:80;
       		margin:auto;
       		margin-top: 100px;
       }
       .loginbutton{
       		margin:auto;
       		width:300px;
       		height: 60px;
       		font-size: 40px;
       		text-align: center;
       		color: #f99;
       		border: 3px solid #fff;
       		cursor: pointer;
       }
       .loginbutton:hover
		{
			background-color: #fff;
		}
       
    </style>
  </head>
  
  <body>
   	<div class='container'>
        <div class='main_glass'>
        	<div class='headtext'>溜哈网<br>网站用户信息化管理平台</div>
        	<div class='loginbuttondiv'>
        		<div class="yuanjiao touming loginbutton fleft" onclick="visitor()">我是党员</div>
        		<div class="yuanjiao touming loginbutton fright" onclick="login()">我是管理员</div>
        	</div>
        </div>
    </div>
    <script type="text/javascript">
    	function visitor(){
    		window.location.href = "${pageContext.servletContext.contextPath}/main.do";
    	}
    	function login(){
    		window.location.href = "${pageContext.servletContext.contextPath}/loginUI.do";
    	}
    </script>
  </body>
</html>
