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
<link rel="icon" href="<%=path %>/images/logo.jpg" type="image/x-icon"/> 
	<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/service.css"/>
<script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.fixed.1.5.1.js"></script>
<meta charset="utf-8">
<title></title>
<style type="text/css">
body { font:13px/1.5 "Microsoft Yahei" }
a{ color:yellow;text-decoration:none;}
a:hover { text-decoration:none; color:red;}
.clearfix:after {visibility:hidden;display:block;font-size:0;content:" ";clear:both;height:0;}
.clearfix{*zoom:1;}

.demo { width:960px; margin:0 auto; padding:100px 50px 0; background-color:#f2f2f2; }
.qhd-desc h2 { margin-bottom:0.8em; }
.qhd-desc h3 { margin-bottom:0.6em; }
.qhd-desc p { margin-bottom:0.5em; }
.demo-copyright { margin-top:100px; text-align:center; }
</style>
<script language="javascript">
//must window loading,don't use the document loading
$(window).load(function(){
	
	//悬浮客服
	$("#fixedBox2").fix({
		position 		: "left",	//悬浮位置 - left或right
		horizontal  	: 0,		//水平方向的位置 - 默认为数字
		vertical    	: null,		//垂直方向的位置 - 默认为null
		halfTop     	: false,	//是否垂直居中位置
		minStatue 		: false,	//是否最小化
		hideCloseBtn 	: false,	//是否隐藏关闭按钮
		skin 			: "gray",	//皮肤
		showBtnWidth 	: 28,       //show_btn_width
		contentBoxWidth : 154, 		//side_content_width
		durationTime 	: 600		//完成时间
	});
	
	//悬浮客服
	$("#fixedBox").fix({
		position 		: "right",	//悬浮位置 - left或right
		horizontal  	: 0,		//水平方向的位置 - 默认为数字
		vertical    	: 100,      //垂直方向的位置 - 默认为null
		halfTop     	: true,	    //是否垂直居中位置
		minStatue 		: false,	//是否最小化
		hideCloseBtn 	: false,	//是否隐藏关闭按钮
		skin 			: "blue",	//皮肤
		showBtnWidth 	: 28,       //show_btn_width
		contentBoxWidth : 154, 		//side_content_width
		durationTime 	: 1000		//完成时间
	});
	
});
</script>
<style>
/* #menu li {
	position: relative;
} */
#menu a {
	float: left;
	padding: 12px 30px;
	/* color: #999; */
	text-transform: uppercase;
/* 	font: bold 12px Arial, Helvetica; */
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}
#menu li:hover > a {
	/* color: #fafafa; */
}
*html #menu li a:hover {
	/* color: #fafafa; */
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
	/* float: none; */
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
<div class="fixed_box" id="fixedBox">
    <div class="content_box">
        <div class="content_inner">
        	<div class="close_btn"><a title="关闭"><span>关闭</span></a></div>
            <div class="content_title"><span>客服中心</span></div>
            <div class="content_list">            	
                <div class="qqserver">
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1223348320&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:1223348320:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>东哥</span>
                    	</a>
                    </p>
                     <p>                              
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1274603021&amp;site=qq&amp;menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:1274603021:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>乐哥</span>
                    	</a>
                    </p>
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=956450236&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:956450236:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>发哥</span>
                    	</a>
                    </p>       
                    <p>                        
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2353432835&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:2353432835:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>灰灰</span>
                    	</a>
                    </p>
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=844661789&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:844661789:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>豪哥</span>
                    	</a>
                    </p>
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1023950987&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:1023950987:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>阿耀</span>
                    	</a>
                    </p>
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=599646324&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:599646324:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>骚根</span>
                    	</a>
                    </p>
                  
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1298762198&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:1298762198:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>吴鹏</span>
                    	</a>
                    </p>
                    <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1733091639&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:1733091639:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>傑哥</span>
                    	</a>
                    </p>
                     <p>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2547124083&site=qq&menu=yes">
                          <img border="0" src="http://wpa.qq.com/pa?p=2:2547124083:41" alt="点击这里给我发消息" title="点击这里给我发消息">
                          <span>惠如</span>
                    	</a>
                    </p>
                     <p>
                    <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=43d842e0b7e25be0fc911c5e86365dd107d12bb2ced595e4371a7943b9341279"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="人多人少气势不倒" title="人多人少气势不倒"></a>            
              		</p>
                </div>               
                <hr>
                <div class="phoneserver">
                    <h5>客户服务热线</h5>
                    <p>请直接QQ联系！</p>
                </div>
                <hr>
                <div class="msgserver">
                    <p><a href="<%=path %>/customer/message">给我们留言</a></p>
                </div>
            </div>
            <div class="content_bottom"></div>
        </div>
    </div>
    <div class="show_btn"><span>展开客服</span></div>
</div>
<!-- header start -->
<div class="zxcf_top_wper">
	<div class="zxcf_top px1000 clearfix">
		 <div class="zxcf_top_l fl">
		    <img src="<%=path %>/images/zxcf_phone.png" alt="">
		    400-027-0101(工作时间9:00-17:30)
		    <a href="#"><img src="<%=path %>/images/zxcf_weixin.png" alt=""></a>
		    <a href="#"><img src="<%=path %>/images/zxcf_sina.png" alt=""></a>
		    
		    
		    <!-- 分享到QQ空间 -->
		    <a href="javascript:void(0);" onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent(document.location.href));return false;" title="分享到QQ空间" id="k_qqshare"><img src="<%=path %>/images/zxcf_qq.png" alt=""></a>
		 </div>
		 <div class="zxcf_top_r fr">
		 	<c:if test="${customer.uid == null}">
			 	<a href="<%=path %>/client/login" class="curspan">立即登录</a>
			 	<span>|</span>
			 	<a href="<%=path %>/client/register">免费注册</a>
		 	</c:if>
		 	<c:if test="${customer.uid != null}">
			 	<span>欢迎</span>
			 	<a href="<%=path %>/client/left?uid=${customer.uid}">${customer.username}</a>
			 	<span>|</span>
		 		<a href="javascript:void(0)">注销</a>
		 	</c:if>
		 	<span>|</span>
		 	<a href="<%=path%>/client/recharge">充值</a>
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
		 	<ul id="menu" style="display:none;">
		 		<li>
		 			<a  onclick="MyAccount()">
		 			<img src="<%=path %>/images/zxcf_perinfo.png">
				 	<span>我的账户</span>
				 	</a>
				</li>
		 	</ul>
		 </div>
	</div>
</div>
<div class="zxcf_menu_wper" >
	<div class="zxcf_menu px1000" style="margin-left: 21.5%;">
		  <a href="<%=path %>/client/index" class="zm_cura">首页</a>
		  <a href="<%=path %>/client/invest">我要投资</a>
		  <a href="<%=path %>/client/borrow">我要借款</a>
		  <a href="#">实时财务</a>
		  <a href="<%=path %>/client/noticelist">新手指引</a>
		  <a href="<%=path %>/client/AboutUs" style="margin-right:0;">关于我们</a>
	</div>
</div>
<script>
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
	
	function MyAccount(){
		var uid=${customer.uid};
		window.location.href='<%=path %>/client/left?uid='+uid; 
	}
</script>

</body>
</html>