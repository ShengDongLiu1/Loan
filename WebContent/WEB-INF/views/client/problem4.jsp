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
	  	     	  	  	   <li class="notic_curli"><a href="<%=path %>/client/problem4">投资与还款</a> </li>
	  	     	  	  	   <li><a href="<%=path %>/client/problem5">注册与认证</a> </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	   <div class="hc_zjwt ">
	 	    	   	
	 	    	   	   <div class="hc_zjwt_one mt20" >
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">等额本息的还款方式有哪些优点？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 等额本息是业内普遍采用的还款方式，具有如下优点：<br />
								（1）有助于减轻借款人阶段性还款压力，降低借款人违约风险；<br />
								（2）每月都有收益和本金回款，大幅提升出借人资金流动性；<br />
								（3）借款人需按月持续还款，若其经济情况恶化，则会从当期逾期得到体现，还款风险立即暴露，我方可及时采取措施挽回损失。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">借款项目出现逾期或坏账怎么处理？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	担保公司为本合同项下借款的本金以及利息提供不可撤销的连带保证。如借款期限届满之日
								借款企业不能偿还投资人本金及利息，担保公司将于债权届满七个工作日内按照本合同约定
								向投资人偿付借款的本金和利息。如在借款期限内借款企业不能按照约定向投资人支付利息，
								则担保公司将于借款企业违约后七个工作日内按照约定向借款人支付利息。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">鸿金金融目前的还款方式有哪些？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 还款方式根据项目种类不同，现分为如下三种：<br />
								 1、等额本息还款：在还款期内，每月偿还同等数额的本金和利息。<br />
								 2、先息后本：每月还利息，到期后一次性还本金。<br />
								 3、一次还本付息：到期后一次性归还本金和利息。<br />
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">投资成功后什么时候开始计息？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	满标审核后开始计息。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	    <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">投资成功后是否可以撤销？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	所有项目在购买成功后均不可以撤销。
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">投资资金有限制吗？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 鸿金金融目前在售项目投资起点金额为100元，上限不超过项目借款总金额。
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