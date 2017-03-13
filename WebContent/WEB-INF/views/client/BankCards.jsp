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
							<li class="active"><a href="<%=path %>/client/left">账户总览</a></li>
						</c:when>
					</c:choose>
					<li><a href="<%=path%>/client/recharge">充值</a></li>
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
		<a href="javascript:void(0);" class="active">我的银行卡</a>
	</div>
	<em></em>
</div>
<div id="myDebitCard" class="account-content">
	
<div id="myDebitCard" class="account-content">
		<c:forEach var="list" items="${bankList}">
			<div id="card1" class="bank-card_1" style="margin-top: 10px;">
				<div class="bank-top">
					<div id="baccount" class="bank-cardTitle">
					
					
					<c:choose>
					<c:when test="${list.baccount == 'ICBC'}">
						中国工商银行
					</c:when>
					<c:when test="${list.baccount == 'ABC'}">
						中国农业银行
					</c:when>
						<c:when test="${list.baccount == 'CMB'}">
						招商银行
					</c:when>
					<c:when test="${list.baccount == 'CCB'}">
						中国建设银行
					</c:when>
					<c:when test="${list.baccount == 'BJRCB'}">
						北京农村商业银行
					</c:when>
					<c:when test="${list.baccount == 'BOC'}">
						中国银行
					</c:when>
					<c:when test="${list.baccount == 'BOCOM'}">
						交通银行
					</c:when>
					<c:when test="${list.baccount == 'CEB'}">
						中国光大银行
					</c:when>
					<c:when test="${list.baccount == 'SDB'}">
						深圳发展银行
					</c:when>
					<c:when test="${list.baccount == 'SPDB'}">
						浦东发展银行
					</c:when>
					<c:when test="${list.baccount == 'BCCB'}">
						北京银行
					</c:when>
					<c:when test="${list.baccount == 'BOS'}">
						上海银行
					</c:when>
					<c:when test="${list.baccount == 'CBHB'}">
						渤海银行
					</c:when>
					<c:when test="${list.baccount == 'CIB'}">
						兴业银行
					</c:when>
					<c:when test="${list.baccount == 'CMBC'}">
						中国民生银行
					</c:when>
					<c:when test="${list.baccount == 'CZB'}">
						浙商银行
					</c:when>
					<c:when test="${list.baccount == 'GDB'}">
						广发银行
					</c:when>
					<c:when test="${list.baccount == 'HXB'}">
						华夏银行
					</c:when>
					<c:when test="${list.baccount == 'HZCB'}">
						杭州银行
					</c:when>
					<c:when test="${list.baccount == 'MINTAI'}">
						浙江民泰商业银行
					</c:when>
					<c:when test="${list.baccount == 'NJCB'}">
						南京银行
					</c:when>
					<c:when test="${list.baccount == 'PINGAN'}">
						平安银行
					</c:when>
					<c:when test="${list.baccount == 'PSBC'}">
						中国邮政储蓄银行
					</c:when>
					<c:when test="${list.baccount == 'SRCB'}">
						上海农村商业银行
					</c:when>
					<c:when test="${list.baccount == 'ZJTLCB'}">
						浙江泰隆商业银行
					</c:when>
					<c:when test="${list.baccount == 'CITIC'}">
						中信银行
					</c:when>
					</c:choose>

					</div>
					<div class="bank-cardType">储蓄卡</div>
				</div>
				<div class="bank-center">
					<div id="bcardnumber" class="bank-cardNumber">${list.bcardnumber}</div>
					<div id="username" class="bank-userName">${customer.username}</div>
				</div>
			</div>
		</c:forEach>
		
		<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer; margin-top: 10px;">
			<div class="bank-addCard"><a href="javascript:;">添加银行卡</a></div>
		</div>
	</div></div>
		<!-- end -->
	</div>
		<em></em>
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
	
		<!-- end -->
	<!--[if lt IE 9]>
	    <script src="src/libs/json2.js"></script>
	<![endif]-->
	<script type="text/javascript">
	//添加银行卡
	function addCard(){
		window.location.href="<%=path%>/banktion/addCard";
	}
	</script>
</body>
</html>