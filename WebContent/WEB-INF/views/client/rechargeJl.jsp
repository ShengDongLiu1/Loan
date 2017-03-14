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
		<div class="account-right">
			<div class="account-right-nav">
				<div class="sub-a-nav">
					<a href="javascript:void(0);" id="cz">充值</a>
					<a href="javascript:void(0);" class="active show-ipay">充值记录</a>
				</div>
			</div>
<div class="account-content">
	<!-- 充值记录 -->
	<div class="ipay-pay">
		<!-- <div class="account-form cl">
			<input type="datetime" class="date icon icon-date" id="startDate">
			<p class="text">至</p>
			<input type="datetime" class="date icon icon-date" id="endDate">
			<input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" />
			<button type="button" class="search" id="ipaySearch">搜索</button>
		</div> -->
		<div class="account-list">
			<table class="table" id="sample-table-2">
				<thead>
					<tr>
						<th class="center" width="200" style="text-align:center">账户名</th>
						<th class="center" width="100" style="text-align:center">充值金额</th>
						<th class="center" width="200" style="text-align:center">充值类型</th>
						<th class="center" width="100" style="text-align:center">充值时间</th>
						<th class="center" style="text-align:center" width="200">充值状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="c" varStatus="status">
						<tr>
							<td class="center" width="200" style="text-align:center">${c.customer.username }</td>
							<td class="center" width="100" style="text-align:center">${c.rmoney }</td>
							<td class="center" width="200" style="text-align:center">${c.rtype }</td>
							<td class="center" width="100" style="text-align:center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.rtime }"/></td>
							<td class="center" style="text-align:center" width="200">${c.rstate }</td>
						</tr>
					</c:forEach>
					<tr>
						<th colspan="13">
				        	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
				        	<a href="javascript:void(0);" id = "first">首页</a>&nbsp;
				        	<a href="javascript:void(0);" id = "previous" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</a>&nbsp;
				        	<a href="javascript:void(0);" id = "next" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</a>&nbsp;
				        	<a href="javascript:void(0);" id = "end">尾页</a>
				        </th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
		</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
	<script type="text/javascript">
		$('#cz').click(function(){
			window.location.href="<%=path%>/recharge/czadd.do"; 
		})
		$('#ipaySearch').click(function(){
    		var rtime = $('#startDate').val();
    		var rtime1 = $('#endDate').val();
    		if(rtime == ''){
    			return;
    		}
    		if(rtime1 == ''){
    			return;
    		}
    		if(rtime>rtime1){
    			return;
    		}
    		window.location.href="<%=path%>/recharge/queryBy.do?rtime="+rtime+"&&rtime1="+rtime1; 
    	});
		function username(value){
			var btn="<a href='javascript:onCustomer("+value.uid+")'>"+value.username+"</a>";
			return btn;
		}
		$("#first").click(function(){
			window.location.href="<%=path%>/recharge/queryBy.do?page=${1}&&rows=${pageSize }"; 
		})
		$("#end").click(function(){
			window.location.href="<%=path%>/recharge/queryBy.do?page=${count == 0 ? 1:count }&&rows=${pageSize }";
		})
		$("#previous").click(function(){
			var page=${page == 1};
			if(page){
				return false;
			}else{
				window.location.href="<%=path%>/recharge/queryBy.do?page=${page-1}&&rows=${pageSize }"; 
			}
		})
		$("#next").click(function(){
			var page=${count <= page};
			if(page){
				return false;
			}else{
				window.location.href="<%=path%>/recharge/queryBy.do?page=${page+1}&&rows=${pageSize }"; 
			}
		})
	</script>
</body></html>