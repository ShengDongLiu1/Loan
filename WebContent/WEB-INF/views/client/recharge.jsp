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
  <title>鸿金金融</title> 
<link rel="stylesheet" href="/Loan/css/pjcss/public.css">
<link rel="stylesheet" href="/Loan/css/pjcss/account.css">
<link rel="stylesheet" href="/Loan/css/pjcss/datepicker.css">

</head>
<body bgcolor="#FFFFCC">
	<jsp:include flush="true" page="top.jsp"></jsp:include>
		<div class="account cl">
			<div class="account-left">
			<div class="account-left-nav">
				<div class="navbar icon icon-account">我的账户</div>
				<ul class="sub-nav">
					<c:choose>
						<c:when test="${customer.uid == null}">
							<li><a href="<%=path %>/client/login">账户总览</a></li>
						</c:when>
						<c:when test="${customer.uid != null}">
							<li><a href="<%=path %>/client/left">账户总览</a></li>
						</c:when>
					</c:choose>
					<li class="active"><a href="<%=path%>/client/recharge">充值</a></li>
					<li><a href="<%=path%>/client/funds">提现</a></li>
					<li><a href="<%=path%>/client/MoneyRecord?page=1">资金记录</a></li>
				</ul>
				<div class="navbar icon icon-self">我的管理</div>
				<ul class="sub-nav">
					<c:choose>
						<c:when test="${customer.uid == null}">
							<li><a href="<%=path %>/client/login">投资管理</a></li>
						</c:when>
						<c:when test="${customer.uid != null}">
							<li><a href="<%=path%>/client/investment">投资管理</a></li>
						</c:when>
					</c:choose>
					<li><a href="<%=path%>/client/BorrowMoney">借款管理</a></li>
				</ul>
				<div class="navbar icon icon-settings">账户设置</div>
				<ul class="sub-nav">
					<c:choose>
						<c:when test="${customer.uid == null}">
							<li><a href="<%=path %>/client/login">我的银行卡</a></li>
						</c:when>
						<c:when test="${customer.uid != null}">
							<li><a href="<%=path%>/client/BankCard">我的银行卡</a></li>
						</c:when>
					</c:choose>
					<li><a href="<%=path%>/client/security">安全设置</a></li>
				</ul>
			</div>
		</div>
		<!-- begin -->
		<div class="account-right"><div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="active show-ipay">充值</a>
		<a href="javascript:void(0);" id="czjl">充值记录</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content">
	<!-- 充值 -->
	<div class="ipay-pay">
		<p class="tips-title"><b>温馨提示：</b>凡是在鸿金金融充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费 鸿金金融禁止信用卡套现、虚假交易
等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
		<div class="pay-from">
			<div class="label cl">
				<label>充值金额：</label><input type="text" id="ipay-amt" maxlength="18" placeholder="请输入充值金额"><p class="roll">元</p>
			</div>
			<div class="label cl">
				<label>充值类型：</label><img src="<%=path %>/image/huifu.png">
			</div>
			<button type="button" class="btn" id="ipay-submit">立即充值</button>
		</div>
		<div id="alipay"></div>
	</div>
	<!-- 充值记录 -->
	<div class="ipay-list">
		<div class="account-form cl">
			<input type="text" class="date icon icon-date" id="startDate">
			<p class="text">至</p>
			<input type="text" class="date icon icon-date" id="endDate">
			<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
			<button type="button" class="search" id="ipaySearch">搜索</button>
		</div>
		<div class="account-list">
			<ul class="ipay-list-box list-box">
				<li class="title">
					<div class="children0">账户名</div>
					<div class="children1">充值金额</div>
					<div class="children2">充值类型</div>
					<div class="children3">充值时间</div>
					<div class="children4">充值状态</div>
				</li>
			</ul>
			<ul class="ipay-list-box listData" id="n">
			
			</ul>
			<ul class="paging">
				
			</ul>
		</div>
	</div>
</div>
		</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
	<script type="text/javascript">
		$('#ipay-submit').click(function(){
			var money = $('#ipay-amt').val();
			$.post("<%=path%>/recharge/queryByBank",
	            function(data){
					if(data.result=="fail"){
					}else if(data.result=="seccuss"){
						window.location.href="<%=path%>/recharge/add?rmoney="+money; 
					}
				}
		   	)
		})
		$('#czjl').click(function(){
			window.location.href="<%=path%>/recharge/queryBy.do"; 
		})
		

	</script>
</body></html>