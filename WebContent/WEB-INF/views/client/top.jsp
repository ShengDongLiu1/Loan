<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
<meta charset="utf-8">
<title></title>
<style>
#menu li {
	position: relative;
}
#menu a {
	float: left;
	padding: 12px 30px;
	color: #999;
	text-transform: uppercase;
	font: bold 12px Arial, Helvetica;
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}
#menu li:hover > a {
	color: #fafafa;
}
*html #menu li a:hover {
	color: #fafafa;
}
#menu ul {
	margin: 20px 0 0 0;
	_margin: 0;
	opacity: 0;
	visibility: hidden;
	position: absolute;
	top: 38px;
	left: 0;
	z-index: 1;
	background: #444;
	background: -moz-linear-gradient(#444, #111);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#444), to(#111));
	background: -webkit-linear-gradient(#444, #111);
	background: -o-linear-gradient(#444, #111);
	background: -ms-linear-gradient(#444, #111);
	background: linear-gradient(#444, #111);
	-moz-box-shadow: 0 -1px rgba(255,255,255,.3);
	-webkit-box-shadow: 0 -1px 0 rgba(255,255,255,.3);
	box-shadow: 0 -1px 0 rgba(255,255,255,.3);
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-webkit-transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-ms-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
	transition: all .2s ease-in-out;
}
#menu li:hover > ul {
	opacity: 1;
	visibility: visible;
	margin: 0;
}
#menu ul a {
	padding: 15px;
	width: 90px;
	_height: 10px;
	display: block;
	white-space: nowrap;
	float: none;
	text-transform: none;
}
@media screen and (min-width: 600px) {
	#menu {
		display: block !important;
	}
}
</style>
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
		 	<c:if test="${customer.uid == null}">
			 	<a href="<%=path %>/client/login" class="curspan">立即登录</a>
			 	<span>|</span>
			 	<a href="<%=path %>/client/register">免费注册</a>
		 	</c:if>
		 	<c:if test="${customer.uid != null}">
			 	<span>欢迎</span>
			 	<a href="javascript:void(0)">${customer.username}</a>
			 	<span>|</span>
		 		<a href="javascript:void(0)">注销</a>
		 	</c:if>
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
		 	<%-- <img src="<%=path %>/images/zxcf_perinfo.png" alt="">
		 	<span>我的账户
		 	<img src="<%=path %>/images/zxcf_icon01.png" alt=""></span> --%>
		 	<ul id="menu" style="display:none;">
		 		<li><img src="<%=path %>/images/zxcf_perinfo.png" alt="">
				 	<span>我的账户
				 	<img src="<%=path %>/images/zxcf_icon01.png" alt=""></span>
					<ul style="text-align: center;">
						<li> <a href="">我的资料</a></li>
						<li> <a href="">修改密码</a></li>
						<li> <a href="">页面锁屏</a></li>
						<li> <a href="">退出账户</a></li>
					</ul>
				</li>
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
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script><script>
$(function() {
	if ($.browser.msie && $.browser.version.substr(0,1) < 7){
	$('li').has('ul').mouseover(function(){
		$(this).children('ul').css('visibility','visible');
		}).mouseout(function(){
		$(this).children('ul').css('visibility','hidden');
		});
	}

	/* Mobile */
	$('#menu-wrap').prepend('<div id="menu-trigger">Menu</div>');
	$("#menu-trigger").on('click', function(){
		$("#menu").slideToggle();
	});

	// iPad
	var isiPad = navigator.userAgent.match(/iPad/i) != null;
	if (isiPad) $('#menu ul').addClass('no-transition');
});
</script>


</body>
</html>