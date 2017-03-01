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
	  	     	  	  	   <li class="notic_curli"><a href="<%=path %>/client/problem3">充值与提现</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem4">投资与还款</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem5">注册与认证</a> </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	   <div class="hc_zjwt ">
	 	    	   	
	 	    	   	   <div class="hc_zjwt_one mt20" >
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">充值时开户不成功应该如何解决？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	根据汇付天下方面的反馈，开户不成功，通常有三种情况：<br />
							   （1）根据页面提示的报错信息,对自己填写的姓名、身份证号码、银行卡号码、手机号
							   （与银行卡预留手机号保持一致）进行校对,确认填写无误。<br />
							   （2）银行卡问题： 您输入的银行卡没有开通网上银行业务。<br />
							   （3）用户开户时填写的信息与银行已有用户的信息重复。<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">充值收费吗？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 暂不收取，鸿金金融将为客户垫付充值手续费，实现客户充值零费用。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">如何充值？鸿金金融支持信用卡充值吗？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 鸿金金融网是一个中立的交易平台，并不实际存放投资者和借款人的资金。您的资金被存放在汇付天下电子账户。<br />
								（1）登录账户，进入“我的账户”页面，点击充值按钮。<br />
								（2）输入充值金额。<br />
								（3）充值后，显示成功付款，等待5秒钟，页面成功跳转到鸿金金融网页面，充值成功。<br />
								（4）您可以通过“我的账户” -“资金记录”查看充值的金额及交易记录。<br />
								 鸿金金融暂不支持信用卡充值。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">提现失败是什么原因？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 （1）账户未绑定银行卡。<br />
								 （2）提现金额超过账户可用余额。<br />
						 		 （3）大额提现时输错开户行号。<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">提现收费吗？提现的额度有限制吗？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	普金资本充值未投标的资金，15天内提现收取本金的0.5%提现服务费，15天后提现免费。<br />
								另汇付天下支付平台会收取用户每笔2元的提现手续费。<br />
								普金资本对于客户的充值没有金额和次数限制，但客户在充值时的单笔限额取决于充值银行。<br />
								最低的提现金额必须要在100元或以上，最高的提现金额为个人账户内可用余额。<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	    <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">提现需要多久到账？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	实时提现，1个工作日到账。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">提现需要注意哪些问题？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	（1）进入我的账户-我的银行卡，绑定银行卡，提现金额将汇入此银行卡<br />
								（2）确保绑定的银行卡的开户人姓名和身份证号与平台实名登记信息保持一致<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->

	 	    	   </div>
	  	     	  	     
	  	     	  </div>
	  	     </div>
	  </div>
</div>
<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
</html>