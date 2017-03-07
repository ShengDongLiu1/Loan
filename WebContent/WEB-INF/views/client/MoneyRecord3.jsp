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


</script>
</head>

<body bgcolor="#FFFFCC">
	<jsp:include flush="true" page="top.jsp"></jsp:include>
		<div class="account cl">
		<div class="account-left">
			<div class="account-left-nav">
				<div class="navbar icon icon-account">我的账户</div>
				<ul class="sub-nav">
					<li class="active"><a href="<%=path %>/client/left?uid=${customer.uid}">账户总览</a></li>
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
	<div class="account-form cl">
		<p class="text long">交易时间：</p>
		<input type="text" class="date icon icon-date" id="time" readonly="readonly">
		<p class="text">至</p>
		<input type="text" class="date icon icon-date" id="time1" readonly="readonly">
		<!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
		<button type="button" class="search" onclick="">搜索</button>
	</div>
	<div></div>	
		
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		<div id="angodiv2">
	
	<table class="table" style="border: 2px solid; border-color: #DFF0D8;">
				<thead>
					<tr>
						<th width="150px">还款时间</th>
						<th width="150px">还款状态</th>
						<th width="150px">应还金额</th>
						<th width="150px">可用余额</th>
						<th width="150px">操作</th>
					</tr>
				</thead>
				<tbody>
							<c:forEach var="list" items="${replist.rows}" >
								<tr class="success">
									<td><fmt:formatDate value="${list.rtime}" type="both"/></td>
									<td>${list.rstate}</td>
									<td>${list.rmoney}</td>
									<td>${list.capital.available}</td>
									<td>
										<c:choose>
											<c:when test="${list.rtype == 1}">已还款</c:when>
											<c:when test="${list.rtype == 2}">未还款</c:when>
											<c:when test="${list.rtype == 3}">还款中</c:when>
											<c:otherwise>审核中</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							
				</tbody>
			</table>
			<div>
								<a href="<%=path %>/capital/selectAngodiv1?state=3&page=${replist.pageNo - 1}"  style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">上一页</a>&nbsp;&nbsp;
								<a href="<%=path %>/capital/selectAngodiv1?state=3&page=${replist.pageNo + 1}" onclick="mygoods(3)" style="background:#224762;color:white;font-size:15px;border-radius:5px;text-decoration:none;">下一页</a>&nbsp;&nbsp;
								当前页 第<span id="page">${replist.pageNo}</span>页&nbsp;&nbsp;
								共<span id="count">${replist.total}</span>页&nbsp;&nbsp;
								共<span id="total">${count}</span>条数据&nbsp;&nbsp;
							</div>
		</div>
		</div>

		</div>
		<!-- end -->
	</div>
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
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
</body>

</html>
