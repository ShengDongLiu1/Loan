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
<script>
window.onload = function() {
	var div1=document.getElementById("angodiv1");//充值
 	var div2=document.getElementById("angodiv2");//提现
 	var div3=document.getElementById("angodiv3");//还款
 	var div4=document.getElementById("angodiv4");//冻结
 	div1.style.display="block";
 	div2.style.display="none";
 	div3.style.display="none";
 	div4.style.display="none";
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>资金记录</title>
<link rel="stylesheet" href="/Loan/css/pjcss/public.css">
<link rel="stylesheet" href="/Loan/css/pjcss/account.css">
<link rel="stylesheet" href="/Loan/css/pjcss/datepicker.css">
<style type="text/css">
	#angodiv1 table thead tr th{
		font-size:15px;
		font-weight:bold;
	}
</style>

<script src="<%=path%>/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
      <!-- 包括所有已编译的插件 -->
<script>
function angodiv1() {
	window.location.href="<%=path%>/client/MoneyRecord?state=2&page=1";
}
function angodiv2() {
 	window.location.href="<%=path%>/capital/selectAngodiv1?state=2&page=1";
 	
}
function angodiv3() {
	window.location.href="<%=path%>/capital/selectAngodiv1?state=3&page=1";
}
function angodiv4() {
	window.location.href="<%=path%>/capital/selectAngodiv1?state=4&page=1";
}
function selectdate(){
	var time=$("#time").val();
	var time1=$("#time1").val();
	window.location.href="<%=path%>/client/MoneyRecord?time='+time+'&time1='+time1+'&page=1";
$.post('<%=path%>/train/list.do',
			{"t_carID":t_carID,"t_driverID":t_driverID,"beginTime":beginTime,"endTime":endTime}
	);
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
					<li><a href="<%=path %>/client/left?uid=${customer.uid}">账户总览</a></li>
					<li><a href="<%=path%>/client/recharge">充值</a></li>
					<li><a href="<%=path%>/client/funds">提现</a></li>
					<li class="active"><a href="<%=path%>/client/MoneyRecord">资金记录</a></li>
				</ul>
				<div class="navbar icon icon-self">我的管理</div>
				<ul class="sub-nav">
					<li><a href="<%=path%>/client/investment">投资管理</a></li>
					<li><a href="<%=path%>/client/BorrowMoney">借款管理</a></li>
				</ul>
				<div class="navbar icon icon-settings">账户设置</div>
				<ul class="sub-nav">
					<li><a href="<%=path%>/client/BankCard">我的银行卡</a></li>
					<li><a href="<%=path%>/client/security">安全设置</a></li>
					<%-- <li><a href="<%=path%>/client/MessageCenter">消息中心</a></li> --%>
				</ul>
			</div>
		</div>
		<!-- begin -->
		<div class="account-right">
<div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="active">资金记录</a>
	</div>
	<em></em>
</div>
<div class="account-content">
	<div class="fund-param-list">
		<p>交易类型：</p>
		<ul class="cl">
			<!-- <li class="active"><a href="javascript:;">全部</a></li>-->
			<!--<li><a href="javascript:;">投资</a></li>-->
			<li><a href="javascript:angodiv1();">充值</a></li>
			<li><a href="javascript:angodiv2();">提现</a></li>
			<li><a href="javascript:angodiv3();">还款</a></li>
			<!--<li><a href="javascript:angodiv4();">奖励</a></li>-->
			<li><a href="javascript:angodiv4();">冻结</a></li>
		</ul>
	</div>
	<!-- <div class="account-form cl">
		<p class="text long">交易时间：</p>
		<input type="date" class="date icon icon-date" name="time" id="time">
		<p class="text">至</p>
		<input type="date" class="date icon icon-date" name="time1"  id="time1">
		<input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" />
		<button type="button" class="search" onclick="selectdate();">搜索</button>
	</div> -->
	<div></div>
	<div id="angodiv1">
	
	<table class="table" style="border: 2px solid; border-color: #DFF0D8;">
				<thead>
					<tr>
						<th width="150px">交易时间</th>
						<th width="150px">交易类型</th>
						<th width="150px">交易金额</th>
						<th width="150px">可用余额</th>
						<th width="150px">操作</th>
					</tr>
				</thead>
				<tbody>
							<c:forEach var="list" items="${userList}">
								<tr class="success">
									<td><fmt:formatDate value="${list.rtime}" type="both"/></td>
									<td>${list.rtype}</td>
									<td>${list.rmoney}</td>
									<td>${list.capital.available}</td>
									<td>
										${list.rstate}
									</td>
								</tr>
							</c:forEach>
							
				</tbody>
			</table>
			<div style="text-align: center; margin-top: 5px;">			<c:if test="${page > 1}">
								<a href="<%=path %>/client/MoneyRecord?state=2&page=${page - 1}"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">上一页</a>&nbsp;&nbsp;
							</c:if>
								<a href="<%=path %>/client/MoneyRecord?state=2&page=${page + 1}" onclick="mygoods(3)" style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">下一页</a>&nbsp;&nbsp;
								当前页 第<span id="page">${page}</span>页&nbsp;&nbsp;
								共<span id="count">${count}</span>页&nbsp;&nbsp;
								共<span id="total">${total}</span>条数据&nbsp;&nbsp;
							</div>
		</div>
		
		</div>

		</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>

</html>
