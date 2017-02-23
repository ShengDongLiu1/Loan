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
	  	     	  	  	   <li><a href="<%=path %>/client/problem">操作流程</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem2">账户与安全</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem3">充值与提现</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem4">投资与还款</a> </li>
	  	     	  	  	   <li class="notic_curli"><a href="<%=path %>/client/problem5">注册与认证</a> </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	   <div class="hc_zjwt ">
	 	    	   	
	 	    	   	   <div class="hc_zjwt_one mt20" >
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">为什么实名认证通不能通过？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	以下三种情况可能会导致实名认证无法通过：<br />
							   （1）军人身份；<br />
							   （2）港澳台同胞以及国外户口；<br />
							   （3）户口办理过迁移没有落户成功或落户时信息未做变更，无法通过审核。<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">为什么要进行实名登记？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	为了提高账户安全等级，保障资金的安全性和合同的有效性，客户需在首次充值前完成实名
								登记，鸿金金融承诺会对所有客户资料严格保密。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">一个手机号可以注册几个账号？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	手机号、邮箱和客户的身份信息都具有唯一性，故一个手机号只能注册绑定一个账户。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">注册成功后用户名可以修改吗？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	鸿金金融平台用户名注册成功后不可以修改，建议您注册时不要使用真实姓名作为用户名。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">注册时手机收不到验证码怎么办？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 （1）确认短信是否被手机软件拦截或过滤
								 （2）确认手机是否能正常接收短信（信号问题、欠费、停机等）
								 （3）短信收发过程中可能会有延时，请耐心等候
								 （4）若仍然收不到验证码，请联系客服。
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