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
<link rel="icon" href="<%=path %>/images/logo.jpg" type="image/x-icon"/> 
<title>鸿金金融</title> 
<link rel="stylesheet" href="/Loan/css/pjcss/public.css">
<link rel="stylesheet" href="/Loan/css/pjcss/account.css">
<link rel="stylesheet" href="/Loan/css/pjcss/datepicker.css">
<link rel="stylesheet" href="/Loan/css/lanrenzhijia.css" media="all">
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>

<script type="text/javascript">	
	jQuery(document).ready(function() {
		$.post("<%=path%>/withdrawals/queryBank",function(data){
			var uu=$("#wbank");
			var str="";
			for(var o in data) {
				str += '<option value="'+data[o].bcardnumber+'-'+data[o].baccount+'">'+data[o].bcardnumber+'&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;'+data[o].baccount+'</option>';
			}
			uu.append(str);
		});
		$.post("<%=path%>/withdrawals/queryCapital",function(data){
			var uu=$("#usableSum");
			var str="";
			for(var o in data) {
				str += '<input class="text color" id="cash-usableSum" value="'+data[o].available+'" readonly />';
			}
			uu.append(str);
		});
	});
</script>
<script type="text/javascript">
	 $(function(){  
	        var tixian = $("#tixian");// 获得ID为tixian标签的jQuery对象  
	        var shoxufei = $("#shoxufei");// 获得ID为shoxufei标签的jQuery对象  
	        
	        tixian.change(function(){  
	            var num1 = tixian.val();// 取得tixian对象的值  
	            var num2 = shoxufei.val();// 取得shoxufei对象的值  
	            var sum = xiangcheng(num1);  
	            $("#xcc").val(sum);
	            
	            var sum = add(num1);  
	            $("#xjj").val(sum);
	            
	            sumSP.text(sum);  
	        });  
	    });  
	    
		function xiangcheng(arg1){
			return (arg1*0.01);  
		}
		
		function add(arg1){  
		    return (arg1-(arg1*0.01));  
		}  
</script>
<script type="text/javascript">
	function tixianq(){
		
		$(function(){
			$('input').focus(function(){
				$("span").html( "" );
			});
		});
		
		var wmoney = $("#tixian").val();
		var usableSum = $("#cash-usableSum").val();
		
		if(wmoney == ''){
			$('#shuchu').html('*请填写提现金额');
		}else if(wmoney<100){
			$('#shuchu').html('*提现金额请大于或等于100');
		}else if(wmoney>usableSum){
			$('#shuchu').html('*提现金额不能大于可用余额');
			return false;
		}else{
			return true;
			window.location.href="<%=path%>/client/withdrawalsList?state=2&page=1";
		}
		return false;
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
		<a href="<%=path %>/withdrawals/withdrawalsList?page=1" class="active show-cash">提现记录</a>
	</div>
	<!-- <em class="em-line"></em> -->
</div>
<div class="account-content" style="display: block;">
	<!-- 提现 -->
	<form action="<%=path %>/withdrawals/save" method="post">
	<div class="cash-pay">
		<p class="tips-title">
			<b>温馨提示：</b>凡是在的用户，100天以内提现收取本金0.1%，100天以后提现免费。禁止信用卡套现！<br>
			a）请输入您要提现的金额，我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。<br>
			b）每笔提现金额至少为100元以上。
		</p>
		<div class="pay-from">                                          
			<div class="label cl">
				<label class="long">持卡人：</label><input class="text" id="cash-realName" value="${customer.username}" readonly/>
			</div>
			
			<div class="label cl" id="usableSum">
				<label class="long">可提现金额：</label>
			</div>
			
			<div class="label cl">
				<label class="long">提现至银行：</label>
				<select id="wbank" name="wbank" style="width: 300px;height: 40px;padding-left:5px;"></select>
			</div>
			
			<div class="label cl">
				<label class="long">提现金额：</label><input type="text" maxlength="8" id="tixian" placeholder="请输入提现金额" name="wmoney"  value="${wit.wmoney}" onchange="return"
				 onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
			</div>
			
			<div class="label cl">
				<label class="long">提现手续费：</label><input type="text" class="text" id="xcc" name="wcounterfee" value="${wit.wcounterfee}" placeholder="自动计算" readonly />
			</div>
			<div class="label cl">
				<label class="long">实际到账金额：</label><input type="text" class="text" id="xjj" name="wactual" value="${wit.wactual}" placeholder="自动计算" readonly />
			</div>
			<span style="color:red;margin-left: 35%" id="shuchu"></span>
			<input type="submit" class="btn long disabled" id="cash-submit" value="立即提现" style="background:#FFA800;border:none;" onclick="return tixianq()"/>
		</div>
	</div>
	</form>
	<div class="theme-popover-mask"></div>
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
	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
</html>