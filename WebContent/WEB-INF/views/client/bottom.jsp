<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>首页底部</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
		<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/all.js"></script>
		<meta charset="utf-8">
	</head>
			<body>
				<div class="zscf_aboutus_wper">
			  <div class="zscf_aboutus px1000 clearfix">
			  	    <div class="zscf_aboutus_l fl">
			  	    	   <ul class="zscf_aboutus_lul clearfix">
			  	    	   	  <li class="pt10"><a href="#"><img src="<%=path %>/images/app.png" alt=""></a>
			  	    	   	  </li>
			  	    	   	  <li>
			  	    	   	  <p class="pb20">服务热线</p>
			  	    	   	  <strong>123-456-789</strong>
			  	    	   	  </li>
			  	    	   	  <li>
			  	    	   	  	  <p class="pb10 linkpic">
			  	    	   	  	     <a href="#"><img src="<%=path %>/images/ft_sina.png" alt=""></a>
			  	    	   	  	     <a href="#"><img src="<%=path %>/images/ft_weixin.png" alt=""></a>
			  	    	   	  	     <a href="#"><img src="<%=path %>/images/ft_erji.png" alt=""></a>
			  	    	   	  	  </p>
			  	    	   	  	  <p><a href="#">hongjinjinrong.com</a></p>
			  	    	   	  </li>
			  	    	   </ul>
			  	    </div>
			  	    <!-- end left -->
			  	    <div class="zscf_aboutus_r fl clearfix">
			  	    	 <a href="#" class="fl ft_ewm"><img src="<%=path %>/images/ft_erweima.png" alt=""></a>
			  	    	 <ul class="fl clearfix">
			  	    	 	<li><a href="#">联系我们</a></li>
			  	    	 	<li><a href="#">我要融资</a></li>
			  	    	 	<li><a href="problem.html">帮助中心</a></li>
			  	    	 	<li><a href="#">友情链接</a></li>
			  	    	 	<li><a href="#">招贤纳士</a></li>
			  	    	 	<li><a href="#">收益计算器</a></li>
			  	    	 </ul>
			  	    </div>
			  	    <!-- end right -->
		
			  </div>
		</div>
		
		<div class="zscf_bottom_wper">
			<div class="zscf_bottom px1000 clearfix">
				  <p class="fl">© 2017 hongjinjinrong &nbsp;  &nbsp;&nbsp;   鸿金金融信息服务股份有限公司 &nbsp;&nbsp;&nbsp;</p>
				  <p class="fr">
				    <a href="#"><img src="<%=path %>/images/360.png" alt=""></a>
				    <a href="#"><img src="<%=path %>/images/kexin.png" alt=""></a>
				    <a href="#"><img src="<%=path %>/images/norton.png" alt=""></a>
				  </p>
			</div>
		</div>
	</body>
</html>