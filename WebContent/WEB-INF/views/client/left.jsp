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
<title>左边导航</title>
<style>
	#bj{
		width: 100%;
		margin:0px auto;
	}
	.bejing{
		width: 9%;
		margin-left:21%;
		height: 900px;
		background-color: #FFFFFF;
		margin-top: 30px;
		float:left;
	}
	.nav a:hover {
		background: #CCC4F5;
	}
	#youbian{
		width: 50%;
		height: 900px;
		background-color: #FFE1CC;
		float:left;
		margin-top: 30px;
	}
	.account-left{
		text-align: center;
		font-size: 16px;
	}
	
	.account-left .sub-nav {
	    padding: 8px 0;
	}
	
	.account-left .sub-nav  {
	    height: 20px;
	}
	
	.account-left .sub-nav a {
	    height: 20px;
	    line-height: 20px;
	    display: block;
	    color: #777;
	    text-align: center;
	}
	
	.sub-nav  a:hover,
	.sub-nav active a {
		margin-left:20%;
		width:60%;
	    background-color: #CCE1FF;
	    color: #fff;
	}
	.account-left .sub{
		height: 30px;
	    line-height: 30px;
	    font-size:17px;
	    display: block;
	    color: #C4E8F5;
	    text-align: center;
	}
	.hrr{
		width: 140px;
		margin-bottom: 10px;
	}
	#hongjin{
		font-size: 28px;
		font-family: "楷体";
		color: #FFBA00;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.sub .qb{
		background: url('../images/qianbao.png') no-repeat;
	}
	.wo{
		background: url('../images/wo.png') no-repeat;
	}
	.sz{
		background: url('../images/shezhi.png') no-repeat;
	}
</style>
</head>
<body bgcolor="#FFFFCC">
	<jsp:include flush="true" page="top.jsp"></jsp:include>
		<div id="bj">
			<div class="bejing">
				<div class="zuobian">
					<div class="account-left">
						<ul>
							<li id="hongjin"><a href="#">鸿金</a></li>
							<li class="sub" ><a><img src="<%=path %>/images/qianbao.png" alt="">  我的账户</a></li>
								<li><hr class="hrr"></li>
								<li class="sub-nav"><a href="">账户信息</a></li>
								<li class="sub-nav"><a href="">充值</a></li>
								<li class="sub-nav"><a href="">提现</a></li>
								<li class="sub-nav"><a href="">账户记录</a></li>
							<li class="sub"><a><img src="<%=path %>/images/wo.png" alt="">  资金管理</a></li>
								<li><hr class="hrr"></li>
								<li class="sub-nav"><a href="">投资管理</a></li>
								<li class="sub-nav"><a href="">借款管理</a></li>
							<li class="sub"><a><img src="<%=path %>/images/shezhi.png" alt="">  账户设置</a></li>
								<li><hr class="hrr"></li>
								<li class="sub-nav"><a href="">我银行卡</a></li>
								<li class="sub-nav"><a href="">安全设置</a></li>
								<li class="sub-nav"><a href="">消息中心</a></li>
								<li class="sub-nav"><a href="">安全退出</a></li>
						</ul>
					</div>
				</div>
				
			</div>
			
			<div id="youbian">
				
			</div>
		</div>
		
</body>	
</html>