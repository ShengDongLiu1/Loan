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
<title>投资管理</title>
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
		<a href="javascript:void(0);" class="active" id="invest-manage-Link">投资管理</a>
		<a href="javascript:void(0);" id="invest-detail-Link">收款明细</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" id="invest">
	<div class="sub-nav">
		<a href="javascript:;" class="active" id="invest-s1">成功借出</a>
		<a href="javascript:;" id="invest-s2">招标中的借款</a>
		<a href="javascript:;" id="invest-s3">回款中的借款</a>
		<a href="javascript:;" id="invest-s4">已回收的借款</a>
	</div>
	<div class="account-form cl">
		<input type="text" class="date icon icon-date" autocomplete="off" id="invest-startDate" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" autocomplete="off" id="invest-endDate" readonly="readonly">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" id="investSearch">搜索</button>
	</div>
	<div class="invest-listData invest-listData1">
		<ul class="investData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">年利率</div>
				<div class="children3">期限</div>
				<div class="children4">还款方式</div>
				<div class="children5">投资金额</div>
				<div class="children6">投资时间</div>
			</li>
		</ul>
		<ul class="investData listData"><li class="interval"><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=388" title="多金宝小测试3">多金宝小测试3</a></div><div class="children1">多金宝</div><div class="children2">9%</div><div class="children3">4个月</div><div class="children4">等额本息</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-14</div></li><li><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=387" title="恒金宝测试002">恒金宝测试0...</a></div><div class="children1">恒金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-14</div></li><li class="interval"><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=386" title="恒大金宝001">恒大金宝001</a></div><div class="children1">恒金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-14</div></li><li><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=385" title="恒金宝小测试1">恒金宝小测试1</a></div><div class="children1">恒金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-14</div></li><li class="interval"><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=384" title="恒金宝测试洪金宝">恒金宝测试洪...</a></div><div class="children1">恒金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-14</div></li><li><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=372" title="合同测试8">合同测试8</a></div><div class="children1">普金保</div><div class="children2">5%</div><div class="children3">3个月</div><div class="children4">等额本息</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-13</div></li><li class="interval"><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=371" title="合同测试7">合同测试7</a></div><div class="children1">普金保</div><div class="children2">9%</div><div class="children3">2个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">5,000.00</span></div><div class="children6">2016-09-13</div></li><li><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=369" title="sdrgvsdsgvd">sdrgvs...</a></div><div class="children1">普金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-13</div></li><li class="interval"><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=368" title="wefefew">wefefew</a></div><div class="children1">普金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-13</div></li><li><div class="children0"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/invest.html?id=326" title="发标测试2016">发标测试20...</a></div><div class="children1">普金保</div><div class="children2">12%</div><div class="children3">1个月</div><div class="children4">按月付息，到期还本</div><div class="children5"><span class="black">1,000.00</span></div><div class="children6">2016-09-09</div></li></ul>
		<ul class="paging" style="width: 340px; margin: 30px auto 0px;"><li><button type="button" class="pre">上一页</button></li><li class="active"><button type="button" data-num="1">1</button></li><li><button type="button" data-num="2">2</button></li><li><button type="button" data-num="3">3</button></li><li><button type="button" data-num="4">4</button></li><li><button type="button" class="next">下一页</button></li></ul>
	</div>
	<div class="invest-listData invest-listData2">
		<ul class="investData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">年利率</div>
				<div class="children3">期限</div>
				<div class="children4">还款方式</div>
				<div class="children5">发布时间</div>
				<div class="children6">投资金额</div>
				<div class="children7">投资时间</div>
			</li>
		</ul>
		<ul class="investData listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
	<div class="invest-listData invest-listData3">
		<ul class="investData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">年利率</div>
				<div class="children3">期限</div>
				<div class="children4">投资金额</div>
				<div class="children5">已收金额</div>
				<div class="children6">还款时间</div>
				<div class="children7">操作</div>
			</li>
		</ul>
		<ul class="investData listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
	<div class="invest-listData invest-listData4">
		<ul class="investData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">年利率</div>
				<div class="children3">期限</div>
				<div class="children4">投资金额</div>
				<div class="children5">已收金额</div>
				<div class="children6">发布时间</div>
				<div class="children7">操作</div>
			</li>
		</ul>
		<ul class="investData listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
</div>
<div class="account-content" id="payment" style="display: none;">
	<div class="invest-detail-list-top">
		<div class="invest-detail-list-row">
			<div class="row row1">
				<p>待收本息情况：</p>
			</div>
			<div class="row row2">
				<p class="row-top"><span id="allForPIOneMonth">0.00</span>元</p>
				<p class="row-bottom">未来一个月</p>
			</div>
			<div class="row row3">
				<p class="row-top"><span id="allForPIThreeMonth">0.00</span>元</p>
				<p class="row-bottom">未来三个月</p>
			</div>
			<div class="row row4">
				<p class="row-top"><span id="allForPIYear">0.00</span>元</p>
				<p class="row-bottom">未来一年</p>
			</div>
			<div class="row row5">
				<p class="row-top"><span id="allForPI">0.00</span>元</p>
				<p class="row-bottom">全部</p>
			</div>
		</div>
	</div>
	<div class="account-form cl">
		<input type="text" class="date icon icon-date" autocomplete="off" id="payment-startDate">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" autocomplete="off" id="payment-endDate">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" id="invest-detailSearch">搜索</button>
	</div>
	<div class="invest-detailTable">
		<ul class="list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">年利率</div>
				<div class="children3">期限</div>
				<div class="children4">投资金额</div>
				<div class="children5">已收金额</div>
				<div class="children6">发布时间</div>
			</li>
		</ul>
		<ul class="detailData listData">
		</ul>
		<ul class="paging detailPaging">
		</ul>
	</div>
</div>
<div class="popup payment-detail">
	<p class="title left">还款明细</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-list">
		<ul class="payment-detail-data list-box">
			<li class="">
				<div class="children0">期数</div>
				<div class="children1">还款日期</div>
				<div class="children2">应收本金</div>
				<div class="children3">应收利息</div>
				<div class="children4">剩余本金</div>
				<div class="children5">利息管理费</div>
				<div class="children6">是否逾期</div>
				<div class="children7">逾期天数</div>
				<div class="children8">逾期罚息</div>
				<div class="children9">收益</div>
				<div class="children10">还款人</div>
			</li>
		</ul>
		<ul class="listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
</div>
</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body></html>