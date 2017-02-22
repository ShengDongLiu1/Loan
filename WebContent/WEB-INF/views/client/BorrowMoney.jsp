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
<title>借款管理</title>
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
		<a href="javascript:void(0);" class="active" id="loanLink">借款管理</a>
		<a href="javascript:void(0);" id="detailLink">还款明细</a>
		<a href="javascript:void(0);" id="repayEditLink">自动还款设置</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" id="loan">
	<div class="sub-nav">
		<a href="javascript:;" class="active" id="loan-s">审核中</a>
		<a href="javascript:;" id="loan-z">招标中</a>
		<a href="javascript:;" id="loan-c">成功</a>
		<a href="javascript:;" id="loan-j">借款明细</a>
	</div>
	<div class="account-form account-form-manage cl">
		<input type="text" class="date icon icon-date" autocomplete="off" id="startDate" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" autocomplete="off" id="endDate" readonly="readonly">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" id="loanSearch">搜索</button>
	</div>
	<div class="account-form account-form-investor cl">
		<input type="text" class="text" autocomplete="off" placeholder="请输入投资者" id="investor">
		<button type="button" class="search" id="j-loanSearch">搜索</button>
	</div>
	<div class="loan-listData loan-listData1">
		<ul class="loanData list-box">
			<li class="title title1">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">还款方式</div>
				<div class="children3">金额（元）</div>
				<div class="children4">年利率</div>
				<div class="children5">期限</div>
				<div class="children6">发布时间</div>
				<div class="children7">进度</div>
				<div class="children8">状态</div>
			</li>
		</ul>
		<ul class="loanData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
		<ul class="paging"></ul>
	</div>
	<div class="loan-listData loan-listData2">
		<ul class="loanData list-box">
			<li class="title title1">
				<div class="children0">标题</div>
				<div class="children1">类型</div>
				<div class="children2">还款方式</div>
				<div class="children3">金额（元）</div>
				<div class="children4">年利率</div>
				<div class="children5">期限</div>
				<div class="children6">发布时间</div>
				<div class="children7">进度</div>
				<div class="children8">状态</div>
			</li>
		</ul>
		<ul class="loanData listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
	<div class="loan-listData loan-listData3">
		<ul class="loanData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">协议</div>
				<div class="children2">借款类型</div>
				<div class="children3">借款金额</div>
				<div class="children4">年利率</div>
				<div class="children5">还款期限</div>
				<div class="children6">借款时间</div>
				<div class="children7">应还本息</div>
				<div class="children8">状态</div>
			</li>
		</ul>
		<ul class="loanData listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
	<div class="loan-listData loan-listData4">
		<ul class="loanData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">投资者</div>
				<div class="children2">借入总额</div>
				<div class="children3">还款总额</div>
				<div class="children4">已还本金</div>
				<div class="children5">已还利息</div>
				<div class="children6">待还本金</div>
				<div class="children7">待还利息</div>
			</li>
		</ul>
		<ul class="loanData listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
</div>
<div class="account-content" id="repay">
	<div class="sub-nav">
		<a href="javascript:;" class="active" id="detail-h">还款中</a>
		<a href="javascript:;" id="detail-y">已还款</a>
		<a href="javascript:;" id="detail-m">还款明细</a>
	</div>
	<div class="account-form cl">
		<input type="text" class="date icon icon-date" autocomplete="off" id="d-startDate">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" autocomplete="off" id="d-endDate">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" id="detailSearch">搜索</button>
	</div>
	<div class="listTable1">
		<ul class="detailData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">协议</div>
				<div class="children2">借款类型</div>
				<div class="children3">借款金额</div>
				<div class="children4">年利率</div>
				<div class="children5">还款期限</div>
				<div class="children6">借款时间</div>
				<div class="children7">应还本息</div>
				<div class="children8">操作</div>
			</li>
		</ul>
		<ul class="detailData listData">
		</ul>
		<ul class="paging detailPaging">
		</ul>
	</div>
	<div class="listTable2">
		<ul class="detailData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">协议</div>
				<div class="children2">借款金额</div>
				<div class="children3">年利率</div>
				<div class="children4">借款期限</div>
				<div class="children5">借款时间</div>
				<div class="children6">已还本息</div>
				<div class="children7">逾期罚息</div>
				<div class="children8">操作</div>
			</li>
		</ul>
		<ul class="detailData listData">
		</ul>
		<ul class="paging detailPaging">
		</ul>
	</div>
	<div class="listTable3">
		<ul class="detailData list-box">
			<li class="title">
				<div class="children0">标题</div>
				<div class="children1">第几期</div>
				<div class="children2">应还款日期</div>
				<div class="children3">实际还款日期</div>
				<div class="children4">本期应还本息</div>
				<div class="children5">利息</div>
				<div class="children6">逾期罚款</div>
				<div class="children7">逾期天数</div>
				<div class="children8">还款状态</div>
				<div class="children9">操作</div>
			</li>
		</ul>
		<ul class="detailData listData">
		</ul>
		<ul class="paging detailPaging">
		</ul>
	</div>
</div>
<div class="popup repay-detail">
	<p class="title left">还款明细</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-list">
		<ul class="repay-detail-data list-box">
			<li class="">
				<div class="children0">序号</div>
				<div class="children1">还款日期</div>
				<div class="children2">还款本息</div>
				<div class="children3">实还日期</div>
				<div class="children4">逾期天数</div>
				<div class="children5">实还本息</div>
				<div class="children6">逾期罚款</div>
				<div class="children7">应还总额</div>
				<div class="children8">状态</div>
				<div class="children9">操作</div>
			</li>
		</ul>
		<ul class="listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
</div>
<div class="popup contract-detail">
	<p class="title left">借款合同</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-list">
		<ul class="contract-detail-data list-box">
			<li class="">
				<div class="children0">借款标题</div>
				<div class="children1">借款人</div>
				<div class="children2">投资人</div>
				<div class="children3">查看合同</div>
				<div class="children4">下载合同</div>
			</li>
		</ul>
		<ul class="listData">
		</ul>
		<ul class="paging">
		</ul>
	</div>
</div>
<div class="popup repay-from">
	<p class="title left">还款</p>
	<a href="javascript:void(0);" class="close icon icon-close"></a>
	<div class="popup-from">
			<div class="label cl"> 
				<label class="long">账户余额：</label><p class="text" id="repay-amt">--</p>
			</div>
			<div class="label cl">
				<label class="long">可用余额：</label><p class="text" id="repay-use">--</p>
			</div>
			<div class="label cl">
				<label class="long">还款日期：</label><p class="text" id="repay-redate">--</p>
			</div>
			<div class="label cl">
				<label class="long">待还本息：</label><p class="text" id="repay-dbent">--</p>
			</div>
			<div class="label cl">
				<label class="long">逾期本息：</label><p class="text" id="repay-rbent">--</p>
			</div>
			<div class="label cl">
				<label class="long">需还金额：</label><p class="text" id="repay-must">--</p>
			</div>
			<div class="label cl">
				<label class="long">交易密码：</label><input type="password" autocomplete="off" maxlength="16" id="use-password" placeholder="请输入交易密码">
			</div>
			<div class="label cl">
				<label class="long">验证码：</label><input type="text" class="img" autocomplete="off" maxlength="16" id="input-imgCode" placeholder="请输入图形验证码"><img id="imgCode" src="http://120.76.203.19:8090/shzc_test/WEB-PC/account.html">
			</div>
			<button type="button" class="btn" id="repay-submit">还款</button>
	</div>		
</div>

<div class="account-content" id="repayEdit" style="display: none;">
	<p class="tips-title">
		<b>自动还款工具说明:</b><br>
		a）用户开启自动还款设置后，到达还款日的当天12点15分，如果用户账户正常，即会自动进行还款。<br>
		b）保证用户账户可用余额足够支付还款金额，如果还款日当天超过12点15分用户账户可用余额不足而导致自动还款失败，则用户需要进行手动还款，否则会造成还款逾期。
	</p>
	<div class="popup-from">
		<div class="div_state">
			<label class="text_div">账户余额：</label><p class="div_state_text" id="payment_money">--</p>
		</div>
		<div class="div_state">
			<label class="text_div">自动还款状态：</label><p class="div_state_text" id="payment_state">--</p>
		</div>
		<div class="div_state">
			<label class="text_div">操作：</label><p class="div_state_text"><button type="button" class="btn_start" id="payment_btn">开启</button></p>
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