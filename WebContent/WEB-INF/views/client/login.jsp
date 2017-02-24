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
<link rel="icon" href="<%=path %>/images/logo.jpg" type="image/x-icon"/>  
  <title>鸿金金融</title> 
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<!-- <link rel="stylesheet/less" type="text/css" href="css/style.less" /> -->
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
<script type="text/javascript" src="<%=path %>/js/customer/login.js"></script>
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
		 		<img src="<%=path %>/images/lg_pic01.png" alt=""> 
		 	<span>
		    <a href="<%=path %>/client/index">返回首页</a></span> 
		 	
		 </div>
	</div>
</div>
<!-- end  -->
<div class="login_con_wper">
	  <div class="login_con px1000 ">
	  	   <div class="lg_section clearfix">
	  	   	     <div class="lg_section_l fl">
	  	   	     	<img src="<%=path %>/images/lg_bg02.png"> 
	  	   	     </div>
	  	   	     <!-- end l -->
	  	   	     <div class="lg_section_r fl">
	  	   	     	   <h2 class="lg_sec_tit clearfix">
	  	   	     	      <span class="fl">登录</span>
	  	   	     	       <em class="fr">没有帐号，<a href="<%=path %>/client/register">立即注册</a></em> 
	  	   	     	   </h2>
	  	   	     	   <form>
	  	   	     	   	    <fieldset>
	  	   	     	   	    	  <p class="mt20">
	  	   	     	   	    	  	 <input type="text" name="username" id="username" placeholder="用户名/手机" class="lg_input01 lg_input" onfocus="clearErro();">
	  	   	     	   	    	  </p>
                                  <p class="mt20">
	  	   	     	   	    	  	 <input type="password" name="userpwd" id="userpwd" placeholder="密码" class="lg_input02 lg_input" onfocus="clearErro();">
	  	   	     	   	    	  </p>
                                 <p class="clearfix lg_check">
                                 <span class="fl">
                                 	<input type="checkbox">记住用户名
                                 </span>
                                 <a href="#" class="fr">忘记密码？</a><br />
                                 	<span id="erro"></span>
                                 </p>
                                 <p><a href="javascript:void(0)" class="lg_btn" onclick="checkLogin();">立即登录</a></p>
	  	   	     	   	    </fieldset>
	  	   	     	   </form>
	  	   	     </div>
	  	   </div>
	  </div>
</div>
<!-- footer start -->
<div class="zscf_aboutus_wper">
	  <div class="zscf_aboutus px1000 clearfix">
	  	    <div class="zscf_aboutus_l fl">
	  	    	   <ul class="zscf_aboutus_lul clearfix">
	  	    	   	  <li class="pt10"><a href="#"><img src="<%=path %>/images/app.png" alt=""></a>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  <p class="pb20">服务热线</p>
	  	    	   	  <strong>400-027-0101</strong>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  	  <p class="pb10 linkpic">
	  	    	   	  	     <a href="#"><img src="<%=path %>/images/ft_sina.png" alt=""></a>
	  	    	   	  	     <a href="#"><img src="<%=path %>/images/ft_weixin.png" alt=""></a>
	  	    	   	  	     <a href="#"><img src="<%=path %>/images/ft_erji.png" alt=""></a>
	  	    	   	  	  </p>
	  	    	   	  	  <p><a href="#">kefu@zhongxincaifu.com</a></p>
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
		  <p class="fl">© 2014 zhongxincaifu &nbsp;  &nbsp;&nbsp;   中兴财富金融信息服务股份有限公司 &nbsp;&nbsp;&nbsp;    来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
		  <p class="fr">
		    <a href="#"><img src="<%=path %>/images/360.png" alt=""></a>
		    <a href="#"><img src="<%=path %>/images/kexin.png" alt=""></a>
		    <a href="#"><img src="<%=path %>/images/norton.png" alt=""></a>
		  </p>
	</div>
</div>
<!-- footer end -->
</body>
</html>