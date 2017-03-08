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
						<th class="center" width="100">账户名</th>
						<th class="center" width="100">充值金额</th>
						<th class="center" width="100">充值类型</th>
						<th class="center" width="100">充值时间</th>
						<th class="center" width="100">充值状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="c" varStatus="status">
						<tr>
							<td class="center" width="100">${c.customer.username }</td>
							<td class="center" width="100">${c.rmoney }</td>
							<td class="center" width="100">${c.rtype }</td>
							<td class="center" width="100"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.rtime }"/></td>
							<td class="center" width="100">${c.rstate }</td>
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
	<script type="text/javascript">
		$('#cz').click(function(){
			window.location.href="<%=path%>/recharge/czadd.do"; 
		})
		$('#ipaySearch').click(function(){
    		var rtime = $('#startDate').val();
    		var rtime1 = $('#endDate').val();
    		if(rtime == ''){
    			alert('开始时间不能为空');
    			return;
    		}
    		if(rtime1 == ''){
    			alert('结束时间不能为空');
    			return;
    		}
    		if(rtime>rtime1){
    			alert('开始时间不能大于结束时间');
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