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
<script src="<%=path%>/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
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
	<div class="invest-listData invest-listData1">
		<ul class="investData list-box">
			<li class="interval">
				<div class="children0" style="font-weight:bold;">标题</div>
				<div class="children1" style="font-weight:bold;">订单号</div>
				<div class="children2" style="font-weight:bold;">类型</div>
				<div class="children3" style="font-weight:bold;">年利率</div>
				<div class="children4" style="font-weight:bold;">还款期限</div>
				<div class="children5" style="font-weight:bold;">投资金额</div>
				<div class="children6" style="font-weight:bold;">投资时间</div>
			</li>
		</ul>
		<ul class="investData listData" id="investmentDg">
			<li>
				<c:forEach var="list" items="${rechList}">
					<div class="children0"><span class="black">${list.loan.ltitle}</span></div>
					<div class="children1"><span class="black">${list.inumber}</span></div>
					<div class="children2"><span class="black">${list.loan.ltype}</span></div>
					<div class="children3"><span class="black">${list.loan.lrate}%</span></div>
					<div class="children4"><span class="black">${list.loan.lterm}天</span></div>
					<div class="children5"><span class="black">${list.imoney}元</span></div>
					<div class="children6"><span class="black"><fmt:formatDate value="${list.itime}" type="both"/></span></div>
				</c:forEach>
			</li>
		</ul>
		<!-- <ul class="paging" style="width: 340px; margin: 30px auto 0px;">
			<li><button type="button" class="pre" id = "previous">上一页</button></li>
			<li><button type="button" class="next" id = "next1">下一页</button></li>
		</ul> -->
		<div style="text-align: center; margin-top: 5px;">			
				<a href="javascript:void(0)" onclick="selCusLoan(2);"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">上一页</a>&nbsp;&nbsp;
		
				<a href="javascript:void(0)" onclick="selCusLoan(3);"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">下一页</a>&nbsp;&nbsp;
			
				当前页 第<span id="page">${page}</span>页&nbsp;&nbsp;
				共<span id="count">${count}</span>页&nbsp;&nbsp;
				共<span id="total">${total}</span>条数据&nbsp;&nbsp;
		</div>
    </div>
</div>
</div>
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
	<script>
	//查询客户的借款申请
	function selCusLoan(num){
		var page=1;
		var addpage=0;
		if(num == 2){//上一页
			addpage=$("#page").html();
			page=parseInt(addpage)-1;
			if(page == 0){
				page=1;
				/* alert('当前页已经是第一页！'); */
				return false;
			}
		}else if(num == 3){//下一页
			addpage=$("#page").html();
			page+=parseInt(addpage);
			if(parseInt($("#count").html())<page){
				page=parseInt($("#count").html());
				/* alert('当前页已经是最后一页！'); */
				return false;
			}
		}
		window.location.href='<%=path %>/client/investment?page='+page+'&rows='+10;		
	}
<%-- 	$("#previous").click(function(){
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
	}) --%>
	</script>
</body></html>