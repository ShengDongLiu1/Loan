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
	  	     	  	  	   <li class="notic_curli">注册与登录 </li>
	  	     	  	  	   <li>账户与安全 </li>
	  	     	  	  	   <li>充值与提现 </li>
	  	     	  	  	   <li>投资与还款 </li>
	  	     	  	  	   <li>充值与提现 </li>

	  	     	  	  </ul>
	  	     	  </div>
	  	     	  <!-- end l -->
	  	     	  <div class="notic_sec_r fl">
	  	     	  	   <h2 class="notic_secr_tit">常见问题</h2>

	  	     	  	   <div class="hc_zjwt ">
	 	    	   	
	 	    	   	   <div class="hc_zjwt_one mt20" >
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	    <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	    <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
	 	    	   	   	    </div>
	 	    	   	   </div>
	 	    	   	   <!-- end proone -->
	 	    	   	   <div class="hc_zjwt_one mt20">
	 	    	   	   	    <h3 class="hc_zjwt_onebg01">如何充值？</h3>
	 	    	   	   	    <div class="hc_answer" style="display: none;">
	 	    	   	   	    	 asdf sdf asdf asdf asdf asdf asdf asdf sad
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