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
<title>消息中心</title>
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
					<li><a href="<%=path%>/client/MessageCenter">消息中心</a></li>
				</ul>
			</div>
		</div>
		<!-- begin -->
			<div class="account-right"><div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="active show-cash">消息中心</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" style="margin-top: -40px;">
	<div class="sub-nav" style="margin-top: 15px;">
		<a href="javascript:;" onclick="deleteMsg();" id="delSys">删除</a>
		<a href="javascript:;" onclick="readedSys();" id="readedSys">标为已读</a>
		<a href="javascript:;" onclick="unReadSys();" id="unReadSys">标为未读</a>
	</div>

	<div class="msg-list">
		<div class="account-list">
			<ul class="cash-list-box listData">
				<li class="title">
					<div class="children0"><input type="checkbox" name="checkbox" id="checkbox" onclick="checkAll_Sys(this);"><span>状态</span></div>
					<div class="children1">来源</div>
					<div class="children2">标题</div>
					<div class="children3">日期</div>
				</li>
			</ul>
			<ul class="msg-list listData"><li class="interval"><div class="children0"><input type="checkbox" value="7512" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-21 14:28</div></li><li><div class="children0"><input type="checkbox" value="7511" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-21 14:23</div></li><li class="interval"><div class="children0"><input type="checkbox" value="7490" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-21 11:49</div></li><li><div class="children0"><input type="checkbox" value="7486" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-21 8:33</div></li><li class="interval"><div class="children0"><input type="checkbox" value="7485" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-21 8:18</div></li><li><div class="children0"><input type="checkbox" value="7484" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-21 8:03</div></li><li class="interval"><div class="children0"><input type="checkbox" value="7475" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-20 16:57</div></li><li><div class="children0"><input type="checkbox" value="7463" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-20 10:46</div></li><li class="interval"><div class="children0"><input type="checkbox" value="7462" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-20 10:30</div></li><li><div class="children0"><input type="checkbox" value="7453" name="sysMail"></div><div class="children1">系统消息</div><div class="children2"><a href="javascript:;" style="color: #333;">充值成功报告</a></div><div class="children3">2017-02-20 9:52</div></li></ul>
			<ul class="paging" style="width: 500px; margin: 30px auto 0px;"><li><button type="button" class="pre">上一页</button></li><li class="active"><button type="button" data-num="1">1</button></li><li><button type="button" data-num="2">2</button></li><li><button type="button" data-num="3">3</button></li><li><button type="button" data-num="4">4</button></li><li><button type="button" data-num="5">5</button></li><li><button type="button" data-num="6">6</button></li><li><span>...</span></li><li><button type="button" data-num="15">15</button></li><li><button type="button" class="next">下一页</button></li></ul>
		</div>
	</div>
</div>
		</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body></html>