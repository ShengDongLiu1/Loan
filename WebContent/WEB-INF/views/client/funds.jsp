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
<title>账户提现</title>
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
		<a href="javascript:void(0);" class="active show-cash">提现</a>
		<a href="javascript:void(0);" class="show-cash-list">提现记录</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" style="display: block;">
	<!-- 提现 -->
	<div class="cash-pay">
		<p class="tips-title">
			<b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费。禁止信用卡套现！<br>
			a）请输入您要提现的金额，我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。<br>
			b）每笔提现金额至少为100元以上。
		</p>
		<div class="pay-from">
			<div class="label cl">
				<label class="long">持卡人：</label><p class="text" id="cash-realName">唐洁龙</p>
			</div>
			<div class="label cl">
				<label class="long">可提现金额：</label><p class="text color" id="cash-usableSum">250436507.25元</p>
			</div>
			<div class="label cl label-msg">
				<label class="long">提现至银行：</label><input type="text" class="select" id="select-bank" readonly="">
				<ul class="select-box">
					
				<li data-name="邮储银行" data-bankno="6217994280011191491"><a href="javascript:;">邮储银行&nbsp;&nbsp;|&nbsp;&nbsp;6217 ******** 1491</a></li></ul>
			</div>
			<div class="label cl">
				<label class="long">提现金额：</label><input type="text" maxlength="8" id="cashInput" placeholder="请输入提现金额">
			</div>
			<div class="label cl">
				<label class="long">提现手续费：</label><p class="text">2.00元</p>
			</div>
			<div class="label cl">
				<label class="long">提现服务费：</label><p class="text" id="refreew">0.00</p>
			</div>
			<div class="label cl">
				<label class="long">交易密码：</label><input type="password" maxlength="16" id="cash-password" autocomplete="new-password" placeholder="请输入交易密码">
				<p class="text ml10"><a href="http://120.76.203.19:8090/shzc_test/WEB-PC/recoverpwd.html#deal">忘记密码</a></p>
			</div>
			<div class="label cl label-msg">
				<label class="long">验证码：</label><input type="text" maxlength="6" id="cash-smsCode" placeholder="请输入短信验证码">
				<div class="msg-btn">
					<button type="button" id="getMsgCode">获取验证码</button>
				</div>
			</div>
			<button type="button" class="btn long disabled" id="cash-submit">立即提现</button>
		</div>
		<div id="returnHtml"></div>
	</div>
	<!-- 提现记录 -->
	<div class="cash-list">
		<div class="account-form cl">
			<input type="text" class="date icon icon-date" id="startDate">
			<p class="text">至</p>
			<input type="text" class="date icon icon-date" id="endDate">
			<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
			<button type="button" class="search" id="cashSearch">搜索</button>
		</div>
		<div class="account-list">
			<ul class="cash-list-box list-box">
				<li class="title">
					<div class="children0">账户名</div>
					<div class="children1">提现金额</div>
					<div class="children2">提现银行卡号</div>
					<div class="children3">提现手续费</div>
					<div class="children4">提现时间</div>
					<div class="children5">状态</div>
				</li>
			</ul>
			<ul class="cash-list listData">
			
			</ul>
			<ul class="paging">
			
			</ul>
		</div>
	</div>
</div>
		</div>
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