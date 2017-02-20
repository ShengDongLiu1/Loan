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
<!-- <link rel="stylesheet/less" type="text/css" href="css/style.less" /> -->
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
<!--[if IE 6]> 
<script src="./js/iepng.js" type="text/javascript"></script> 
<script type="text/javascript">
   EvPNG.fix('div, ul, img, li, input,span, p');
</script>
<![endif]-->
</head>
<body>
<!-- header start -->
<div class="zxcf_top_wper">
	<div class="zxcf_top px1000 clearfix">
		 <div class="zxcf_top_l fl">
		    <img src="<%=path %>/images/zxcf_phone.png" alt="">
		    400-027-0101(工作时间9:00-17:30)
		    <a href="#"><img src="<%=path %>/images/zxcf_weixin.png" alt=""></a>
		    <a href="#"><img src="<%=path %>/images/zxcf_sina.png" alt=""></a>
		    <a href="#"><img src="<%=path %>/images/zxcf_qq.png" alt=""></a>
		 </div>
		 <div class="zxcf_top_r fr">
		 	<a href="<%=path %>/client/login" class="curspan">立即登录</a>
		 	<span>|</span>
		 	<a href="<%=path %>/client/register">免费注册</a>
		 	<span>|</span>
		 	<a href="<%=path %>/client/problem">常见问题</a>
		 </div>
	</div>
</div>
<!-- end top -->
<div class="zxcf_nav_wper">
	<div class="zxcf_nav clearfix px1000">
		 <div class="zxcf_nav_l fl"><img src="<%=path %>/images/zxcf_logo.png" alt=""></div>
		 <div class="zxcf_nav_r fr">
		 	<img src="<%=path %>/images/zxcf_perinfo.png" alt="">
		 	<span>我的账户
		 	<img src="<%=path %>/images/zxcf_icon01.png" alt=""></span>
		 	<ul class="zxcf_perinfo" style="display:none;">
		 		<li><a href="#">111</a></li>
		 		<li><a href="#">111</a></li>
		 		<li><a href="#">111</a></li>
		 	</ul>
		 </div>
	</div>
</div>
<div class="zxcf_menu_wper">
	<div class="zxcf_menu px1000">
		  <a href="<%=path %>/client/index" class="zm_cura">首页</a>
		  <a href="<%=path %>/client/invest">我要投资</a>
		  <a href="<%=path %>/client/borrow">我要借款</a>
		  <a href="#">实时财务</a>
		  <a href="<%=path %>/client/noticelist">新手指引</a>
		  <a href="#" style="margin-right:0;">关于我们</a>
	</div>
</div>
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
<script type="text/javascript">
	
</script>
</body>
</html>