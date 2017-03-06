<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收入统计</title>
<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
</head>
<body>
	<div id="main" style="width: 600px;height:600px;"></div>
	<script type="text/javascript">
		var Arr = new Array();
		var ArrNum = new Array();
		<c:forEach items="${expendAll}" var="sa" varStatus="status" >  
		    Arr.push("${sa.etype}");
		    ArrNum.push({"value":"${sa.emoney}","name": "${sa.etype}"});
		</c:forEach> 
	// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
   // 指定图表的配置项和数据
        myChart.setOption( {
        	 title : {
        	        text: '本月的支出统计',
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data:Arr
        	    },
        	    series : [
        	        {
        	            name: '支出类型',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:ArrNum,
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
		});
	</script>
</body>
</html>