<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mod-form">
		<div class="item">
			<label>
				<span class="name">充值金额</span>
				
				<input id="money" type="text" class="inp140" maxlength="15"/>
				 <span style="color: red; float: none;" id="money_tip" class="formtips"></span>
			</label>
		</div>
		<div class="item">
			<span class="name">充值类型</span>
			<label><input type="radio" name="rechargeType" id="chinapnr" checked="checked" /> 汇付天下</label>
			
		</div>
		<div class="blank_30"></div>
		<p class="submit">
			<button class="btn" id="addrecharge">充值</button>
		</p>
	</div>
</body>
</html>