<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>借款列表</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" href="<%=path %>/css/loan.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
<script type="text/javascript" src="<%=path %>/js/toDate.js"></script>

<style type="text/css">

.easyui-textbox,.easyui-numberbox{width:10%;}

.dj:link{color:orange;}

.jd:link{color:green;}

.combobox-item{text-align:center;}
</style>
<script>
$(function(){
	//setPagination("list");
/**	$(document).bind('contextmenu',function(e){	//给网页绑定右键菜单
		e.preventDefault();		//阻止浏览器的默认右键菜单
		$("#mm").menu('show',{
			left:e.pageX,	//鼠标右键的x坐标
			top:e.pageY		//鼠标右键的y坐标
		});
	});
*/
	function setPagination(tableid){
		var op=$("#"+tableid).datagrid("getPager");	//分页组件
		$(op).pagination({
			pageList:[10,15,20,25,30],
			beforePageText:"第",
			afterPageText:"页	共{pages}页",
			displayMsg:"当前显示{from}-{to}条记录 	共{total}条记录",
			onBeforRefresh:function(){
				$(this).pagination("loading");
				$(this).pagination("loaded");
			}
		});
	}
	$(function(){
		setPagination("list");
	});
	
	$("#list").datagrid({
		onRowContextMenu:function(e,rowIndex,rowData){
			e.preventDefault();
			$("#mm").menu('show',{
				left:e.pageX,
				top:e.pageY	
			});
		},
	});
	
});

	//条件查询
	function seachs(){
		var username = $('#susername').textbox('getValue');
		var ltitle = $('#sltitle').numberbox('getValue');
		var ltype = $('#sltype').combobox('getValue');
		var lstate = $('#slstate').combobox('getValue');
		var lclass = $('#slclass').combobox('getValue');
		$('#list').datagrid('load',{  
			username:username,
			ltitle:ltitle,
			ltype:ltype,
			lstate:lstate,
			lclass:lclass
		}); 
	}
	
	//真实姓名
	function trueName(val,obj){
		return obj.customer.realname;
	}
	
	//利率
	function liLV(val){
		return val+"%";
	}
	
	//借款期限
	function qixian(val){
		return val+"个月";
	}
	
<<<<<<< Updated upstream
	//房屋或车辆数量
	function shuliang(val,obj){
		if(obj.lclass == '信用贷款'){
			return "无";
		}else{
			return obj.lnums;
		}
	}
	
	//房屋或车辆价值
	function jiazhi(val,obj){
		if(obj.lclass == '信用贷款'){
			return "无";
		}else{
			return obj.lmoneys;
		}
	}
	
=======
>>>>>>> Stashed changes
	//借款状态
	function lstate(value){
		var btn="";
		if(value == 0){
			btn="未通过";
		}else if(value == 1){
			btn="初审中";
		}else if(value == 2){
			btn="招标中";
		}else if(value == 3){
			btn="满标";
		}else if(value == 4){
			btn="还款中";
		}else if(value == 5){
			btn="已还款";
		}else if(value == 6){
			btn="流标";
		}
		return btn;
	}
	
<<<<<<< Updated upstream
	//操作
	function caozuo(val,obj){
		var btn="<a href='#' onclick='selDatum("+obj.lid+");'>查看</a>&nbsp;";
		var lstate='${lstate}'
		if(lstate == 1){
			btn+="<a href='javascript:void(0)' onclick='upState("+obj.lid+","+2+");'>通过</a>&nbsp;";
			btn+="<a href='javascript:void(0)' onclick='upState("+obj.lid+","+0+");'>不通过</a>";
		}
=======
	function caozuo(){
		var btn="<a href='#'>查看</a>";
>>>>>>> Stashed changes
		return btn;
	}
	
	
	//审批改状态
	function upState(lid,lstate){
		$.post("<%=path%>/loan/succLoan",{'lid':lid,'lstate':lstate},function(index){
			if(index.result == 'success'){
				$.messager.alert('系统提示','操作成功！','info');
				$("#list").datagrid("reload");
			}else{
				$.messager.alert('系统提示','操作失败，请重试！','info');
			}
		});
	}
	
	//查询上传的资料
	function selDatum(lid){
		$.post("<%=path%>/datum/selDatum",{'lid':lid},function(index){
			if(index.datum == null){
				$.messager.alert('系统提示','申请人暂未上传任何资料！','info');
				return false;
			}
			$('#ld1').html(notImg(index.datum.dcard)+"<span>身份证</span>");
			$('#ld2').html(notImg(index.datum.household)+"<span>户籍证明</span>");
			$('#ld3').html(notImg(index.datum.dcensus)+"<span>收入证明</span>");
			$('#ld4').html(notImg(index.datum.dcredit)+"<span>个人信用报告</span>");
			$('#ld5').html(notImg(index.datum.dapply)+"<span>申请资料</span>");
			$('#ld6').html(notImg(index.datum.dother1)+"<span>其他</span>");
			$('#ld7').html(notImg(index.datum.dother2)+"<span>其他</span>");
			$('#ld8').html(notImg(index.datum.dother3)+"<span>其他</span>");
			$('#win').window('open');
		});
	}
	
	//判断是否上传资料
	function notImg(img){
		if(img == null || img == ''){
			return "<p class='notl'>未上传</p>";
		}else{
			var img1="<img src='../portrait/";
			var img2="' />";
			return img1+img+img2;
		}
	}
	
</script>
</head>
<body>
	<table id="list" class="easyui-datagrid" toolbar="#kj" style="width:100%" data-options="
		url:'<%=path %>/loan/loanList',
		<c:if test="${lstate != ''}">
			queryParams:{lstate:${lstate}},
		</c:if>
		method:'post',
		rownumbers:true,	
		singleSelect:false,
		autoRowHeight:true,
		pagination:true,
		border:false,
		pageSize:20,
		fit:true
	">
		<thead data-options="frozen:true">
			<tr>
				<th field="lid" checkbox="true">编号</th>
				<th field="truename" width="6%" align="center" formatter="trueName">姓名</th>
				<th field="ltitle" width="8%" align="center">借款标题</th>
				<th field="lmoney" width="6%" align="center">借款金额</th>
				<th field="lrate" width="5%" align="center" formatter="liLV">利率</th>
				<th field="lterm" width="5%" align="center" formatter="qixian">借款期限</th>
				<th field="lclass" width="8%" align="center">担保方式</th>
<<<<<<< HEAD
<<<<<<< Updated upstream
				<th field="lnums1" width="6%" align="center" formatter="shuliang">数量</th>
=======
				<th field="lnums1" width="5%" align="center" formatter="shuliang">数量</th>
>>>>>>> master
				<th field="lmoneys1" width="8%" align="center" formatter="jiazhi">价值</th>
=======
				<th field="lnums" width="6%" align="center">数量</th>
				<th field="lmoneys" width="8%" align="center">价值</th>
>>>>>>> Stashed changes
				<th field="lmiaoshu" width="13%" align="center">借款描述</th>
				<th field="ltype" width="8%" align="center">借款类型</th>
				<th field="lstate" width="5%" align="center" formatter="lstate">借款状态</th>
				<th field="ltime" width="9%" align="center" formatter="jsonDateFormat">筹标时间</th>
				<th field="caozuo" width="11%" align="center" formatter="caozuo">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- 菜单 -->
	<div id="kj" style="padding: 2px;">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="window.print();">打印</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-export1'" onclick="location.href='#'">导出</a>
		用户名：<input id="susername" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		借款标题：<input id="sltitle" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		抵押类型：<select id="slclass" class="easyui-combobox" data-options="editable:false" style="width:10%;padding-left:23px;">
			<option value="">--请选择--</option>
			<option value="房产抵押">房产抵押</option>
			<option value="车辆抵押">车辆抵押</option>
			<option value="信用贷款">信用贷款</option>
<<<<<<< Updated upstream
=======
			<option value="零首付车贷">零首付车贷</option>
>>>>>>> Stashed changes
		</select>
		借款类型：<select id="sltype" class="easyui-combobox" data-options="editable:false" style="width:10%;padding-left:23px;">
			<option value="">--请选择--</option>
			<option value="借款">借款</option>
			<option value="利息">利息</option>
		</select>
		<c:if test="${lstate == null || lstate == ''}">
			借款状态：<select id="slstate" class="easyui-combobox" data-options="editable:false" style="width:10%;padding-left:23px;">
				<option value="">--请选择--</option>
				<option value="1">初审中</option>
				<option value="2">招标中</option>
				<option value="3">满标</option>
				<option value="4">还款中</option>
				<option value="5">已还款</option>
				<option value="6">流标</option>
			</select>
		</c:if>
		&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="seachs();">搜索</a>
	</div>
	<div id="win" class="easyui-window" title="借款申请资料" style="width:80%;height:500px"
    data-options="iconCls:'icon-save',modal:true,closed:true">
    	<div class="limg" id="ld1"></div>
    	<div class="limg" id="ld2"></div>
    	<div class="limg" id="ld3"></div>
    	<div class="limg" id="ld4"></div>
    	<div class="limg" id="ld5"></div>
    	<div class="limg" id="ld6"></div>
    	<div class="limg" id="ld7"></div>
    	<div class="limg" id="ld8"></div>
	</div>
</body>
</html>