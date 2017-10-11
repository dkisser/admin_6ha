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
  <form class="layui-form layui-form-pane" id="previewGdxwUI_form" method="post" action="twsj/editDtw.do" enctype="multipart/form-data">
     <div class="layui-form-item">
	 </div>
	 <div class="layui-form-item">
	     <label class="layui-form-label">标题</label>
	     <div class="layui-input-block">
	       <input id="previewGdxwUI_title" type="text" disabled="disabled" name="title" autocomplete="off" class="layui-input" value="${previewNews.title}">
	     </div>
	 </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">页面预览</label>
	    <div class="layui-input-block">
	      <textarea name="content" class="layui-textarea" id="previewGdxwUI_ymContent">${previewNews.remarkStr}</textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block" style="margin: 0 450px;">
	      <button class="layui-btn"  onclick="previewGdxwUI.cancel()">关闭</button>
	    </div>
	  </div>
  </form>
<script type="text/javascript">

	$("form").submit(function(e){
		  return false;
	});
	
	layui.use(['form','layedit','jquery'], function(){
	    var layedit = layui.layedit,
	    form = layui.form();
	    layedit.set({
    	  uploadImage: {
    	    url: getContextPath() + '/admin/twsj/uploadPic.do' ,//接口url
    	    type: 'post' //默认post
    	  }
	    });
	    
	    layedit.build('previewGdxwUI_ymContent'); //建立编辑器
	});
	
	
	$("#previewGdxwUI_pic").attr("title","<img style='width:300px;height:300px;' src='${previewNews.imgurl}'></img>");
	
	$("#previewGdxwUI_pic").tooltip({    
		position: 'bottom',    
    	onShow: function(){        
    		$(this).tooltip('tip').css({            
    			backgroundColor: '#666',            
    			borderColor: '#666'        
    			});    
    		}
	});
	var previewGdxwUI = {
			
			cancel: function () {
				$("#gdxwcsUI_newPreviewDlg").dialog("close");
			}
		};
</script>

</body>
</html>
