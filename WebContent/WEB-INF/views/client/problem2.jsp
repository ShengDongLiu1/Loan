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
	  	     	  	  	   <li class="notic_curli"><a href="<%=path %>/client/problem2">账户与安全</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem3">充值与提现</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem4">投资与还款</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem5">注册与认证</a> </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	   <div class="hc_zjwt ">
	 	    	   	
	 	    	   	   <div class="hc_zjwt_one mt20" >
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">本金和收益是否可以得到保障？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 鸿金金融推荐的产品中包含的借款项目，以及借款方连带担保责任，充分保障投资人本金及投资收益。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">如何保障我资金安全？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 1、数据安全： 三层防火墙隔离系统的访问层、应用层和数据层集群；有效的入侵防范及容灾备份，确保交易数据安全无虞；<br />
								 2、隐私安全： 鸿金金融在任何情况下都绝不会出售、出租或以任何其他形式泄漏您的信息。您的信息按照《鸿金金融投资咨询服务协议》中的规定被严格保护。<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">网上交易保障中心是什么？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	投资成功之后，也是由第三方支付公司汇付天下把钱打给借款人，
	 	    	   	   	    	资金从保管账户转入借款人账户后会在网上交易保障中心生成一份电子回单。
	 	    	   	   	    	这份电子回单类似于银行转账汇款单一样，有”电子签名“和“时间戳”，
	 	    	   	   	    	保障并确认资金的最终流向，让投资人对自己的每笔资金都能清楚了解在什么时间，
	 	    	   	   	    	转给了谁。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">隐私和资料安全如何保障？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 尊重用户个人隐私是本网站的一项基本原则，
	 	    	   	   	    	 普金资本郑重承诺在任何情况下都绝不会出售、
	 	    	   	   	    	 出租或以任何其他形式泄露您的信息。
	 	    	   	   	    	 同时，普金资本在数据加密及操作流程上对用户的隐私信息进行严密的保护。
	 	    	   	   	    	 普金资本是一个实名认证平台，用户在平台上交流的过程中，
	 	    	   	   	    	 也需要时刻注意保护个人隐私，截图注意覆盖个人信息，
	 	    	   	   	    	 不要随意透露真实姓名与住址等，以防信息被盗造成损失。
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