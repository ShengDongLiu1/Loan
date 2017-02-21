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
	<title>borrow</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
</head>
<body>
<jsp:include flush="true" page="top.jsp"></jsp:include>
<!-- end  -->
<div class="bor_banner01">
	 
</div>
<!-- end banner -->
<div class="bor_con_wper">
	  <div class="bor_con px1000">
	  	    <div class="bor_detail">
	  	    	   <h2 class="bor_detail_tit">
	  	    	   	  <span class="bor_decurspan">房产抵押</span>
	  	    	   	  <span>车辆抵押</span>
	  	    	   	  <span>信用贷款</span>
	  	    	   	  <span>零首付车贷</span>
	  	    	   </h2>
	  	    	   <div class="bor_detail_box">
	  	    	   	    <div class="bor_det_one clearfix pt30 pb30">
	  	    	   	    	  <div class="bor_det_onel fl">
	  	    	   	    	  	       <p class="bor_p1">中兴财富平台的借款功能旨在帮助借款用户以
										低成本获得借款。用户在需要资金时，可以将
										自有房产和车产作为抵押物，小油菜线下审核
										通过后，根据抵押物的价值融资。</p>
										<p class="bor_p2">中兴财富平台的借款功能旨在帮助借款用户以
										低成本获得借款。用户在需要资金时，可以将
										自有房产和车产作为抵押物，小油菜线下审核
										通过后，根据抵押物的价值融资。</p>
										<h3 class="bor_onel_tit"><span>申请条件</span></h3>
										<ul class="bor_onel_ul">
											 <li><img src="<%=path %>/images/bor_pic01.png" alt="">年满18周岁以上的公民
											 </li>
											 <li><img src="<%=path %>/images/bor_pic02.png" alt="">需要北京房产或车产抵押
											 </li>
											 <li><img src="<%=path %>/images/bor_pic03.png" alt="">个人或企业银行征信记录良好
											 </li>
											 <li><img src="<%=path %>/images/bor_pic04.png" alt="">
											  无现有诉讼记录
											 </li>
											 
										</ul>
										<h3 class="bor_onel_tit"><span>提交资料</span></h3>
										<ul class="bor_onel_ul">
											 <li>&nbsp;<img src="<%=path %>/images/bor_pic05.png" alt="">省份证
											 </li>
											 <li><img src="<%=path %>/images/bor_pic06.png" alt="">申请资料
											 </li>
											 <li><img src="<%=path %>/images/bor_pic07.png" alt="">其他
											 </li>
											
											 
										</ul>
	  	    	   	    	  </div>  
	  	    	   	    	  <!-- end l -->
	  	    	   	    	  <div class="bor_det_oner fl">
	  	    	   	    	  	     <form>
	  	    	   	    	  	     	  <fieldset>
	  	    	   	    	  	     	  	   <div>
	  	    	   	    	  	     	  	   	   <label>申请人</label>
	  	    	   	    	  	     	  	   	   <input type="" >
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*借款金额</label>
	  	    	   	    	  	     	  	   	   <input type="" class="bor_inputbg01">
	  	    	   	    	  	     	  	   </div>
                                               <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*借款期限</label>
	  	    	   	    	  	     	  	   	   <input type="" class="bor_inputbg02">
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*手机号码</label>
	  	    	   	    	  	     	  	   	   <input type="" >
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15 guarmethod clearfix">
	  	    	   	    	  	     	  	   	   <label class="guarmethod_l fl">*担保方式</label>
	  	    	   	    	  	     	  	   	   <div class="fl">
	  	    	   	    	  	     	  	   	   	  <span>房屋数量</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg03 input2"><br><br>
	  	    	   	    	  	     	  	   	   	  <span>总价值</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg04 input2"><br>
	  	    	   	    	  	     	  	   	   </div>
	  	    	   	    	  	     	  	   	   
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*借款用途</label>
	  	    	   	    	  	     	  	   	   <select>
	  	    	   	    	  	     	  	   	   	  <option>选择借款类别</option>
	  	    	   	    	  	     	  	   	   	  <option>1</option>
	  	    	   	    	  	     	  	   	   </select>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	    <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*借款描述</label> 
	  	    	   	    	  	     	  	   	   <textarea></textarea>
	  	    	   	    	  	     	  	   	 
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*借款情况</label>
	  	    	   	    	  	     	  	   	   <input type="radio" class="input3">
	  	    	   	    	  	     	  	   	   普通借款
	  	    	   	    	  	     	  	  	   <input type="radio" class="input3">
	  	    	   	    	  	     	  	   	   紧急借款 
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15" >
	  	    	   	    	  	     	  	   	   <label>*验证码</label>
	  	    	   	    	  	     	  	   	   <input type="text" class="yanzheng" >
	  	    	   	    	  	     	  	   	   
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt30">
	  	    	   	    	  	     	  	   	   <label></label>
	  	    	   	    	  	     	  	   	   <a href="#" class="bor_btn">提交材料</a>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  </fieldset>
	  	    	   	    	  	     </form>
	  	    	   	    	  </div>
	  	    	   	    </div>
	  	    	   	    <!-- end 房产抵押 -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	  2  
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	 3
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	 4
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   </div>
	  	    </div>
	  </div>
</div>
</body>
</html>