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
<link rel="stylesheet" href="/Loan/css/lanrenzhijia.css" media="all">
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>

<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" href="<%=path %>/css/loan.css"/>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
<script type="text/javascript" src="<%=path %>/js/toDate.js"></script>

<style type="text/css">

.easyui-textbox{width:10%;}

.dj:link{color:orange;}

.jd:link{color:green;}
.juzho th {
	text-align: center;
}
.success td{
	text-align: center;
}
</style>
<script>
$(function() {
	setPagination("list");
});

//条件查询
	function seachs(){
		var username = $('#susername').textbox('getValue');
		var wnumber = $('#srealname').textbox('getValue');
		var wbank = $('#sidnumber').textbox('getValue');
		$('#list').datagrid('load',{  
			username:username,
			wnumber:wnumber,
			wbank:wbank
		}); 
	}
	
	//客户状态
	function cusState(value){
		var btn="";
		if(value == 1){
			btn="成功";
		}else if(value == 2){
			btn="失败";
		}else if(value == 3){
			btn="审核中";
		}
		return btn;
	}
	
	function toDate(obj){
		var date = new Date();
		 date.setTime(obj.time);
		 date.setHours(obj.hours);
		 date.setMinutes(obj.minutes);
		 date.setSeconds(obj.seconds);
		return formatDateTime(date);
	}
	
	/* 用户姓名 */
	function username(value){
		var btn="<a href='javascript:onCustomer("+value.uid+")'>"+value.username+"</a>";
		return btn;
	}
</script>
<script>
window.onload = function() {
	var div1=document.getElementById("angodiv1");//提现记录
 	/* var div2=document.getElementById("angodiv2");//提现 */
 	div1.style.display="block";
 	/* div2.style.display="none";
 	div3.style.display="none";
 	div4.style.display="none"; */
}
</script>
<script type="text/javascript">
function angodiv1() {
	window.location.href="<%=path%>/client/withdrawalsList?state=2&page=1";
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
					<li class="active"><a href="<%=path %>/client/left">账户总览</a></li>
					<li><a href="<%=path%>/client/recharge">充值</a></li>
					<li><a href="<%=path%>/client/funds">提现</a></li>
					<li><a href="<%=path%>/client/MoneyRecord">资金记录</a></li>
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
				</ul>
			</div>
		</div>
		<!-- begin -->
		<div class="account-right"><div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="<%=path%>/client/funds" class="active show-cash">提现</a>
		<a href="<%=path %>/withdrawals/withdrawalsList?page=1">提现记录</a>
	</div>
	<!-- <em class="em-line"></em> -->
</div>
<div class="account-content" style="display: block;">
	<!-- 提现记录 -->
	<div class="account-form cl">
		<p class="text long">交易时间：</p>
		<input type="text" class="date icon icon-date" id="time" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" id="time1" readonly="readonly">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" onclick="">搜索</button>
	</div>
	<div id="angodiv1">
		<table class="table" style="border: 2px solid; border-color: #DFF0D8;">
			<thead data-options="frozen:true" >
				<tr class="juzho">
					<th width="8%">用户名</th>
					<th width="26%">提现账号</th>
					<th width="10%">提现银行</th>
					<th width="8%">提现金额</th>
					<th width="8%">提现手续费</th>
					<th width="12%">实际到账金额</th>
					<th width="8%">状态</th>
					<th width="15%">提现时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${witList.rows}">
					<tr class="success">
						<td>${customer.username}</td>
						<td>${list.wnumber}</td>
						<td>${list.wbank}</td>
						<td>${list.wmoney}</td>
						<td>${list.wcounterfee}</td>
						<td>${list.wactual}</td>
						<td>
							<c:choose>
								<c:when test="${list.wstate == 1}">成功</c:when>
								<c:when test="${list.wstate == 2}">失败</c:when>
								<c:otherwise>审核中</c:otherwise>
							</c:choose>
						</td>
						<td><fmt:formatDate value="${list.wtime}" type="both"/></td>
					</tr>
				</c:forEach>
								
			</tbody>
		</table>
	</div>
	<div>
		<a href="<%=path %>/withdrawals/withdrawalsList?state=2&page=${witList.pageNo - 1}"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">上一页</a>&nbsp;&nbsp;
		<a href="<%=path %>/withdrawals/withdrawalsList?state=2&page=${witList.pageNo + 1}" onclick="mygoods(3)" style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">下一页</a>&nbsp;&nbsp;
		当前页 第<span id="page">${witList.pageNo}</span>页&nbsp;&nbsp;
		共<span id="count">${witList.total}</span>页&nbsp;&nbsp;
		共<span id="total">${count}</span>条数据&nbsp;&nbsp;
	</div>
</div>
		</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
</html>