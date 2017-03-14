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
<title>投资管理</title>
<link rel="stylesheet" href="/Loan/css/pjcss/public.css">
<link rel="stylesheet" href="/Loan/css/pjcss/account.css">
<link rel="stylesheet" href="/Loan/css/pjcss/datepicker.css">
<script type="text/javascript">--
	function dateSearch(){
		var startDate = $("#startDate").val;
		var endDate = $("#endDate").val;
		alert(startDate+", "+endDate);
		$('#investmentDg').datagrid('load',{  
			startDate:startDate,
			startDate:startDate
		}); 
	}
</script>
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
							<li class="active"><a href="<%=path%>/client/investment">投资管理</a></li>
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
		<a href="javascript:void(0);" class="active" id="invest-manage-Link">投资管理</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" id="invest">
	<div class="sub-nav">
		<a href="javascript:;" class="active" id="invest-s1">成功投资</a>
		<a href="javascript:;" id="invest-s2">招标中的借款</a>
		<a href="javascript:;" id="invest-s3">回款中的借款</a>
		<a href="javascript:;" id="invest-s4">已回收的借款</a>
	</div>
	<div class="account-form cl">
		<input type="date" id="startDate" name="startDate"> 至 <input type="date" id="endDate" name="endDate">
		<button type="button" class="search" onclick="dateSearch();">搜索</button>
	</div>
	<div class="invest-listData invest-listData1">
		<ul class="investData list-box">
			<li class="title">
				<div class="children0">借款标题</div>
				<div class="children1">订单号</div>
				<div class="children2">借款金额</div>
				<div class="children3">年利率</div>
				<div class="children4">借款类型</div>
				<div class="children5">投资金额</div>
				<div class="children6">投资时间</div>
			</li>
		</ul>
		<ul class="investData listData" id="investmentDg">
			<li class="interval">
				<c:forEach var="list" items="${rechList}">
					<div class="children0">${list.loan.ltitle}</div>
					<div class="children1">${list.inumber}</div>
					<div class="children2">${list.loan.lmoney}</div>
					<div class="children3">${list.loan.lrate}</div>
					<div class="children4">${list.loan.ltype}</div>
					<div class="children5"><span class="black">${list.imoney}</span></div>
					<div class="children6"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.itime}"/></div>
				</c:forEach>
			</li>
		</ul>
		<ul class="paging" style="width: 340px; margin: 30px auto 0px;">
			<li><button type="button" class="pre" id = "previous" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button></li>
			<li><button type="button" class="next" id = "next1" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button></li>
		</ul>
    </div>
</div>
</div>
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
	<script>
	$("#previous").click(function(){
		var page=${page == 1};
		if(page){
			return false;
		}else{
			window.location.href="<%=path %>/client/investment?page=${page - 1}&&rows=${pageSize }"; 
		}
	})
	$("#next1").click(function(){
		var page=${count <= page};
		if(page){
			return false;
		}else{
			window.location.href="<%=path %>/client/investment?page=${page + 1}&&rows=${pageSize }"; 
		}
	})
	</script>
</body></html>