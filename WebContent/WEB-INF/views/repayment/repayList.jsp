<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>还款列表</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
<script type="text/javascript" src="<%=path %>/js/toDate.js"></script>

<style type="text/css">

.easyui-textbox{width:10%;}

.dj:link{color:orange;}

.jd:link{color:green;}
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
		}
	});
	
});

	//条件查询
	function seachs(){
		var username = $('#susername').textbox('getValue');
		var ltitle = $('#sltitle').textbox('getValue');
		var reperiods = $('#sreperiods').numberbox('getValue');
		var rstate = $('#srstate').combobox('getValue');
		$('#list').datagrid('load',{  
			username:username,
			ltitle:ltitle,
			reperiods:reperiods,
			rstate:rstate
		}); 
	}
	
	//用户名
	function userName(value){
		return value.username;
	}
	
	function ltitle(value){
		return value.ltitle;
	}
	
</script>
</head>
<body>
	<table id="list" class="easyui-datagrid" toolbar="#kj" style="width:100%" data-options="
		url:'<%=path %>/repayment/repayList',
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
				<th field="customer" width="10%" align="center" formatter="userName">用户名</th>
				<th field="loan" width="10%" align="center" formatter="ltitle">借款标题</th>
				<th field="reperiods" width="12%" align="center">期数</th>
				<th field="rexpiretime" width="10%" align="center" formatter="jsonDateFormat">到期时间</th>
				<th field="rmoney" width="10%" align="center">应还金额</th>
				<th field="rtype" width="10%" align="center">是否还款</th>
				<th field="rstate" width="12%" align="center">还款状态</th>
				<th field="rtime" width="12%" align="center" formatter="jsonDateFormat">还款时间</th>
			</tr>
		</thead>
	</table>
	
	<!-- 菜单 -->
	<div id="kj" style="padding: 2px;">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="window.print();">打印</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-export1'" onclick="location.href='#'">导出</a>
		用户名：<input id="susername" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		借款标题：<input id="sltitle" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		期数：<input id="sreperiods" class="easyui-validatebox easyui-numberbox" data-options="required:false" />&nbsp;
		还款状态：<select id="srstate" class="easyui-combobox" data-options="editable:false" style="width:10%">
			<option value=""> </option>
			<option value="借款">借款</option>
			<option value="利息">利息</option>
		</select>
		&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="seachs();">搜索</a>
	</div>
	
</body>
</html>