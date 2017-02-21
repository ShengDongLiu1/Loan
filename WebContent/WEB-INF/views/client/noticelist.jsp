<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>公告列表</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
</head>
<body>
<jsp:include flush="true" page="top.jsp"></jsp:include>
<!-- end  -->
<div class="notic_con_wper">
	  <div class="notic_con px1000">
	  	     <div class="notic_ban">
	  	     	 <img src="<%=path %>/images/notic_ban01.png" alt="">
	  	     </div>
	  	     <div class="notic_section clearfix">
	  	     	  <div class="notic_sec_l fl">
	  	     	  	  <h3><img src="<%=path %>/images/notic_pic01.png" alt=""></h3>
	  	     	  	  <ul class="notic_secl_ul">
	  	     	  	  	   <li class="notic_curli">注册与登录 </li>
	  	     	  	  	   <li>账户与安全 </li>
	  	     	  	  	   <li>充值与提现 </li>
	  	     	  	  	   <li>投资与还款 </li>
	  	     	  	  	   <li>充值与提现 </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	    <h2 class="notic_secr_tit">网站公告</h2>
	  	     	  	    <ul class="notic_secr_ul">
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    	<li class="clearfix"><a href="<%=path %>/clinet/article">注册送红包</a><span>2015-07-23 09:21:12</span></li>
	  	     	  	    </ul>
	  	     	  	    <p class="notic_pagelink">
	  	     	  	    	 <a href="#" class="notic_acur">1</a>
	  	     	  	    	 <a href="#">2</a>
	  	     	  	    	 <a href="#">3</a>
	  	     	  	    	 <a href="#">4</a>
	  	     	  	    	 <a href="#">下一页</a>
	  	     	  	    	 <a href="#">尾页</a>
	  	     	  	    </p>
	  	     	  </div>
	  	     </div>
	  </div>
</div>
<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
</html>