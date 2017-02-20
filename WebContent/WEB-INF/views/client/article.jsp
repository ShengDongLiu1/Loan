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
		  <a href="<%=path %>/client/noticelist.html">新手指引</a>
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
	  	     	  	     <div class="helpconright">
        	   	     <h3>互联网金融两年后或上演“马太效益”</h3>
        	   	     <h6>来源：证券日报    2014-04-02  星期三</h6>
        	   	     <h4>中商创始人表示，这个行业不应只是前来前往</h4>
        	   	     <h5 class="helpconrp1"><img src="<%=path %>/images/h03.jpg"> <span>本报记者</span> 鬼小孙</h5>
        	   	     <p>那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。</p>
        	   	     <p>那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。</p>
        	   	     <div class="helpconimg of"><img src="<%=path %>/images/h04.jpg">
        	   	          <img src="<%=path %>/images/h05.jpg">
        	   	          <img src="<%=path %>/images/h06.jpg">
        	   	     </div>
        	   	     <p>那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。</p>
        	   	     <p>那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。</p>
        	   	     <p>那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。</p>
        	   	     <p>那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。那些行业的项目能在2014年持续受到投资人的钟爱呢？互联王金融是个热门的备选答案。</p>
        	  
	   	     	  </div>
	  	     	  </div>
	  	     </div>
	  </div>
</div>
</body>
</html>