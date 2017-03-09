<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link rel="icon" href="<%=path %>/images/logo.jpg" type="image/x-icon"/> 
<title>鸿金金融</title> 
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
</head>
<body>
<jsp:include flush="true" page="top.jsp"></jsp:include>
<!-- end  -->
<div class="invest_con_wper">
	  <div class="invest_con px1000">
	  	     <div class="product_choose">
	  	     	    <h2 class="product_tit clearfix">
	  	     	       <em class="proall fl">全部理财产品</em>
	  	     	      
	  	     	    </h2>
	  	     </div>
	  	     <!-- end block -->
	  	    <h3 class="sort_tit mt30"><em>排序</em>
	  	    <span>综合排序</span>
	  	    <span>收益率<img src="<%=path %>/images/invest_jiantou.png" alt=""></span>
	  	    <span>发布时间<img src="<%=path %>/images/invest_jiantou.png" alt=""></span>
	  	    <span>项目期限<img src="<%=path %>/images/invest_jiantou.png" alt=""></span>
	  	    </h3>
	  	
	  	    <div class="product_list mt20">
	  	        <c:forEach var="list" items="${loan1}" varStatus="status">
					 <tr class="success">
						<td>
						   <div class="prolist_one prolist_one_bl01 mt20">
		  	    	           <h2 class="prolist_one_tit"><span style="width: auto;">${list.ltitle}</span>
	                           </h2>
	                           <ul class="prolist_one_ul clearfix">
	                           	   <li>
	                           	   	   年华收益：<strong>12.49%</strong><br>
	                           	   	   还款方式：按月付息，到期还本
	                           	   </li>
	                           	   	<li>描述：${list.lmiaoshu }</li>
	                           	   	<li>类型：${list.ltype }</li>
	                           	   <li>
	                           	   	   剩余期限：<i>308</i>天<br>
	                                    保障机构：中融兴业融资担保有限公司
	                           	   </li>
	                           	   <li class="prolist_press">
	                           	   	   募集金额：<strong>${list.lmoney}</strong> 元 <br>
	                                   认购进度：<span class="ui-progressbar-mid ui-progressbar-mid-100">100%</span>
	                           	   </li>
	                           	   <li class="prolist_btn">
	                           	   	    <a href="<%=path %>/client/detail1?lid='${list.lid}'" class="pro_btn">立即投资</a>
	                           	   </li>
	                           </ul>
		  	             </div>
						</td>
					</tr>
				</c:forEach>  
	  	    
	             <!-- end one -->
	             <!-- pagelink -->
	              <p class="pagelink" style="width: 400px;">
	                 <a href="<%=path %>/client/invest?page=1&rows=10">1</a>
	             	 <a href="<%=path %>/client/invest?page=2&rows=10">2</a>
	                 <a href="<%=path %>/client/invest?page=3&rows=10">3</a>
	               	 <a href="javascript:void(0);" onclick="fenye()">上一页</a>
					<a href="javascript:void(0);" onclick="fenye2()">下一页</a>
	              </p>
	             <!-- pagelink end -->
	  	    </div>
	  </div>
</div>
<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function fenye(){
		var page1 = ${page};
		var a = page1 - 1
		if(a>0){
			window.location.href="<%=path %>/client/invest?page=${page-1}&rows=10"
		}
	}
	function fenye2(){
		var count = ${count};
		var page1 = ${page};
		var a = page1 + 1
		if(a<=count){
			window.location.href="<%=path %>/client/invest?page=${page+1}&rows=10"
		}
	}
</script>
</html>