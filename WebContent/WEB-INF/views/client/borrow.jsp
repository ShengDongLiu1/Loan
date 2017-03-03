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
<title>我要借款</title> 
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/lotable.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/all.js"></script>
<script type="text/javascript" src="<%=path %>/js/loan/loan.js"></script>
<script type="text/javascript" src="<%=path %>/js/toDate.js"></script>
<style type="text/css">
.mess{color:red;}
</style>
</head>
<body>
<jsp:include flush="true" page="top.jsp"></jsp:include>
<!-- end  -->
<div class="bor_banner01">
	 
</div>
<!-- end banner -->
<div class="bor_con_wper">
	  <div class="bor_con px1000">
	  	    <div class="bor_detail">
  	    	   <h2 class="bor_detail_tit">
  	    	   	  <span class="bor_decurspan">房产抵押</span>
  	    	   	  <span>车辆抵押</span>
  	    	   	  <span>信用贷款</span>
  	    	   	  <c:if test="${customer != null }">
  	    	   	  	<span onclick="selCusLoan();">我的借款</span>
  	    	   	  </c:if>
  	    	   </h2>
  	    	   <div class="bor_detail_box">
  	    	   	    <div class="bor_det_one clearfix pt30 pb30">
  	    	   	    	  <jsp:include page="../loan/loanMess.jsp"></jsp:include>
  	    	   	    	  <!-- end l -->
  	    	   	    	  <div class="bor_det_oner fl">
 	    	   	    	  	     <form action="<%=path %>/loan/addLoan" method="post">
 	    	   	    	  	     	  <fieldset>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款金额</label>
 	    	   	    	  	     	  	   	   <input type="number" name="lmoney" class="bor_inputbg01">
 	    	   	    	  	     	  	   	   <span class="mess" id="me1"></span>
 	    	   	    	  	     	  	   </div>
                                             <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款期限</label>
 	    	   	    	  	     	  	   	   <input type="number" name="lterm" class="bor_inputbg02">
 	    	   	    	  	     	  	   	   <span class="mess" id="me2"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款利率</label>
 	    	   	    	  	     	  	   	   <input type="text" name="lrate" class="bor_inputbg06">
 	    	   	    	  	     	  	   	   <span class="mess" id="me3"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15 guarmethod clearfix">
 	    	   	    	  	     	  	   	   <label class="guarmethod_l fl">*担保方式</label>
 	    	   	    	  	     	  	   	   <input type="hidden" name="lclass" value="房产抵押" />
 	    	   	    	  	     	  	   	   <div class="fl">
 	    	   	    	  	     	  	   	   	  <span>房屋数量</span>
 	    	   	    	  	     	  	   	   	  <input type="number" name="lnums" class="bor_inputbg03 input2">
 	    	   	    	  	     	  	   	   	  <span class="mess" id="me4"></span>
 	    	   	    	  	     	  	   	   	  <br /><br />
 	    	   	    	  	     	  	   	   	  <span>总价值</span>
 	    	   	    	  	     	  	   	   	  <input type="number" name="lmoneys" class="bor_inputbg04 input2">
 	    	   	    	  	     	  	   	   	  <span class="mess" id="me5"></span><br>
 	    	   	    	  	     	  	   	   </div>
 	    	   	    	  	     	  	   	   
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款类型</label>
 	    	   	    	  	     	  	   	   <select name="ltype">
 	    	   	    	  	     	  	   	   	  <option value="">选择借款类型</option>
 	    	   	    	  	     	  	   	   	  <option value="秒还借款">秒还借款</option>
 	    	   	    	  	     	  	   	   	  <option value="机构担保借款">机构担保借款</option>
 	    	   	    	  	     	  	   	   </select>
 	    	   	    	  	     	  	   	   <span class="mess" id="me6"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	    <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款标题</label>
 	    	   	    	  	     	  	   	   <input type="text" name="ltitle" class="bor_inputbg">
 	    	   	    	  	     	  	   	   <span class="mess" id="me7"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	    <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款描述</label> 
 	    	   	    	  	     	  	   	   <textarea name="lmiaoshu"></textarea>
 	    	   	    	  	     	  	   	   <span class="mess" id="me8"></span>
 	    	   	    	  	     	  	   	 
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <!-- <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款情况</label>
 	    	   	    	  	     	  	   	   <input type="radio" class="input3">
 	    	   	    	  	     	  	   	   普通借款
 	    	   	    	  	     	  	  	   <input type="radio" class="input3">
 	    	   	    	  	     	  	   	   紧急借款 
 	    	   	    	  	     	  	   </div> -->
 	    	   	    	  	     	  	   <c:if test="${customer != null }">
  	    	   	    	  	     	  	   <div class="mt30">
  	    	   	    	  	     	  	   	   <label></label>
  	    	   	    	  	     	  	   	   <input type="submit" value="提交申请" class="bor_btn" onclick="return checkLoan();" style="background:#FFA800;border:none;padding-left:45px;"/>
  	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   </c:if>
 	    	   	    	  	     	  </fieldset>
 	    	   	    	  	     </form>
  	    	   	    	  </div>
  	    	   	    </div>

					<!-- 车辆抵押 -->	  	    	   	    
  	    	   	    <div class="bor_det_one clearfix pt30 pb30" style="display:none;">
  	    	   	    	  <jsp:include page="../loan/loanMess.jsp"></jsp:include>
  	    	   	    	  <div class="bor_det_oner fl">
 	    	   	    	  	     <form action="<%=path %>/loan/addLoan" method="post">
 	    	   	    	  	     	  <fieldset>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款金额</label>
 	    	   	    	  	     	  	   	   <input type="number" name="lmoney" class="bor_inputbg01">
 	    	   	    	  	     	  	   	   <span class="mess" id="me21"></span>
 	    	   	    	  	     	  	   </div>
                                             <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款期限</label>
 	    	   	    	  	     	  	   	   <input type="number" name="lterm" class="bor_inputbg02">
 	    	   	    	  	     	  	   	   <span class="mess" id="me22"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款利率</label>
 	    	   	    	  	     	  	   	   <input type="text" name="lrate" class="bor_inputbg06">
 	    	   	    	  	     	  	   	   <span class="mess" id="me23"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15 guarmethod clearfix">
 	    	   	    	  	     	  	   	   <label class="guarmethod_l fl">*担保方式</label>
 	    	   	    	  	     	  	   	   <input type="hidden" name="lclass" value="车辆抵押" />
 	    	   	    	  	     	  	   	   <div class="fl">
 	    	   	    	  	     	  	   	   	  <span>车辆数量</span>
 	    	   	    	  	     	  	   	   	  <input type="number" name="lnums" class="bor_inputbg05 input2">
 	    	   	    	  	     	  	   	   	   <span class="mess" id="me24"></span>
 	    	   	    	  	     	  	   	   	  <br><br>
 	    	   	    	  	     	  	   	   	  <span>总价值</span>
 	    	   	    	  	     	  	   	   	  <input type="number" name="lmoneys" class="bor_inputbg04 input2">
 	    	   	    	  	     	  	   	   	  <span class="mess" id="me25"></span><br>
 	    	   	    	  	     	  	   	   </div>
 	    	   	    	  	     	  	   	   
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款类型</label>
 	    	   	    	  	     	  	   	   <select name="ltype">
 	    	   	    	  	     	  	   	   	  <option value="">选择借款类型</option>
 	    	   	    	  	     	  	   	   	  <option value="秒还借款">秒还借款</option>
 	    	   	    	  	     	  	   	   	  <option value="机构担保借款">机构担保借款</option>
 	    	   	    	  	     	  	   	   </select>
 	    	   	    	  	     	  	   	   <span class="mess" id="me26"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	    <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款标题</label>
 	    	   	    	  	     	  	   	   <input type="text" name="ltitle" class="bor_inputbg">
 	    	   	    	  	     	  	   	   <span class="mess" id="me27"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	    <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款描述</label> 
 	    	   	    	  	     	  	   	   <textarea name="lmiaoshu"></textarea>
 	    	   	    	  	     	  	   	   <span class="mess" id="me28"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <c:if test="${customer != null }">
  	    	   	    	  	     	  	   <div class="mt30">
  	    	   	    	  	     	  	   	   <label></label>
  	    	   	    	  	     	  	   	   <input type="submit" value="提交申请" class="bor_btn" onclick="return checkLoan1();" style="background:#FFA800;border:none;padding-left:45px;"/>
  	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   </c:if>
 	    	   	    	  	     	  </fieldset>
 	    	   	    	  	     </form>
  	    	   	    	  </div>
  	    	   	    </div>
  	    	   	    
  	    	   	    <!-- 信用贷款 -->
  	    	   	    <div class="bor_det_one clearfix pt30 pb30" style="display:none;">
  	    	   	    	 <jsp:include page="../loan/loanMess.jsp"></jsp:include>
  	    	   	    	 
  	    	   	    	 <div class="bor_det_oner fl">
 	    	   	    	  	     <form action="<%=path %>/loan/addLoan" method="post">
 	    	   	    	  	     	  <fieldset>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款金额</label>
 	    	   	    	  	     	  	   	   <input type="number" name="lmoney" class="bor_inputbg01">
 	    	   	    	  	     	  	   	   <span class="mess" id="me31"></span>
 	    	   	    	  	     	  	   </div>
                                             <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款期限</label>
 	    	   	    	  	     	  	   	   <input type="number" name="lterm" class="bor_inputbg02">
 	    	   	    	  	     	  	   	   <span class="mess" id="me32"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款利率</label>
 	    	   	    	  	     	  	   	   <input type="text" name="lrate" class="bor_inputbg06">
 	    	   	    	  	     	  	   	   <span class="mess" id="me33"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15 guarmethod clearfix">
 	    	   	    	  	     	  	   	   <label class="guarmethod_l fl">*担保方式</label>
 	    	   	    	  	     	  	   	   <input type="text" name="lclass" value="信用贷款" readonly="readonly"/>
 	    	   	    	  	     	  	   	   <span class="mess" id="me34"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款类型</label>
 	    	   	    	  	     	  	   	   <select name="ltype">
 	    	   	    	  	     	  	   	   	  <option value="">选择借款类别</option>
 	    	   	    	  	     	  	   	   	  <option value="秒还借款">秒还借款</option>
 	    	   	    	  	     	  	   	   	  <option value="机构担保借款">机构担保借款</option>
 	    	   	    	  	     	  	   	   </select>
 	    	   	    	  	     	  	   	   <span class="mess" id="me36"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	    <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款标题</label>
 	    	   	    	  	     	  	   	   <input type="text" name="ltitle" class="bor_inputbg">
 	    	   	    	  	     	  	   	   <span class="mess" id="me37"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	    <div class="mt15">
 	    	   	    	  	     	  	   	   <label>*借款描述</label> 
 	    	   	    	  	     	  	   	   <textarea name="lmiaoshu"></textarea>
 	    	   	    	  	     	  	   	   <span class="mess" id="me38"></span>
 	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   <c:if test="${customer != null }">
  	    	   	    	  	     	  	   <div class="mt30">
  	    	   	    	  	     	  	   	   <label></label>
  	    	   	    	  	     	  	   	   <input type="submit" value="提交申请" class="bor_btn" onclick="return checkLoan2()" style="background:#FFA800;border:none;padding-left:45px;"/>
  	    	   	    	  	     	  	   </div>
 	    	   	    	  	     	  	   </c:if>
 	    	   	    	  	     	  </fieldset>
 	    	   	    	  	     </form>
  	    	   	    	  </div>
  	    	   	    </div>
  	    	   	    <!-- end 信用贷款 -->
  	    	   	    
  	    	   	    <!-- 我的借款 -->
  	    	   	    <div class="bor_det_one clearfix pt30 pb30" style="display:none;">
  	    	   	    	<table id="lotab">
  	    	   	    		<thead>
  	    	   	    			<tr class="loantr loh">
  	    	   	    				<td>编号</td>
  	    	   	    				<td>借款标题</td>
  	    	   	    				<td>借款金额</td>
  	    	   	    				<td>期数</td>
  	    	   	    				<td>利率</td>
  	    	   	    				<td>担保方式</td>
  	    	   	    				<td>数量</td>
  	    	   	    				<td>价值</td>
  	    	   	    				<td>价款类型</td>
  	    	   	    				<td>描述</td>
  	    	   	    				<td>状态</td>
  	    	   	    				<td>申请时间</td>
  	    	   	    				<td>上传资料</td>
  	    	   	    			</tr>
  	    	   	    		</thead>
  	    	   	    		<tbody id="cusLoan">
  	    	   	    			<tr class="loantr"></tr>
  	    	   	    		</tbody>
  	    	   	    		<tfoot>
  	    	   	    			<tr class="loantr loh">
  	    	   	    				<td colspan="13">
  	    	   	    					<a href="javascript:void(0)" onclick="selCusLoan(2);">上一页</a>&nbsp;&nbsp;&nbsp;
  	    	   	    					<a href="javascript:void(0)" onclick="selCusLoan(3);">下一页</a>&nbsp;&nbsp;&nbsp;
  	    	   	    					当前页 第<span id="page"></span>页&nbsp;&nbsp;&nbsp;
										共<span id="count"></span>页&nbsp;&nbsp;&nbsp;
										共<span id="total"></span>条数据
  	    	   	    				</td>
  	    	   	    			</tr>
  	    	   	    		</tfoot>
  	    	   	    	</table>
  	    	   	    </div>
  	    	   	    
  	    	   	    <!-- 资料上传 -->
  	    	   	    <div id="upfile" >
  	    	   	    	<p id="title"><span id="close"><a href="javascript:void(0)">关闭</a></span></p>
  	    	   	    	<p id="fmes">*为了更好的审核，请一次性把资料上传完整</p>
  	    	   	    	<form action="<%=path %>/datum/addDatum" method="post" enctype="multipart/form-data">
  	    	   	    		<input type="hidden" name="lid" id="flid">
  	    	   	    		<label for="sort_1">
  	    	   	    			<span class="files" id="files1">身份证</span>
  	    	   	    			<input type="file" name="file1" id="sort_1" onchange="getFileName('files1');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_2">
  	    	   	    			<span class="files" id="files2">有效户籍证明</span>
  	    	   	    			<input type="file" name="file2" id="sort_2" onchange="getFileName('files2');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_3">
  	    	   	    			<span class="files" id="files3">收入证明</span>
  	    	   	    			<input type="file" name="file3" id="sort_3" onchange="getFileName('files3');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_4">
  	    	   	    			<span class="files" id="files4">个人信用报告</span>
  	    	   	    			<input type="file" name="file4" id="sort_4" onchange="getFileName('files4');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_5">
  	    	   	    			<span class="files" id="files5">申请资料</span>
  	    	   	    			<input type="file" name="file5" id="sort_5" onchange="getFileName('files5');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_6">
  	    	   	    			<span class="files" id="files6">其他</span>
  	    	   	    			<input type="file" name="file6" id="sort_6" onchange="getFileName('files6');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_7">
  	    	   	    			<span class="files" id="files7">其他</span>
  	    	   	    			<input type="file" name="file7"  id="sort_7" onchange="getFileName('files7');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		
  	    	   	    		<label for="sort_8">
  	    	   	    			<span class="files" id="files8">其他</span>
  	    	   	    			<input type="file" name="file8" id="sort_8" onchange="getFileName('files8');" style="display:none;">
  	    	   	    		</label>
  	    	   	    		<p style="clear:both;"></p>
  	    	   	    		
  	    	   	    		<input id="subfile" type="submit" value="开始上传">
  	    	   	    	</form>
  	    	   	    </div>
  	    	   </div>
	  	    </div>
	  </div>
</div>
<jsp:include flush="true" page="bottom.jsp"></jsp:include>
<script type="text/javascript">
	var result='${result}';
	if(result !=''){
		alert(result);
	}
</script>
</body>
</html>