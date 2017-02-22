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
<title>安全设置</title>
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
		<a href="javascript:void(0);" class="active">安全中心</a>
	</div>
	<em></em>
</div>
<div class="account-content" style="display: block;">
	<div class="safe">
		<div class="safe-top">
			<p class="safe-t-text">您的资料完善度</p>
			<p class="safe-t-line"><em style="width: 100%;"></em></p>
			<p class="safe-t-r">高</p>
		</div>
		<div class="safe-content">
			<ul class="safe-list">
				<li>
					<div class="safe-list-1">
						<p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
					</div>
					<div class="safe-list-2" id="cellPhone-text">1587****015</div>
					<div class="safe-list-3">
						<a href="javascript:;" id="cellPhone" class="on">已绑定</a>
						<a href="javascript:;" id="changePhone">修改</a>
					</div>
				</li>
				<li>
					<div class="safe-list-1">
						<p class="icon icon-true" id="email-icon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
					</div>
					<div class="safe-list-2" id="email-text">1*******2@qq.com</div>
					<div class="safe-list-3">
						<a href="javascript:;" id="email" class="on">已绑定</a>
					</div>
				</li>
				<li>
					<div class="safe-list-1">
						<p class="icon icon-true" id="realName-icon">身份认证</p>
					</div>
					<div class="safe-list-2" id="realName-text">**龙    ****261***********</div>
					<div class="safe-list-3">
						<a href="javascript:;" id="realName" class="on">已认证</a>
					</div>
				</li>
				<li>
					<div class="safe-list-1">
						<p class="icon icon-true">登录密码</p>
					</div>
					<div class="safe-list-2">
						******
					</div>
					<div class="safe-list-3">
						<a href="javascript:;" id="password-btn">修改</a>
					</div>
				</li>
				<li>
					<div class="safe-list-1">
						<p class="icon icon-true">交易密码</p>
					</div>
					<div class="safe-list-2">
						******
					</div>
					<div class="safe-list-3">
						<a href="javascript:;" id="dealpwd">修改</a>
						<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/recoverpwd.html#deal" id="forgetpwd">忘记密码</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="popup bind-email">
	<p class="title left">绑定邮箱</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-from">
		<div class="label cl">
			<label>添加邮箱</label><input type="text" id="addEmail" maxlength="30" placeholder="输入您的邮箱地址">
		</div>
		<button type="button" class="btn" id="email-submit">添加邮箱</button>
	</div>
</div>
<div class="popup change-phone">
	<p class="title left">修改手机号</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-from step1">
		<div class="label cl">
			<label>原手机号</label>
			<p class="text" id="oldPhoneNum"></p>
		</div>
		<div class="label label-msg cl">
			<label>验证码</label>
			<input type="text" id="oldMobliePhoneCode" maxlength="6" placeholder="输入您短信验证码">
			<button type="button" id="getMsgCodeOld">获取验证码</button>
		</div>
		<button type="button" class="btn" id="phone-submit-one">验证</button>
	</div>
	<div class="popup-from step2">
		<div class="label cl">
			<label>新手机号</label>
			<input type="text" id="newMobliePhone" maxlength="11" placeholder="输入您的新手机号码">
		</div>
		<div class="label label-msg cl">
			<label>验证码</label>
			<input type="text" id="newMobliePhoneCode" maxlength="6" placeholder="输入您短信验证码">
			<button type="button" id="getMsgCode">获取验证码</button>
		</div>
		<button type="button" class="btn" id="phone-submit">修改</button>
	</div>
	<div class="popup-result">
		<div class="success">
			<p>手机号修改成功，请重新登录！</p>
			<button type="button" class="btn" id="phone-submit-success">确定</button>
		</div>
	</div>
</div>
<div class="popup change-pwd">
	<p class="title left">修改密码</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-from">
		<div class="label cl">
			<label>原始密码</label><input type="password" id="oldPassword" maxlength="18" autocomplete="new-password" placeholder="输入原始密码">
		</div>
		<div class="label cl">
			<label>新密码</label><input type="password" id="newPassword" maxlength="18" autocomplete="new-password" placeholder="输入新密码">
		</div>
		<div class="label cl">
			<label>确认密码</label><input type="password" id="confirmPassword" maxlength="18" autocomplete="new-password" placeholder="再次输入新密码">
		</div>
		<button type="button" class="btn" id="pwd-submit">确定</button>
	</div>
	<div class="popup-result">
		<div class="success">
			<p>密码修改成功!</p>
			<button type="button" class="btn" id="submit-success">确定</button>
		</div>
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