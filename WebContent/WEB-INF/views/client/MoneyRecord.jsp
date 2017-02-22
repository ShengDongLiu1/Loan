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
<title>资金记录</title>
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
			<li class="active"><a href="javascript:;">全部</a></li>
			<li><a href="javascript:;">投资</a></li>
			<li><a href="javascript:;">充值</a></li>
			<li><a href="javascript:;">提现</a></li>
			<li><a href="javascript:;">还款</a></li>
			<li><a href="javascript:;">奖励</a></li>
			<li><a href="javascript:;">冻结</a></li>
		</ul>
	</div>
	<div class="account-form cl">
		<p class="text long">交易时间：</p>
		<input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" id="fundSearch">搜索</button>
	</div>
	<div class="account-list">
			<ul class="fund-list-box list-box">
				<li class="title">
					<div class="children0">交易时间</div>
					<div class="children1">交易类型</div>
					<div class="children2">交易金额</div>
					<div class="children3">可用余额</div>
					<div class="children4">操作</div>
				</li>
			</ul>
			<ul class="fund-list-box listData"><li class="interval"><div class="children0">2017-02-21 14:24:34</div><div class="children1">汇付充值</div><div class="children2">+321.00</div><div class="children3"><span class="black">250,436,507.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li><div class="children0">2017-02-21 14:22:31</div><div class="children1">汇付充值</div><div class="children2">+122.00</div><div class="children3"><span class="black">250,436,186.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li class="interval"><div class="children0">2017-02-21 11:48:21</div><div class="children1">汇付充值</div><div class="children2">+123.00</div><div class="children3"><span class="black">250,436,064.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li><div class="children0">2017-02-21 08:29:15</div><div class="children1">汇付充值</div><div class="children2">+213.00</div><div class="children3"><span class="black">250,435,941.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li class="interval"><div class="children0">2017-02-21 08:17:51</div><div class="children1">汇付充值</div><div class="children2">+123.00</div><div class="children3"><span class="black">250,435,728.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li><div class="children0">2017-02-21 08:01:29</div><div class="children1">汇付充值</div><div class="children2">+534.00</div><div class="children3"><span class="black">250,435,605.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li class="interval"><div class="children0">2017-02-20 16:57:16</div><div class="children1">汇付充值</div><div class="children2">+121.00</div><div class="children3"><span class="black">250,435,071.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li><div class="children0">2017-02-20 10:44:47</div><div class="children1">汇付充值</div><div class="children2">+123.00</div><div class="children3"><span class="black">250,434,950.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li class="interval"><div class="children0">2017-02-20 10:29:52</div><div class="children1">汇付充值</div><div class="children2">+523.00</div><div class="children3"><span class="black">250,434,827.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li><li><div class="children0">2017-02-20 09:52:00</div><div class="children1">汇付充值</div><div class="children2">+10000000.00</div><div class="children3"><span class="black">250,434,304.25元</span></div><div class="children4"><a href="javascript:;" class="btn-link">查看详情</a></div></li></ul>
			<ul class="paging" style="width: 500px; margin: 30px auto 0px;"><li><button type="button" class="pre">上一页</button></li><li class="active"><button type="button" data-num="1">1</button></li><li><button type="button" data-num="2">2</button></li><li><button type="button" data-num="3">3</button></li><li><button type="button" data-num="4">4</button></li><li><button type="button" data-num="5">5</button></li><li><button type="button" data-num="6">6</button></li><li><span>...</span></li><li><button type="button" data-num="21">21</button></li><li><button type="button" class="next">下一页</button></li></ul>
		</div>
</div></div>
		<!-- end -->
	</div>
	<div id="ajaxFooter">	
	<div class="mod-sidebar">
		<ul>
			<li><a href="javascript:;" class="sidebar-qq" id="BizQQWPA"></a></li>
			<li><a href="javascript:;" class="sidebar-wx"></a></li>
			<li><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/calculator.html" class="sidebar-cl"></a></li>
			<li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
			<li><a href="javascript:;" class="sidebar-top"></a></li>
		</ul>
	</div>
	<!-- concat -->
	<div class="index-concat">
		<div class="wrap cl">
			<div class="index-concat-left">
				<img src="./asda_files/index_erweima.png" alt="扫码关注普金资本">
			</div>
			<div class="index-concat-phone">
				<p>财富热线</p>
				<h3>400-606-2079</h3>
			</div>
			<div class="index-concat-channel">
				<p class="about_cel_text">
					<a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
					<a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
					</a>
					<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=b21f94451a224d115c56e3e20626abf75f33fff218f82fd8dd4a04954f80c70d" class="about_qq"></a>
					<a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
					</a>
				</p>
				<p class="about_cel_no">admin@pujinziben.com</p>
			</div>
			<div class="index-concat-link cl"><a href="javascript:;" class="title">友情链接</a></div>
		</div>
	</div>
	<div class="footer">
		<div class="wrap">
			<p class="text">
			版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a><a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="./asda_files/CNZZ.png" alt=""></a>
			</p>
			<div class="footer-list" style="width:690px;">
				<a href="https://credit.cecdc.com/CX20160720023638001698.html"><img src="./asda_files/ft_link_01.png" alt=""></a>
				<a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com"><img src="./asda_files/ft_link_02.png" alt=""></a>
				<a href="http://si.trustutn.org/info?sn=876160725000486996572"><img src="./asda_files/ft_link_03.png" alt=""></a> 
				<a href="http://webscan.360.cn/index/checkwebsite/url/www.pujinziben.com"><img width="110px" height="40px" border="0" src="./asda_files/745ef449cbf0f6a74791f73d57aa7ac2"></a>
				<a href="http://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business">
					<img src="./asda_files/ft_link_04.png" alt="">
				</a>
				<a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343"><img width="112px" height="34px" src="./asda_files/2.png"></a>
			</div>
		</div>
	</div>
	<div class="popup wechart-box">
		<p class="title left">关注普金资本微信公众号</p>
		<a href="javascript:void(0);" class="close icon icon-close"></a>
		<div class="popup-from">
			<img src="./asda_files/wechart.jpg">
		</div>
	</div>
</div>
	<!--[if lt IE 9]>
	    <script src="src/libs/json2.js"></script>
	<![endif]-->
</body></html>