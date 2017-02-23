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
	  	     	  	  	   <li class="notic_curli"><a href="<%=path %>/client/problem">操作流程</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem2">账户与安全</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem3">充值与提现</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem4">投资与还款</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem5">注册与认证</a> </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	   <div class="hc_zjwt ">
	 	    	   	
	 	    	   	   <div class="hc_zjwt_one mt20" >
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">充值流程</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	先登录账户，可自由选择多个入口进行充值，登录后在首页上方点击“充值”→快速进入充值界面；或者登录后在首页直接点击“我的账户”，也可直接进入充值界面。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">提现操作</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	1、登录个人账户，进入“我的账户”，点击“提现”。<br/>
	 	    	   	   	    	2、确认提现银行帐号、用户真实姓名、等信息。<br/>
								3、输入提现金额和交易密码。<br/>
								4、点击“获取验证码”按钮获取手机验证码，并在获取后输入手机验证码。<br/>
								5、确认所有信息无误后，点击“立即提现”，完成提现。<br/>
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">银行卡绑定</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 1、登录个人账户，进入“我的账户”，点击“我的银行卡”→“添加银行卡”；进入界面<br/>
	 	    	   	   	    	 2、确认用户真实姓名；<br/>
								 3、选择所属银行及银行卡所属地；<br/>
								 4、填写银行卡号汇付交易密码；<br/>
								 5、确认所有信息无误后，点击“确定”，完成银行卡绑定；<br/>
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">账户安全设置</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 1、登录个人账户，进入“我的账户”，左下角点击“安全设置”；<br/>
	 	    	   	   	    	 2、根据提示完善邮箱绑定、身份认证、及交易密码设置。<br/>
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">忘记密码后找回</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 在登录页面选择“忘记密码”进行重置，通过用户已经绑定的手机号码进行找回。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   </div>
	  	     	  	     
	  	     	  </div>
	  	     </div>
	  </div>
</div>
<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
</html>