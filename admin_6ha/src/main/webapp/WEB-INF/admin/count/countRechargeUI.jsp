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
<div id="countrechargeUI_dlgmain">
   <div id="countrechargeUI_lytmain" class="easyui-layout" fit="true">   
    <div data-options="region:'north'" style="height:50px;">
	   	<table align="center" style="width: 1000px;height: 40px">
			<tr><td style="padding-left: 44px;"></td><td style="text-align: right;">充值时间：</td><td><input id="countrechargeUI_cmbczsj" name="year" style="width: 140px;"/></td></tr>
		</table>
    </div>   
    <div data-options="region:'center'" style="padding:5px;">
    	<div id="hignchart_hycz" style="width:800px;height:450px;padding: 34px 0px 0px 70px" ></div>
    </div>   
   </div> 
</div>
<script type="text/javascript">

$("#countrechargeUI_dlgmain").dialog({
	
	title:"会员充值情况统计",	
	width: 1024,
	height: 600,
	inline:true,
	cache: false,
	modal: true
	
});

$("#countrechargeUI_cmbczsj").combobox({
	url: getContextPath() + "/admin/count/getRechargeYearMC.do",
    valueField:'id',    
    textField:'text', 
    onLoadSuccess: function () {
    	var data = $(this).combobox("getData");
    	$(this).combobox("select",data[0].id);
    },
    onSelect : function (record) {
    	getDataByYear(record.id);
    }
});

function getDataByYear(year) {
	$.ajax({
		url: getContextPath() + "/admin/count/getRechargeInfo.do",
		cache: false,
		async: false,
		type: "POST",
		data:{"year":year},
		dataType:"json",
		success: function (result) {
			var arr;
			var resultArr  = new Array();
			for (var i = 0 ; i<result.length ; i++) {
				arr = new Array();
				arr.push(FormatDate(new Date(result[i].czsj)));
				arr.push(result[i].num);
				resultArr.push(arr);
			}
			showChart(resultArr,year);
		},
		error: function () {
			alert("Ajax error!");
		}
	});
}

function showChart(result,year) {
	 $('#hignchart_hycz').highcharts({

	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '溜哈网会员 ${sessionScope.login.petname} '+year+'年充值情况'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>:<span style="color:#AA0000"> {point.y}</span> ',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: '充值占比',
	            data: result
	        }]
	    });
}

function FormatDate(date) {
	
	return date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日";
}
</script>
  </body>
</html>
