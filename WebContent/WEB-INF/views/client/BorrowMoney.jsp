<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>借款管理</title>
<link rel="stylesheet" href="/Loan/css/pjcss/public.css">
<link rel="stylesheet" href="/Loan/css/pjcss/account.css">
<link rel="stylesheet" href="/Loan/css/pjcss/datepicker.css">

<script src="<%=path%>/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.min.js"></script>
<style type="text/css">
	#bj table thead tr th{
		font-size:15px;
		font-weight:bold;
	}
	#bj table tbody tr td{
		padding-top:5px;
		padding-bottom: 20px;
	}
</style>
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
					<li class="active"><a href="<%=path%>/client/BorrowMoney">借款管理</a></li>
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
		<a href="javascript:void(0);" class="active" id="loanLink">借款管理</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" id="loan">
	<div class="sub-nav" style="font-size:12px;">
		<a href="<%=path%>/client/BorrowMoney?lstate=0">未通过</a>
		<a href="<%=path%>/client/BorrowMoney?lstate=1">初审中</a>
		<a href="<%=path%>/client/BorrowMoney?lstate=2">招标中</a>
		<a href="<%=path%>/client/BorrowMoney?lstate=3">满标</a>
		<a href="<%=path%>/client/BorrowMoney?lstate=4">还款中</a>
		<a href="<%=path%>/client/BorrowMoney?lstate=5">已还款</a>
		<a href="<%=path%>/client/BorrowMoney?lstate=6">流标</a>
		<a href="<%=path%>/client/BorrowMoney">全部</a>
	</div>
	<!-- <div class="account-form account-form-manage cl">
		<input type="text" class="date icon icon-date" autocomplete="off" id="startDate" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" autocomplete="off" id="endDate" readonly="readonly">
		<input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" />
		<button type="button" class="search" id="loanSearch">搜索</button>
	</div> -->
	<div id="bj" style="width:901px;height:470px;border: 2px solid; border-color: #DFF0D8;">
		<table class="table">
				<thead>
					<tr>
						<th style="width: 95px;">编号</th>
						<th style="width: 110px;">标题</th>
						<th style="width: 100px;">借款类型</th>
						<th style="width: 100px;">担保方式</th>
						<th style="width: 100px;">金额（元）</th>
						<th style="width: 70px;">年利率</th>
						<th style="width: 100px;">期限（天）</th>
						<th style="width: 155px;">发布时间</th>
						<th style="width: 70px;">状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="loan" items="${loanList}">
						<tr class="success">
							<td>${loan.lid}</td>
							<td>${loan.ltitle}</td>
							<td>${loan.ltype}</td>
							<td>${loan.lclass}</td>
							<td>${loan.lmoney}</td>
							<td>${loan.lrate}%</td>
							<td>${loan.lterm}</td>
							<td><fmt:formatDate value="${loan.ltime}" type="both"/></td>
							<c:if test="${loan.lstate==0}">
								<td>未通过</td>
							</c:if>
							<c:if test="${loan.lstate==1}">
								<td>初审中</td>
							</c:if>
							<c:if test="${loan.lstate==2}">
								<td>招标中</td>
							</c:if>
							<c:if test="${loan.lstate==3}">
								<td>满标</td>
							</c:if>
							<c:if test="${loan.lstate==4}">
								<td>还款中</td>
							</c:if>
							<c:if test="${loan.lstate==5}">
								<td>已还款</td>
							</c:if>
							<c:if test="${loan.lstate==6}">
								<td>流标</td>
							</c:if>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
		<div>			
			<c:if test="${page > 1}">
				<a href="<%=path %>/client/BorrowMoney?state=2&page=${page - 1}"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">上一页</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${total > 10}">
				<a href="<%=path %>/client/BorrowMoney?state=2&page=${page + 1}"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">下一页</a>&nbsp;&nbsp;
			</c:if>
				当前页 第<span>${page}</span>页&nbsp;&nbsp;
				共<span>${count}</span>页&nbsp;&nbsp;
				共<span>${total}</span>条数据&nbsp;&nbsp;
		</div>
</div>

</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body></html>