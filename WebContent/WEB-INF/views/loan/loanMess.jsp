<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>鸿金金融</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/all.js"></script>
</head>
<body>
	<div class="bor_det_onel fl">
		<p class="bor_p1">中兴财富平台的借款功能旨在帮助借款用户以 低成本获得借款。用户在需要资金时，可以将
			自有房产和车产作为抵押物，小油菜线下审核 通过后，根据抵押物的价值融资。</p>
		<p class="bor_p2">中兴财富平台的借款功能旨在帮助借款用户以 低成本获得借款。用户在需要资金时，可以将
			自有房产和车产作为抵押物，小油菜线下审核 通过后，根据抵押物的价值融资。</p>
		<h3 class="bor_onel_tit">
			<span>申请条件</span>
		</h3>
		<ul class="bor_onel_ul">
			<li><img src="<%=path%>/images/bor_pic01.png" alt="">年满18周岁以上的公民
			</li>
			<li><img src="<%=path%>/images/bor_pic02.png" alt="">需要北京房产或车产抵押
			</li>
			<li><img src="<%=path%>/images/bor_pic03.png" alt="">个人或企业银行征信记录良好
			</li>
			<li><img src="<%=path%>/images/bor_pic04.png" alt="">
				无现有诉讼记录</li>

		</ul>
		<h3 class="bor_onel_tit">
			<span>提交资料</span>
		</h3>
		<ul class="bor_onel_ul">
			<li>&nbsp;<img src="<%=path%>/images/bor_pic13.png" alt="">身份证</li>
			<li><img src="<%=path%>/images/bor_pic10.png" alt="">有效户籍证明</li>
			<li><img src="<%=path%>/images/bor_pic11.png" alt="">收入证明</li>
			<li><img src="<%=path%>/images/bor_pic12.png" alt="">个人信用报告</li>
			<li><img src="<%=path%>/images/bor_pic15.png" alt="">申请资料</li>
			<li><img src="<%=path%>/images/bor_pic14.png" alt="">其他</li>
			

		</ul>
	</div>
</body>
</html>